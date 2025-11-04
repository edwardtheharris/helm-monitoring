---
abstract: The readme for the Prometheus Helm chart.
date: 2025-10-30
title: Prometheus readme
---

[Prometheus](https://prometheus.io/), a
[Cloud Native Computing Foundation](https://cncf.io/) project, is a systems
and service monitoring system. It collects metrics from configured targets at
given intervals, evaluates rule expressions, displays the results, and can
trigger alerts if some condition is observed to be true.

This chart bootstraps a [Prometheus](https://prometheus.io/) deployment on a
[Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh)
package manager.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.7+

## Usage

The chart is distributed as an
[OCI Artifact](https://helm.sh/docs/topics/registries/) as well as via a
traditional [Helm Repository](https://helm.sh/docs/topics/chart_repository/).

- OCI Artifact: `oci://ghcr.io/prometheus-community/charts/prometheus`
- Helm Repository: `https://prometheus-community.github.io/helm-charts` with
chart `prometheus`

The installation instructions use the OCI registry. Refer to the
[`helm repo`]([`helm repo`](https://helm.sh/docs/helm/helm_repo/)) command
documentation for information on installing charts via the traditional
repository.

(install-chart)=

### Install Chart

Starting with version 16.0, the Prometheus chart requires Helm 3.7+ in order
to install successfully. Please check your `helm` release before installation.

```console
helm install [RELEASE_NAME] oci://ghcr.io/prometheus-community/charts/prometheus
```

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

(dependencies)=

### Dependencies

By default this chart installs additional, dependent charts:

- [alertmanager](https://github.com/prometheus-community/helm-charts/tree/main/charts/alertmanager)
- [kube-state-metrics](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-state-metrics)
- [prometheus-node-exporter](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-node-exporter)
- [prometheus-pushgateway](https://github.com/walker-tom/helm-charts/tree/main/charts/prometheus-pushgateway)

To disable the dependency during installation, set `alertmanager.enabled`,
`kube-state-metrics.enabled`, `prometheus-node-exporter.enabled` and
`prometheus-pushgateway.enabled` to `false`.

_See [helm dependency](https://helm.sh/docs/helm/helm_dependency/) for command documentation._

### Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart
and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

### Updating values.schema.json

A [`values.schema.json`](https://helm.sh/docs/topics/charts/#schema-files)
file has been added to validate chart values. When `values.yaml` file has a
structure change (i.e. add a new field, change value type, etc.), modify
`values.schema.json` file manually or run
`helm schema-gen values.yaml > values.schema.json` to ensure the schema is
aligned with the latest values. Refer to
[helm plugin `helm-schema-gen`](https://github.com/karuppiah7890/helm-schema-gen)
for plugin installation instructions.

(upgrading-chart)=

### Upgrading Chart

```console
helm upgrade prometheus \
  oci://ghcr.io/prometheus-community/charts/prometheus --install
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

#### Example Migration

Assuming you have an existing release of the prometheus chart, named
`prometheus-old`. In order to update to prometheus 2.x while keeping your old
data do the following:

1. Update the `prometheus-old` release. Disable scraping on every component
   besides the prometheus server, similar to the configuration below:

  ```{code-block} yaml
  alertmanager:
    enabled: false
  alertmanagerFiles:
    alertmanager.yml: ""
  kubeStateMetrics:
    enabled: false
  nodeExporter:
    enabled: false
  pushgateway:
    enabled: false
  server:
    extraArgs:
      storage.local.retention: 720h
  serverFiles:
    alerts: ""
    prometheus.yml: ""
    rules: ""
  ```

1. Deploy a new release of the chart with version 5.0+ using prometheus 2.x.
   In the values.yaml set the scrape config as usual, and also add the
   `prometheus-old` instance as a remote-read target.

   ```{code-block} yaml
    prometheus.yml:
      ...
      remote_read:
      - url: http://prometheus-old/api/v1/read
      ...
   ```

   Old data will be available when you query the new prometheus instance.

(configuration)=

## Configuration

See
[Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing).
To see all configurable options with detailed comments, visit the chart's
[values.yaml](./values.yaml), or run these configuration commands:

```console
helm show values oci://ghcr.io/prometheus-community/charts/prometheus
```

You may similarly use the above configuration commands on each chart
[dependency](#dependencies) to see its configurations.

### Scraping Pod Metrics via Annotations

This chart uses a default configuration that causes prometheus to scrape
a variety of kubernetes resource types, provided they have the correct
annotations. In this section we describe how to configure pods to be scraped;
for information on how other resource types can be scraped you can do a
`helm template` to get the kubernetes resource definitions, and then reference
the prometheus configuration in the ConfigMap against the prometheus
documentation for
[relabel_config](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#relabel_config)
and
aa[kubernetes_sd_config](https://prometheus.io/docs/prometheus/latest/configuration/configuration/#kubernetes_sd_config).

In order to get prometheus to scrape pods, you must add annotations to the
pods as below:

```{code-block} yaml
metadata:
  annotations:
    prometheus.io/scrape: "true"
    prometheus.io/path: /metrics
    prometheus.io/port: "8080"
```

You should adjust `prometheus.io/path` based on the URL that your pod serves
metrics from. `prometheus.io/port` should be set to the port that your pod
serves metrics from. Note that the values for `prometheus.io/scrape` and
`prometheus.io/port` must be enclosed in double quotes.

### Sharing Alerts Between Services

Note that when [installing](#install-chart) or [upgrading](#upgrading-chart)
you may use multiple values override files. This is particularly useful when
you have alerts belonging to multiple services in the cluster. For example,

```{code-block} yaml
# values.yaml
# ...

# service1-alert.yaml
serverFiles:
  alerts:
    service1:
      - alert: anAlert
      # ...

# service2-alert.yaml
serverFiles:
  alerts:
    service2:
      - alert: anAlert
      # ...
```

```{code-block} console
helm install prometheus \
  oci://ghcr.io/prometheus-community/charts/prom-label-proxy -f values.yaml
  -f service1-alert.yaml -f service2-alert.yaml
```

### RBAC Configuration

Roles and RoleBindings resources will be created automatically for `server` service.

To manually setup RBAC you need to set the parameter `rbac.create=false` and
specify the service account to be used for each service by setting the
parameters: `serviceAccounts.{{ component }}.create` to `false` and
`serviceAccounts.{{ component }}.name` to the name of a pre-existing service
account.

```{tip}
You can refer to the default `*-clusterrole.yaml` and
`*-clusterrolebinding.yaml` files in
[templates](path:templates/clusterrolebinding.yaml) to customize
your own.
```

### ConfigMap Files

AlertManager is configured through
[alertmanager.yml](https://prometheus.io/docs/alerting/configuration/). This
file (and any others listed in `alertmanagerFiles`) will be mounted into the
`alertmanager` pod.

Prometheus is configured through
[prometheus.yml](https://prometheus.io/docs/operating/configuration/). This
file (and any others listed in `serverFiles`) will be mounted into the `server`
pod.

### Ingress TLS

If your cluster allows automatic creation/retrieval of TLS certificates
(e.g. [cert-manager](https://github.com/jetstack/cert-manager)), please refer
to the documentation for that mechanism.

To manually configure TLS, first create/retrieve a key & certificate pair
for the address(es) you wish to protect. Then create a TLS secret
in the namespace:

```console
kubectl create secret tls prometheus-server-tls
  --cert=path/to/tls.cert --key=path/to/tls.key
```

Include the secret's name, along with the desired hostnames, in the
alertmanager/server Ingress TLS section of your custom `values.yaml` file:

```{code-block} yaml
server:
  ingress:
    ## If true, Prometheus server Ingress will be created
    ##
    enabled: true

    ## Prometheus server Ingress hostnames
    ## Must be provided if Ingress is enabled
    ##
    hosts:
      - prometheus.domain.com

    ## Prometheus server Ingress TLS configuration
    ## Secrets must be manually created in the namespace
    ##
    tls:
      - secretName: prometheus-server-tls
        hosts:
          - prometheus.domain.com
```

### NetworkPolicy

Enabling Network Policy for Prometheus will secure connections to Alert
Manager and Kube State Metrics by only accepting connections from Prometheus
Server. All inbound connections to Prometheus Server are still allowed.

To enable network policy for Prometheus, install a networking plugin that
implements the Kubernetes NetworkPolicy spec, and set `networkPolicy.enabled`
to true.

If NetworkPolicy is enabled for Prometheus' scrape targets, you may also need
to manually create a networkpolicy which allows it.

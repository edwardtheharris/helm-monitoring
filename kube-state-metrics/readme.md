---
title: kube-state-metrics Helm Chart readme
---

Installs the [kube-state-metrics](https://github.com/kubernetes/kube-state-metrics)

## Usage

The chart is distributed as an [OCI Artifact](https://helm.sh/docs/topics/registries/)
as well as via a traditional [Helm Repository](https://helm.sh/docs/topics/chart_repository/).

- [OCI Artifact](oci://ghcr.io/prometheus-community/charts/kube-state-metrics)
- [Helm Repository](https://prometheus-community.github.io/helm-charts) with chart kube-state-metrics.

The installation instructions use the OCI registry. Refer to the [helm repo](

) command documentation for information on installing charts via the traditional repository.

### Install Chart

```{code-block} shell
helm install [RELEASE_NAME] oci://ghcr.io/prometheus-community/charts/kube-state-metrics [flags]
```

See configuration below.

See `helm install` for command documentation.

### Uninstall Chart

```{code-block} shell
helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

See `helm uninstall` for command documentation.

### Upgrading Chart

```{code-block} shell
helm upgrade [RELEASE_NAME] oci://ghcr.io/prometheus-community/charts/kube-state-metrics [flags]
```

See helm upgrade for command documentation.

### Migrating from stable/kube-state-metrics and kubernetes/kube-state-metrics

You can upgrade in-place: 
your existing release name using the new chart repository

### Upgrading to v6.0.0

This version drops support for deprecated Pod Security Policy resources.
Upgrading to v3.0.0

v3.0.0 includes kube-state-metrics v2.0, see the

for major changes on the application-side.

The upgraded chart now the following changes:

- Dropped support for helm v2 (helm v3 or later is required)
- collectors key was renamed to resources
- namespace key was renamed to namespaces

#### Configuration

See. To see all configurable options with detailed comments:

```{code-block} shell
helm show values oci://ghcr.io/prometheus-community/charts/kube-state-metrics
```

## kube-rbac-proxy

You can enable kube-state-metrics endpoint protection using kube-rbac-proxy.
By setting `kubeRBACProxy.enabled: true`{l=yaml}, this chart will deploy
one RBAC proxy container
per endpoint (metrics & telemetry). To authorize access, authenticate your
requests (via a ServiceAccount for example) with a ClusterRole attached such as:

```{code-block} yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: kube-state-metrics-read
rules:
  - apiGroups: [ "" ]
    resources: ["services/kube-state-metrics"]
    verbs:
      - get
```

See [kube-rbac-proxy examples](https://github.com/brancz/kube-rbac-proxy/tree/master/examples/resource-attributes)
for more details.

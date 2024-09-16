---
abstract: Loki installation and configuration guide.
authors:
    - name: Xander Harris
      email: xandertheharris@gamil.com
date: 2024-08-04
title: Loki
---

## Installation

Follow this procedure to install the official Loki Helm chart.

```{note}
More information is available in the related
[documentation](https://grafana.com/docs/loki/latest/setup/install/helm/install-scalable/).
```

1. Add the Grafana chart repository.

   ```{code-block} shell
   helm repo add grafana https://grafana.github.io/helm-charts
   ```

2. Update the repository.

   ```{code-block} shell
   helm repo update
   ```

3. Adjust the values file as necessary.

   ```{code-block} yaml
   loki:
    schemaConfig:
        configs:
        - from: 2024-04-01
            store: tsdb
            object_store: s3
            schema: v13
            index:
            prefix: loki_index_
            period: 24h
    ingester:
        chunk_encoding: snappy
    tracing:
        enabled: true
    querier:
        # Default is 4, if you have enough memory and CPU you can increase, reduce if OOMing
        max_concurrent: 4

    #gateway:
    #  ingress:
    #    enabled: true
    #    hosts:
    #      - host: FIXME
    #        paths:
    #          - path: /
    #            pathType: Prefix

    deploymentMode: SimpleScalable

    backend:
    replicas: 3
    read:
    replicas: 3
    write:
    replicas: 3

    # Enable minio for storage
    minio:
    enabled: true

    # Zero out replica counts of other deployment modes
    singleBinary:
    replicas: 0

    ingester:
    replicas: 0
    querier:
    replicas: 0
    queryFrontend:
    replicas: 0
    queryScheduler:
    replicas: 0
    distributor:
    replicas: 0
    compactor:
    replicas: 0
    indexGateway:
    replicas: 0
    bloomCompactor:
    replicas: 0
    bloomGateway:
    replicas: 0
   ```

4. Install the chart.

   ```{code-block} shell
   helm upgrade --values values.yaml loki grafana/loki
   ```

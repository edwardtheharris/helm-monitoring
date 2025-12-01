---
abstract: Index for the Grafana chart.
date: 2025-10-28
title: Grafana Index
---

## {term}`Grafana`

This chart installs {term}`Grafana` for monitoring.

```{toctree}
readme
tests/index
```

### {term}`Grafana` {file}`values.yaml`

```{autoyaml} grafana/values.yaml
```

## {term}`Grafana` Chart Quick Start

The shortest path to a working {term}`Grafana` instance using this chart
follows.

1. Update your values file.

   ```{code-block} shell
   vi values.yaml
   ```

2. Create the monitoring namespace.

   ```{code-block} shell
   kubectl create ns monitoring
   ```

3. Add the admin user and password to the `grafana-admin` secret in the
   `monitoring` namespace.

   ```{code-block} shell
   kubectl edit --namespace monitoring creeate secret grafana-admin
   ```

4. Deploy the chart to the monitoring space.

   ```{code-block} shell
   kubectl upgrade --install --namespace monitoring grafana . -f values.yaml
   ```

```{sectionauthor} Xander Harris <xandertheharris@gmail.com>
```

<!-- <SUDO> -->

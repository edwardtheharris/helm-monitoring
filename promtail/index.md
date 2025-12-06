---
abstract: Index for promtail helm chart.
title: Promtail Helm Chart Index
---

## Grafana repository

This chart is included in the Grafana Helm repository.

You need only make a copy of the default values file and
update the copy for your needs then install it.

```{code-block} shell
helm upgrade --install promtail grafana/promtail -f your.values.yaml
```

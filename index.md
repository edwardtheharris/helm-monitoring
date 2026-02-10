---
abstract: >-
    Documentation index for the Helm Monitoring package.
authors:
   - name: Xander Harris
     email: xandertheharris@gmail.com
date: 2025-09-033
title: Monitoring Helm Chart
---

This repository contains charts to deploy a standardized Grafana/Prometheus
stack to bare metal {term}`Kubernetes` clusters.

## Repository Contents

````{sidebar}
```{contents}
```
````

```{toctree}
:caption: contents

grafana/index
loki/index
prometheus/index
prometheus-node-exporter/index
tests/index
```

```{toctree}
:caption: meta

.github/index
contributing
changelog
license
readme
security
```

## Indices and tables

* {ref}`genindex`
* {ref}`modindex`
* {ref}`search`

```{glossary}
GitHub
   Most likely the site this repository is hosted on. More information is
   available [here](https://github.com).

Helm
   A tool commonly used to deploy applications to {term}`Kubernetes`. More
   information is available [here](https://helm.sh).

Kubernetes
   An ancient Greek word that means 'sailor' or 'navigator', it is the
   most common container orchestration system currently in use. More
   information is available [here](https://kubernetes.io).
```

## Usage

Typical Helm chart rules.

### Chart

```{autoyaml} Chart.yaml
```

```{sectionauthor} Xander Harris <xandertheharris@gmail.com>
```
<!--
### Values

```{autoyaml} values.yaml
```
-->

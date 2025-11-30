---
abstract: >-
   Helm Template documentation master file, created by
   sphinx-quickstart on Sun Apr 28 15:35:08 2024.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.
authors: Xander Harris
date: 2024-04-28
title: Nautobot Helm Chart
---

## Repository Contents

```{contents}
```

```{toctree}
:caption: meta

container/index
license
readme
security
```

## Indices and tables

* {ref}`genindex`
* {ref}`modindex`
* {ref}`search`

## Usage

You'll need to provide either a MySQL or PostgreSQL server along with a Redis
server to deploy successfully.

### Install

To install this chart follow these steps.

1. Create a namespace.

   ```{code-block} shell
   kubectl create ns nautobot
   ```

2. Build the containers

   :::{code-block} shell
   docker build -t ghcr.io/edwardtheharris/helm-monitoring/nautobot/nautobot:0.0.1 \
      -f container/Dockerfile --target nautobot . --push
   docker build -t ghcr.io/edwardtheharris/helm-monitoring/nautobot/scheduler:0.0.1 \
      -f container/Dockerfile --target scheduler . --push
   docker build -t ghcr.io/edwardtheharris/helm-monitoring/nautobot/worker:0.0.1 \
      -f container/Dockerfile --target worker . --push
   :::

3. Install the unittest Helm plugin.

   ```{code-block} shell
   helm plugin install https://github.com/helm-unittest/helm-unittest
   ```

4. Run the unit tests.

   ```{code-block} shell
   helm unittest -f 'tests/*.yaml' .
   ```

   You should see output similar to this.

   ```{code-block} shell
   ### Chart [ nautobot ] .

   PASS  nautobot Service Test Suite    tests/service_test.yaml
   PASS  nautobot ServiceAccount Test Suite     tests/serviceaccount_test.yaml
   PASS  nautobot StatefulSet Test Suite        tests/statefulset_test.yaml

   Charts:      1 passed, 1 total
   Test Suites: 3 passed, 3 total
   Tests:       9 passed, 9 total
   Snapshot:    0 passed, 0 total
   Time:        92.722398ms
   ```

5. Install the chart with Helm.

   ```{code-block} shell
   helm -n nautobot install nautobot .
   ```

6. Run the tests included with Helm.

   ```{code-block} shell
   helm -n nautobot test nautobot
   ```

### Uninstall

This can be done in the usual way.

```{code-block} shell
helm -n nautobot uninstall nautobot
```

### Chart

```{autoyaml} Chart.yaml
```

### Values

```{autoyaml} values.yaml
```

:::{note}

A quick bit of sed to recursively edit files in-place.

```{code-block} shell
sed -i '' -e 's/csi-driver-lvm-linear/csi-lvm-linear/g' $(find ./ -type f)
```

:::

:::{code-block} shell
docker build -t ghcr.io/edwardtheharris/helm-monitoring/nautobot/nautobot:0.0.1 \
  -f container/Dockerfile --target nautobot . --push
:::

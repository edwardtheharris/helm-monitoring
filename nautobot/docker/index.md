---
abstract: >-
    How to build the containers required for this project.
authors:
  - name: Xander Harris
    email: xandertheharris@gmail.com
date: 2024-08-06
title: Nautobot Containers
---

{term}`Nautobot` requires a
[celery scheduler](https://docs.celeryq.dev/en/stable/userguide/periodic-tasks.html)
and at least one
[celery worker](https://docs.celeryq.dev/en/stable/userguide/workers.html)
for full functionality so containers
with those services running are included in the deployment along
with the code to build them in this directory.

To build the {term}`Nautobot` container you run the build command below.

```{note}
It's not strcitly required but having access to a Python virtual environment
with a working copy of [version-query](https://pypi.org/project/version-query/)
is helpful for determining the version.

There is a Pipfile to allow for easy installation of all build requirements.
```

## Build {term}`nautobot`

```{code-block} shell
:caption: build nautobot

make nautobot
```

```{code-block} shell
:caption: build nautobot with no cache

make nautobot CACHE='--no-cache'
```

## Build {term}`worker`



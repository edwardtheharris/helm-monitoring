---
abstract: A Helm Chart that will deploy Nautobot to your cluster.
authors:
    - name: Xander Harris
      email: xandertheharris@gmail.com
date: 2024-08-11
title: Readme
---

[![CodeQL](https://github.com/edwardtheharris/helm-nautobot/actions/workflows/codeql.yml/badge.svg)](https://github.com/edwardtheharris/helm-nautobot/actions/workflows/codeql.yml)
[![Documentation](https://github.com/edwardtheharris/helm-nautobot/actions/workflows/documentation.yml/badge.svg)](https://github.com/edwardtheharris/helm-nautobot/actions/workflows)
[![Helm Tests](https://github.com/edwardtheharris/helm-nautobot/actions/workflows/helm.yml/badge.svg)](https://github.com/edwardtheharris/helm-nautobot/actions/workflows/helm.yml)
[![OSSAR](https://github.com/edwardtheharris/helm-nautobot/actions/workflows/ossar.yml/badge.svg)](https://github.com/edwardtheharris/helm-nautobot/actions/workflows/ossar.yml)
[![wakatime](https://wakatime.com/badge/github/edwardtheharris/helm-nautobot.svg)](https://wakatime.com/badge/github/edwardtheharris/helm-nautobot)

A Helm Chart for installing Nautobot.

## Vault Secret Management

Because this chart requires a lot of secrets in addition to all of the usual
reasons, it's best to not keep them in an external secret manager such as
HashiCorp Vault.

The simplest method for injecting those secrets into the containers that
I've found is to use the
[Kubernetes CSI Secret Store Driver](https://developer.hashicorp.com/vault/tutorials/kubernetes-introduction/kubernetes-secret-store-driver)
provided by the Vault Agent.

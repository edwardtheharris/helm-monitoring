---
date: 2026-02-10
title: adminAPI values
---

## adminAPI chart values

````{list-table}
:header-rows: 1

- - Key	
  - Type	
  - Description	
  - Default
- - adminApi	
  - object	
  - Configuration for the `admin-api` target	
  - ```{code-block} json
      {
      "affinity": {},
      "annotations": {},
      "containerSecurityContext": {
        "allowPrivilegeEscalation": false,
        "capabilities": {
          "drop": [
            "ALL"
          ]
        },
        "readOnlyRootFilesystem": true
      },
      "dnsConfig": {},
      "env": [],
      "extraArgs": {},
      "extraContainers": [],
      "extraEnv": [],
      "extraEnvFrom": [],
      "extraVolumeMounts": [],
      "extraVolumes": [],
      "hostAliases": [],
      "hostUsers": "nil",
      "initContainers": [],
      "labels": {},
      "livenessProbe": {},
      "nodeSelector": {},
      "podSecurityContext": {
        "runAsGroup": 10001,
        "runAsNonRoot": true,
        "runAsUser": 10001
      },
      "readinessProbe": {
        "httpGet": {
          "path": "/ready",
          "port": "http-metrics"
        },
        "initialDelaySeconds": 45
      },
      "replicas": 1,
      "resources": {},
      "service": {
        "annotations": {},
        "labels": {}
      },
      "startupProbe": {},
      "strategy": {
        "type": "RollingUpdate"
      },
      "terminationGracePeriodSeconds": 60,
      "tolerations": [],
      "topologySpreadConstraints": []
    }
- - adminApi.affinity	
  - object	
  - Affinity for admin-api Pods The value will be passed through tpl.	
  - {}
- - adminApi.annotations	
  - object	
  - Additional annotations for the `admin-api` Deployment	
  - {}
    ```
`````

adminApi.dnsConfig	object	DNSConfig for `admin-api` pods	

{}

adminApi.env	list	Configure optional environment variables	

[]

adminApi.extraArgs	object	Additional CLI arguments for the `admin-api` target	

{}

adminApi.extraContainers	list	Configure optional extraContainers	

[]

adminApi.extraEnv	list	Environment variables to add to the admin-api pods	

[]

adminApi.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the admin-api pods	

[]

adminApi.extraVolumeMounts	list	Additional volume mounts for Pods	

[]

adminApi.extraVolumes	list	Additional volumes for Pods	

[]

adminApi.hostAliases	list	hostAliases to add	
[]

adminApi.hostUsers	string	Use the host's user namespace in admin-api pods	

"nil"

adminApi.initContainers	list	Configure optional initContainers	

[]

adminApi.labels	object	Additional labels for the `admin-api` Deployment	

{}

adminApi.livenessProbe	object	Liveness probe	

{}

adminApi.nodeSelector	object	Node selector for admin-api Pods	

{}

adminApi.podSecurityContext	object	Run container as user `enterprise-logs(uid=10001)` `fsGroup` must not be specified, because these security options are applied on container level not on Pod level.	

{
  "runAsGroup": 10001,
  "runAsNonRoot": true,
  "runAsUser": 10001
}

adminApi.readinessProbe	object	Readiness probe	

{
  "httpGet": {
    "path": "/ready",
    "port": "http-metrics"
  },
  "initialDelaySeconds": 45
}

adminApi.replicas	int	Define the amount of instances	

1

adminApi.resources	object	Values are defined in small.yaml and large.yaml	

{}

adminApi.service	object	Additional labels and annotations for the `admin-api` Service	

{
  "annotations": {},
  "labels": {}
}

adminApi.startupProbe	object	Startup probe	

{}

adminApi.strategy	object	Update strategy	

{
  "type": "RollingUpdate"
}

adminApi.terminationGracePeriodSeconds	int	Grace period to allow the admin-api to shutdown before it is killed	

60

adminApi.tolerations	list	Tolerations for admin-api Pods	

[]

adminApi.topologySpreadConstraints	list	Topology Spread Constraints for admin-api pods The value will be passed through tpl.	

[]

---
date: 2026-02-10
title: Loki Helm Chart Values
---

## Tables of Chart Values

```{toctree}
md/adminapi
md/backend
```

### singleBinary values

````{list-table}
:header-rows: 1

- - value
  - type
  - description
  - default
- - singleBinary.affinity
  - object
  - Affinity for single binary pods. The value will be passed through tpl.
  - Hard node anti-affinity
- - singleBinary.annotations
  - object
  - Annotations for single binary StatefulSet
  - {}
- - singleBinary.autoscaling.enabled
  - bool
  - Enable autoscaling
  - false
- - singleBinary.autoscaling.maxReplicas
  - int
  - Maximum autoscaling replicas for the single binary
  - 3
- - singleBinary.autoscaling.minReplicas
  - int
  - Minimum autoscaling replicas for the single binary
  - 1
- - singleBinary.autoscaling.targetCPUUtilizationPercentage
  - int
  - Target CPU utilisation percentage for the single binary
  - 60
- - singleBinary.autoscaling.targetMemoryUtilizationPercentage
  - string
  - Target memory utilisation percentage for the single binary
  - null
- - singleBinary.dnsConfig
  - object
  - DNS config for single binary pods
  - {}
- - singleBinary.extraArgs
  - list
  - Labels for single binary service
  - []
- - singleBinary.extraContainers
  - list
  - Extra containers to add to the single binary loki pod
  - []
- - singleBinary.extraEnv
  - list
  - Environment variables to add to the single binary pods
  - []
- - singleBinary.extraEnvFrom
  - list
  - Environment variables from secrets or configmaps to add to the single binary pods
  - []
- - singleBinary.extraVolumeMounts
  - list
  - Volume mounts to add to the single binary pods
  - []
- - singleBinary.extraVolumes
  - list
  - Volumes to add to the single binary pods
  - []
- - singleBinary.hostUsers
  - string
  - Use the host's user namespace in the single binary pods
  - "nil"
- - singleBinary.image.registry
  - string
  - The Docker registry for the single binary image. Overrides `loki.image.registry`
  - null
- - singleBinary.image.repository
  - string
  - Docker image repository for the single binary image. Overrides `loki.image.repository`
  - null
- - singleBinary.image.tag
  - string
  - Docker image tag for the single binary image. Overrides `loki.image.tag`
  - null
- - singleBinary.initContainers
  - list
  - Init containers to add to the single binary pods
  - []
- - singleBinary.nodeSelector
  - object
  - Node selector for single binary pods
  - {}
- - singleBinary.persistence.accessModes
  - list
  - Set access modes on the PersistentVolumeClaim
  - ```{code-block} json
    [
      "ReadWriteOnce"
    ]
    ```
- - singleBinary.persistence.annotations
  - object
  - Annotations for volume claim
  - {}
- - singleBinary.persistence.enableStatefulSetAutoDeletePVC
  - bool
  - Enable StatefulSetAutoDeletePVC feature
  - true
- - singleBinary.persistence.enableStatefulSetRecreationForSizeChange
  - bool
  - Enable StatefulSetRecreation for changes to PVC size. This means that the StatefulSet will be deleted, recreated (with the same name) and rolled when a change to the PVC size is detected. That way the PVC can be resized without manual intervention.
  - false
- - singleBinary.persistence.enabled
  - bool
  - Enable persistent disk
  - true
- - singleBinary.persistence.labels
  - object
  - Labels for volume claim
  - {}
- - singleBinary.persistence.selector
  - string
  - Selector for persistent disk
  - null
- - singleBinary.persistence.size
  - string
  - Size of persistent disk
  - "10Gi"
- - `singleBinary.persistence.storageClass`
  - string
  - Storage class to be used. If defined, storageClassName: .
    If set to "-", storageClassName: "",
    which disables dynamic provisioning. If empty or set to null,
    no storageClassName spec is set, choosing the default
    provisioner (gp2 on AWS, standard on GKE, AWS, and OpenStack).
  - null
- - singleBinary.persistence.whenDeleted
  - string
  - What to do with the volumes when the StatefulSet is deleted.
  - "Delete"
- - singleBinary.persistence.whenScaled
  - string
  - What to do with the volume when the StatefulSet is scaled down.
  - "Delete"
- - singleBinary.podAnnotations
  - object
  - Annotations for single binary pods
  - {}
- - singleBinary.podLabels
  - object
  - Additional labels for each `single binary` pod
  - {}
- - singleBinary.priorityClassName
  - string
  - The name of the PriorityClass for single binary pods
  - null
- - singleBinary.replicas
  - int
  - Number of replicas for the single binary
  - 0
- - singleBinary.resources
  - object
  - Resource requests and limits for the single binary
  - {}
- - singleBinary.selectorLabels
  - object
  - Additional selector labels for each `single binary` pod
  - {}
- - singleBinary.service.annotations
  - object
  - Annotations for single binary Service
  - {}
- - singleBinary.service.labels
  - object
  - Additional labels for single binary Service
  - {}
- - singleBinary.service.type
  - string
  - Service Type for single binary Service
  - "ClusterIP"
- - singleBinary.targetModule
  - string
  - Comma-separated list of Loki modules to load for the single binary
  - "all"
- - singleBinary.terminationGracePeriodSeconds
  - int
  - Grace period to allow the single binary to shutdown before it is killed
  - 30
- - singleBinary.tolerations
  - list
  - Tolerations for single binary pods
  - []
````

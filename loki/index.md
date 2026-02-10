---
date: 2026-02-10
title: Loki Helm Chart Values
---

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
  ```
`````

adminApi.affinity	object	Affinity for admin-api Pods The value will be passed through tpl.	

{}

adminApi.annotations	object	Additional annotations for the `admin-api` Deployment	

{}

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

backend	object	Configuration for the backend pod(s)	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "backend",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "annotations": {},
  "autoscaling": {
    "behavior": {},
    "enabled": false,
    "maxReplicas": 6,
    "minReplicas": 3,
    "targetCPUUtilizationPercentage": 60,
    "targetMemoryUtilizationPercentage": null
  },
  "dnsConfig": {},
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "nodeSelector": {},
  "persistence": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "annotations": {},
    "dataVolumeParameters": {
      "emptyDir": {}
    },
    "enableStatefulSetAutoDeletePVC": true,
    "labels": {},
    "selector": null,
    "size": "10Gi",
    "storageClass": null,
    "volumeClaimsEnabled": true
  },
  "podAnnotations": {},
  "podLabels": {},
  "podManagementPolicy": "Parallel",
  "priorityClassName": null,
  "replicas": 3,
  "resources": {},
  "selectorLabels": {},
  "service": {
    "annotations": {},
    "labels": {},
    "type": "ClusterIP"
  },
  "targetModule": "backend",
  "terminationGracePeriodSeconds": 300,
  "tolerations": [],
  "topologySpreadConstraints": []
}

backend.affinity	object	Affinity for backend pods. The value will be passed through tpl.	

Hard node anti-affinity

backend.annotations	object	Annotations for backend StatefulSet	

{}

backend.autoscaling.behavior	object	Behavior policies while scaling.	

{}

backend.autoscaling.enabled	bool	Enable autoscaling for the backend.	

false

backend.autoscaling.maxReplicas	int	Maximum autoscaling replicas for the backend.	

6

backend.autoscaling.minReplicas	int	Minimum autoscaling replicas for the backend.	

3

backend.autoscaling.targetCPUUtilizationPercentage	int	Target CPU utilization percentage for the backend.	

60

backend.autoscaling.targetMemoryUtilizationPercentage	string	Target memory utilization percentage for the backend.	

null

backend.dnsConfig	object	DNS config for backend pods	

{}

backend.extraArgs	list	Additional CLI args for the backend	

[]

backend.extraContainers	list	Containers to add to the backend pods	

[]

backend.extraEnv	list	Environment variables to add to the backend pods	

[]

backend.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the backend pods	

[]

backend.extraVolumeMounts	list	Volume mounts to add to the backend pods	

[]

backend.extraVolumes	list	Volumes to add to the backend pods	

[]

backend.hostUsers	string	Use the host's user namespace in the backend pods.	

"nil"

backend.image.registry	string	The Docker registry for the backend image. Overrides `loki.image.registry`	

null

backend.image.repository	string	Docker image repository for the backend image. Overrides `loki.image.repository`	

null

backend.image.tag	string	Docker image tag for the backend image. Overrides `loki.image.tag`	

null

backend.initContainers	list	Init containers to add to the backend pods	

[]

backend.nodeSelector	object	Node selector for backend pods	

{}

backend.persistence.accessModes	list	Set access modes on the PersistentVolumeClaim	

[
  "ReadWriteOnce"
]

backend.persistence.annotations	object	Annotations for volume claim	

{}

backend.persistence.dataVolumeParameters	object	Parameters used for the `data` volume when volumeClaimEnabled if false	

{
  "emptyDir": {}
}

backend.persistence.enableStatefulSetAutoDeletePVC	bool	Enable StatefulSetAutoDeletePVC feature	

true

backend.persistence.labels	object	Labels for volume claim	

{}

backend.persistence.selector	string	Selector for persistent disk	

null

backend.persistence.size	string	Size of persistent disk	

"10Gi"

backend.persistence.storageClass	string	Storage class to be used. If defined, storageClassName: . If set to "-", storageClassName: "", which disables dynamic provisioning. If empty or set to null, no storageClassName spec is set, choosing the default provisioner (gp2 on AWS, standard on GKE, AWS, and OpenStack).	

null

backend.persistence.volumeClaimsEnabled	bool	Enable volume claims in pod spec	

true

backend.podAnnotations	object	Annotations for backend pods	

{}

backend.podLabels	object	Additional labels for each `backend` pod	

{}

backend.podManagementPolicy	string	The default is to deploy all pods in parallel.	

"Parallel"

backend.priorityClassName	string	The name of the PriorityClass for backend pods	

null

backend.replicas	int	Number of replicas for the backend	

3

backend.resources	object	Resource requests and limits for the backend	

{}

backend.selectorLabels	object	Additional selector labels for each `backend` pod	

{}

backend.service.annotations	object	Annotations for backend Service	

{}

backend.service.labels	object	Additional labels for backend Service	

{}

backend.service.type	string	Service type for backend Service	

"ClusterIP"

backend.targetModule	string	Comma-separated list of Loki modules to load for the backend	

"backend"

backend.terminationGracePeriodSeconds	int	Grace period to allow the backend to shutdown before it is killed. Especially for the ingester, this must be increased. It must be long enough so backends can be gracefully shutdown flushing/transferring all data and to successfully leave the member ring on shutdown.	

300

backend.tolerations	list	Tolerations for backend pods	

[]

backend.topologySpreadConstraints	list	Topology Spread Constraints for backend pods The value will be passed through tpl.	

[]

bloomBuilder	object	Configuration for the bloom-builder	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "bloom-builder",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "autoscaling": {
    "behavior": {
      "enabled": false,
      "scaleDown": {},
      "scaleUp": {}
    },
    "customMetrics": [],
    "enabled": false,
    "maxReplicas": 3,
    "minReplicas": 1,
    "targetCPUUtilizationPercentage": 60,
    "targetMemoryUtilizationPercentage": null
  },
  "command": null,
  "dnsConfig": {},
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "maxUnavailable": null,
  "nodeSelector": {},
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "replicas": 0,
  "resources": {},
  "serviceAnnotations": {},
  "serviceLabels": {},
  "terminationGracePeriodSeconds": 30,
  "tolerations": []
}

bloomBuilder.affinity	object	Affinity for bloom-builder pods. The value will be passed through tpl.	

Hard node anti-affinity

bloomBuilder.appProtocol	object	Adds the appProtocol field to the queryFrontend service. This allows bloomBuilder to work with istio protocol selection.	

{
  "grpc": ""
}

bloomBuilder.appProtocol.grpc	string	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

""

bloomBuilder.autoscaling.behavior.enabled	bool	Enable autoscaling behaviours	

false

bloomBuilder.autoscaling.behavior.scaleDown	object	define scale down policies, must conform to HPAScalingRules	

{}

bloomBuilder.autoscaling.behavior.scaleUp	object	define scale up policies, must conform to HPAScalingRules	

{}

bloomBuilder.autoscaling.customMetrics	list	Allows one to define custom metrics using the HPA/v2 schema (for example, Pods, Object or External metrics)	

[]

bloomBuilder.autoscaling.enabled	bool	Enable autoscaling for the bloom-builder	

false

bloomBuilder.autoscaling.maxReplicas	int	Maximum autoscaling replicas for the bloom-builder	

3

bloomBuilder.autoscaling.minReplicas	int	Minimum autoscaling replicas for the bloom-builder	

1

bloomBuilder.autoscaling.targetCPUUtilizationPercentage	int	Target CPU utilisation percentage for the bloom-builder	

60

bloomBuilder.autoscaling.targetMemoryUtilizationPercentage	string	Target memory utilisation percentage for the bloom-builder	

null

bloomBuilder.command	string	Command to execute instead of defined in Docker image	

null

bloomBuilder.dnsConfig	object	DNSConfig for bloom-builder pods	

{}

bloomBuilder.extraArgs	list	Additional CLI args for the bloom-builder	

[]

bloomBuilder.extraContainers	list	Containers to add to the bloom-builder pods	

[]

bloomBuilder.extraEnv	list	Environment variables to add to the bloom-builder pods	

[]

bloomBuilder.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the bloom-builder pods	

[]

bloomBuilder.extraVolumeMounts	list	Volume mounts to add to the bloom-builder pods	

[]

bloomBuilder.extraVolumes	list	Volumes to add to the bloom-builder pods	

[]

bloomBuilder.hostAliases	list	hostAliases to add	

[]

bloomBuilder.hostUsers	string	Use the host's user namespace in the boom-builder	

"nil"

bloomBuilder.image.registry	string	The Docker registry for the bloom-builder image. Overrides `loki.image.registry`	

null

bloomBuilder.image.repository	string	Docker image repository for the bloom-builder image. Overrides `loki.image.repository`	

null

bloomBuilder.image.tag	string	Docker image tag for the bloom-builder image. Overrides `loki.image.tag`	

null

bloomBuilder.initContainers	list	Init containers to add to the bloom-builder pods	

[]

bloomBuilder.maxUnavailable	string	Pod Disruption Budget maxUnavailable	

null

bloomBuilder.nodeSelector	object	Node selector for bloom-builder pods	

{}

bloomBuilder.podAnnotations	object	Annotations for bloom-builder pods	

{}

bloomBuilder.podLabels	object	Labels for bloom-builder pods	

{}

bloomBuilder.priorityClassName	string	The name of the PriorityClass for bloom-builder pods	

null

bloomBuilder.replicas	int	Number of replicas for the bloom-builder	

0

bloomBuilder.resources	object	Resource requests and limits for the bloom-builder	

{}

bloomBuilder.serviceAnnotations	object	Annotations for bloom-builder service	

{}

bloomBuilder.serviceLabels	object	Labels for bloom-builder service	

{}

bloomBuilder.terminationGracePeriodSeconds	int	Grace period to allow the bloom-builder to shutdown before it is killed	

30

bloomBuilder.tolerations	list	Tolerations for bloom-builder pods	

[]

bloomGateway	object	Configuration for the bloom-gateway	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "bloom-gateway",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "command": null,
  "dnsConfig": {},
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "livenessProbe": {},
  "nodeSelector": {},
  "persistence": {
    "annotations": {},
    "claims": [
      {
        "accessModes": [
          "ReadWriteOnce"
        ],
        "name": "data",
        "size": "10Gi",
        "storageClass": null
      }
    ],
    "enableStatefulSetAutoDeletePVC": false,
    "enabled": false,
    "labels": {},
    "whenDeleted": "Retain",
    "whenScaled": "Retain"
  },
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "readinessProbe": {},
  "replicas": 0,
  "resources": {},
  "serviceAccount": {
    "annotations": {},
    "automountServiceAccountToken": true,
    "create": false,
    "imagePullSecrets": [],
    "name": null
  },
  "serviceAnnotations": {},
  "serviceLabels": {},
  "startupProbe": {},
  "terminationGracePeriodSeconds": 30,
  "tolerations": []
}

bloomGateway.affinity	object	Affinity for bloom-gateway pods. The value will be passed through tpl.	

Hard node anti-affinity

bloomGateway.appProtocol	object	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

{
  "grpc": ""
}

bloomGateway.command	string	Command to execute instead of defined in Docker image	

null

bloomGateway.dnsConfig	object	DNSConfig for bloom-gateway pods	

{}

bloomGateway.extraArgs	list	Additional CLI args for the bloom-gateway	

[]

bloomGateway.extraContainers	list	Containers to add to the bloom-gateway pods	

[]

bloomGateway.extraEnv	list	Environment variables to add to the bloom-gateway pods	

[]

bloomGateway.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the bloom-gateway pods	

[]

bloomGateway.extraVolumeMounts	list	Volume mounts to add to the bloom-gateway pods	

[]

bloomGateway.extraVolumes	list	Volumes to add to the bloom-gateway pods	

[]

bloomGateway.hostAliases	list	hostAliases to add	

[]

bloomGateway.hostUsers	string	Use the host's user namespace in the bloom-gateway	

"nil"

bloomGateway.image.registry	string	The Docker registry for the bloom-gateway image. Overrides `loki.image.registry`	

null

bloomGateway.image.repository	string	Docker image repository for the bloom-gateway image. Overrides `loki.image.repository`	

null

bloomGateway.image.tag	string	Docker image tag for the bloom-gateway image. Overrides `loki.image.tag`	

null

bloomGateway.initContainers	list	Init containers to add to the bloom-gateway pods	

[]

bloomGateway.livenessProbe	object	liveness probe settings for ingester pods. If empty use `loki.livenessProbe`	

{}

bloomGateway.nodeSelector	object	Node selector for bloom-gateway pods	

{}

bloomGateway.persistence.annotations	object	Annotations for bloom-gateway PVCs	

{}

bloomGateway.persistence.claims	list	List of the bloom-gateway PVCs	

bloomGateway.persistence.claims[0].accessModes	list	Set access modes on the PersistentVolumeClaim	

[
  "ReadWriteOnce"
]

bloomGateway.persistence.claims[0].size	string	Size of persistent disk	

"10Gi"

bloomGateway.persistence.enableStatefulSetAutoDeletePVC	bool	Enable StatefulSetAutoDeletePVC feature	

false

bloomGateway.persistence.enabled	bool	Enable creating PVCs for the bloom-gateway	

false

bloomGateway.persistence.labels	object	Labels for bloom gateway PVCs	

{}

bloomGateway.podAnnotations	object	Annotations for bloom-gateway pods	

{}

bloomGateway.podLabels	object	Labels for bloom-gateway pods	

{}

bloomGateway.priorityClassName	string	The name of the PriorityClass for bloom-gateway pods	

null

bloomGateway.readinessProbe	object	readiness probe settings for ingester pods. If empty, use `loki.readinessProbe`	

{}

bloomGateway.replicas	int	Number of replicas for the bloom-gateway	

0

bloomGateway.resources	object	Resource requests and limits for the bloom-gateway	

{}

bloomGateway.serviceAccount.annotations	object	Annotations for the bloom-gateway service account	

{}

bloomGateway.serviceAccount.automountServiceAccountToken	bool	Set this toggle to false to opt out of automounting API credentials for the service account	

true

bloomGateway.serviceAccount.imagePullSecrets	list	Image pull secrets for the bloom-gateway service account	

[]

bloomGateway.serviceAccount.name	string	The name of the ServiceAccount to use for the bloom-gateway. If not set and create is true, a name is generated by appending "-bloom-gateway" to the common ServiceAccount.	

null

bloomGateway.serviceAnnotations	object	Annotations for bloom-gateway service	

{}

bloomGateway.serviceLabels	object	Labels for bloom-gateway service	

{}

bloomGateway.startupProbe	object	startup probe settings for ingester pods. If empty, use `loki.startupProbe`	

{}

bloomGateway.terminationGracePeriodSeconds	int	Grace period to allow the bloom-gateway to shutdown before it is killed	

30

bloomGateway.tolerations	list	Tolerations for bloom-gateway pods	

[]

bloomPlanner	object	Configuration for the bloom-planner	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "bloom-planner",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "command": null,
  "dnsConfig": {},
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "livenessProbe": {},
  "nodeSelector": {},
  "persistence": {
    "claims": [
      {
        "accessModes": [
          "ReadWriteOnce"
        ],
        "annotations": {},
        "labels": {},
        "name": "data",
        "size": "10Gi",
        "storageClass": null
      }
    ],
    "enableStatefulSetAutoDeletePVC": false,
    "enabled": false,
    "whenDeleted": "Retain",
    "whenScaled": "Retain"
  },
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "readinessProbe": {},
  "replicas": 0,
  "resources": {},
  "serviceAccount": {
    "annotations": {},
    "automountServiceAccountToken": true,
    "create": false,
    "imagePullSecrets": [],
    "name": null
  },
  "serviceAnnotations": {},
  "serviceLabels": {},
  "startupProbe": {},
  "terminationGracePeriodSeconds": 30,
  "tolerations": []
}

bloomPlanner.affinity	object	Affinity for bloom-planner pods. The value will be passed through tpl.	

Hard node anti-affinity

bloomPlanner.appProtocol	object	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

{
  "grpc": ""
}

bloomPlanner.command	string	Command to execute instead of defined in Docker image	

null

bloomPlanner.dnsConfig	object	DNSConfig for bloom-planner pods	

{}

bloomPlanner.extraArgs	list	Additional CLI args for the bloom-planner	

[]

bloomPlanner.extraContainers	list	Containers to add to the bloom-planner pods	

[]

bloomPlanner.extraEnv	list	Environment variables to add to the bloom-planner pods	

[]

bloomPlanner.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the bloom-planner pods	

[]

bloomPlanner.extraVolumeMounts	list	Volume mounts to add to the bloom-planner pods	

[]

bloomPlanner.extraVolumes	list	Volumes to add to the bloom-planner pods	

[]

bloomPlanner.hostAliases	list	hostAliases to add	

[]

bloomPlanner.hostUsers	string	Use the host's user namespace in the bloom-planner	

"nil"

bloomPlanner.image.registry	string	The Docker registry for the bloom-planner image. Overrides `loki.image.registry`	

null

bloomPlanner.image.repository	string	Docker image repository for the bloom-planner image. Overrides `loki.image.repository`	

null

bloomPlanner.image.tag	string	Docker image tag for the bloom-planner image. Overrides `loki.image.tag`	

null

bloomPlanner.initContainers	list	Init containers to add to the bloom-planner pods	

[]

bloomPlanner.livenessProbe	object	liveness probe settings for ingester pods. If empty use `loki.livenessProbe`	

{}

bloomPlanner.nodeSelector	object	Node selector for bloom-planner pods	

{}

bloomPlanner.persistence.claims	list	List of the bloom-planner PVCs	

bloomPlanner.persistence.claims[0].accessModes	list	Set access modes on the PersistentVolumeClaim	

[
  "ReadWriteOnce"
]

bloomPlanner.persistence.claims[0].annotations	object	Annotations for bloom-planner PVCs	

{}

bloomPlanner.persistence.claims[0].labels	object	Labels for bloom planner PVCs	

{}

bloomPlanner.persistence.claims[0].size	string	Size of persistent disk	

"10Gi"

bloomPlanner.persistence.enableStatefulSetAutoDeletePVC	bool	Enable StatefulSetAutoDeletePVC feature	

false

bloomPlanner.persistence.enabled	bool	Enable creating PVCs for the bloom-planner	

false

bloomPlanner.podAnnotations	object	Annotations for bloom-planner pods	

{}

bloomPlanner.podLabels	object	Labels for bloom-planner pods	

{}

bloomPlanner.priorityClassName	string	The name of the PriorityClass for bloom-planner pods	

null

bloomPlanner.readinessProbe	object	readiness probe settings for ingester pods. If empty, use `loki.readinessProbe`	

{}

bloomPlanner.replicas	int	Number of replicas for the bloom-planner	

0

bloomPlanner.resources	object	Resource requests and limits for the bloom-planner	

{}

bloomPlanner.serviceAccount.annotations	object	Annotations for the bloom-planner service account	

{}

bloomPlanner.serviceAccount.automountServiceAccountToken	bool	Set this toggle to false to opt out of automounting API credentials for the service account	

true

bloomPlanner.serviceAccount.imagePullSecrets	list	Image pull secrets for the bloom-planner service account	

[]

bloomPlanner.serviceAccount.name	string	The name of the ServiceAccount to use for the bloom-planner. If not set and create is true, a name is generated by appending "-bloom-planner" to the common ServiceAccount.	

null

bloomPlanner.serviceAnnotations	object	Annotations for bloom-planner service	

{}

bloomPlanner.serviceLabels	object	Labels for bloom-planner service	

{}

bloomPlanner.startupProbe	object	startup probe settings for ingester pods. If empty use `loki.startupProbe`	

{}

bloomPlanner.terminationGracePeriodSeconds	int	Grace period to allow the bloom-planner to shutdown before it is killed	

30

bloomPlanner.tolerations	list	Tolerations for bloom-planner pods	

[]

chunksCache.addresses	string	Comma separated addresses list in DNS Service Discovery format	

"dnssrvnoa+_memcached-client._tcp.{{ include \"loki.resourceName\" (dict \"ctx\" $ \"component\" \"chunks-cache\" \"suffix\" $.Values.chunksCache.suffix ) }}.{{ include \"loki.namespace\" $ }}.svc"

chunksCache.affinity	object	Affinity for chunks-cache pods	

{}

chunksCache.allocatedMemory	int	Amount of memory allocated to chunks-cache for object storage (in MB).	

8192

chunksCache.annotations	object	Annotations for the chunks-cache pods	

{}

chunksCache.batchSize	int	Batchsize for sending and receiving chunks from chunks cache	

4

chunksCache.connectionLimit	int	Maximum number of connections allowed	

16384

chunksCache.defaultValidity	string	Specify how long cached chunks should be stored in the chunks-cache before being expired	

"0s"

chunksCache.dnsConfig	object	DNSConfig for chunks-cache	

{}

chunksCache.enabled	bool	Specifies whether memcached based chunks-cache should be enabled	

true

chunksCache.extraArgs	object	Additional CLI args for chunks-cache	

{}

chunksCache.extraContainers	list	Additional containers to be added to the chunks-cache pod.	

[]

chunksCache.extraExtendedOptions	string	Add extended options for chunks-cache memcached container. The format is the same as for the memcached -o/--extend flag. Example: extraExtendedOptions: 'tls,no_hashexpand'	

""

chunksCache.extraVolumeMounts	list	Additional volume mounts to be added to the chunks-cache pod (applies to both memcached and exporter containers). Example: extraVolumeMounts: - name: extra-volume mountPath: /etc/extra-volume readOnly: true	

[]

chunksCache.extraVolumes	list	Additional volumes to be added to the chunks-cache pod (applies to both memcached and exporter containers). Example: extraVolumes: - name: extra-volume secret: secretName: extra-volume-secret	

[]

chunksCache.hostUsers	string	Use the host's user namespace in chunks-cache pods	

"nil"

chunksCache.initContainers	list	Extra init containers for chunks-cache pods	

[]

chunksCache.l2	object	l2 memcache configuration	

{
  "addresses": "dnssrvnoa+_memcached-client._tcp.{{ include \"loki.resourceName\" (dict \"ctx\" $ \"component\" \"chunks-cache\" \"suffix\" $.Values.chunksCache.l2.suffix ) }}.{{ include \"loki.namespace\" $ }}.svc",
  "affinity": {},
  "allocatedMemory": 8192,
  "annotations": {},
  "batchSize": 4,
  "connectionLimit": 16384,
  "defaultValidity": "0s",
  "dnsConfig": {},
  "enabled": false,
  "extraArgs": {},
  "extraContainers": [],
  "extraExtendedOptions": "",
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostUsers": "nil",
  "initContainers": [],
  "l2ChunkCacheHandoff": "345600s",
  "maxItemMemory": 5,
  "maxUnavailable": 1,
  "nodeSelector": {},
  "parallelism": 5,
  "persistence": {
    "enabled": false,
    "labels": {},
    "mountPath": "/data",
    "storageClass": null,
    "storageSize": "10G"
  },
  "podAnnotations": {},
  "podLabels": {},
  "podManagementPolicy": "Parallel",
  "port": 11211,
  "priorityClassName": null,
  "replicas": 1,
  "resources": null,
  "service": {
    "annotations": {},
    "labels": {}
  },
  "statefulStrategy": {
    "type": "RollingUpdate"
  },
  "suffix": "l2",
  "terminationGracePeriodSeconds": 60,
  "timeout": "2000ms",
  "tolerations": [],
  "topologySpreadConstraints": [],
  "writebackBuffer": 500000,
  "writebackParallelism": 1,
  "writebackSizeLimit": "500MB"
}

chunksCache.l2.addresses	string	Comma separated addresses list in DNS Service Discovery format	

"dnssrvnoa+_memcached-client._tcp.{{ include \"loki.resourceName\" (dict \"ctx\" $ \"component\" \"chunks-cache\" \"suffix\" $.Values.chunksCache.l2.suffix ) }}.{{ include \"loki.namespace\" $ }}.svc"

chunksCache.l2.affinity	object	Affinity for chunks-cache-l2 pods	

{}

chunksCache.l2.allocatedMemory	int	Amount of memory allocated to chunks-cache-l2 for object storage (in MB).	

8192

chunksCache.l2.annotations	object	Annotations for the chunks-cache-l2 pods	

{}

chunksCache.l2.batchSize	int	Batchsize for sending and receiving chunks from chunks cache	

4

chunksCache.l2.connectionLimit	int	Maximum number of connections allowed	

16384

chunksCache.l2.defaultValidity	string	Specify how long cached chunks should be stored in the chunks-cache-l2 before being expired	

"0s"

chunksCache.l2.dnsConfig	object	DNSConfig for chunks-cache-l2	

{}

chunksCache.l2.enabled	bool	Specifies whether memcached based chunks-cache-l2 should be enabled	

false

chunksCache.l2.extraArgs	object	Additional CLI args for chunks-cache-l2	

{}

chunksCache.l2.extraContainers	list	Additional containers to be added to the chunks-cache-l2 pod.	

[]

chunksCache.l2.extraExtendedOptions	string	Add extended options for chunks-cache-l2 memcached container. The format is the same as for the memcached -o/--extend flag. Example: extraExtendedOptions: 'tls,no_hashexpand'	

""

chunksCache.l2.extraVolumeMounts	list	Additional volume mounts to be added to the chunks-cache-l2 pod (applies to both memcached and exporter containers). Example: extraVolumeMounts: - name: extra-volume mountPath: /etc/extra-volume readOnly: true	

[]

chunksCache.l2.extraVolumes	list	Additional volumes to be added to the chunks-cache-l2 pod (applies to both memcached and exporter containers). Example: extraVolumes: - name: extra-volume secret: secretName: extra-volume-secret	

[]

chunksCache.l2.hostUsers	string	Use the host's user namespace in chunks-cache-l2 pods	

"nil"

chunksCache.l2.initContainers	list	Extra init containers for chunks-cache-l2 pods	

[]

chunksCache.l2.l2ChunkCacheHandoff	string	The age of chunks should be transfered from l1 cache to l2 4 days	

"345600s"

chunksCache.l2.maxItemMemory	int	Maximum item memory for chunks-cache-l2 (in MB).	

5

chunksCache.l2.maxUnavailable	int	Pod Disruption Budget maxUnavailable	

1

chunksCache.l2.nodeSelector	object	Node selector for chunks-cach-l2 pods	

{}

chunksCache.l2.parallelism	int	Parallel threads for sending and receiving chunks from chunks cache	

5

chunksCache.l2.persistence	object	Persistence settings for the chunks-cache-l2	

{
  "enabled": false,
  "labels": {},
  "mountPath": "/data",
  "storageClass": null,
  "storageSize": "10G"
}

chunksCache.l2.persistence.enabled	bool	Enable creating PVCs for the chunks-cache-l2	

false

chunksCache.l2.persistence.mountPath	string	Volume mount path	

"/data"

chunksCache.l2.persistence.storageClass	string	Storage class to be used. If defined, storageClassName: . If set to "-", storageClassName: "", which disables dynamic provisioning. If empty or set to null, no storageClassName spec is set, choosing the default provisioner (gp2 on AWS, standard on GKE, AWS, and OpenStack).	

null

chunksCache.l2.persistence.storageSize	string	Size of persistent disk, must be in G or Gi	

"10G"

chunksCache.l2.podAnnotations	object	Annotations for chunks-cache-l2 pods	

{}

chunksCache.l2.podLabels	object	Labels for chunks-cache-l2 pods	

{}

chunksCache.l2.podManagementPolicy	string	Management policy for chunks-cache-l2 pods	

"Parallel"

chunksCache.l2.port	int	Port of the chunks-cache-l2 service	

11211

chunksCache.l2.priorityClassName	string	The name of the PriorityClass for chunks-cache-l2 pods	

null

chunksCache.l2.replicas	int	Specify how long cached chunks should be stored in the chunks-cache-l2 before being expired	

1

chunksCache.l2.resources	string	Resource requests and limits for the chunks-cache-l2 By default a safe memory limit will be requested based on allocatedMemory value (floor (* 1.2 allocatedMemory)).	

null

chunksCache.l2.service	object	Service annotations and labels	

{
  "annotations": {},
  "labels": {}
}

chunksCache.l2.statefulStrategy	object	Stateful chunks-cache strategy	

{
  "type": "RollingUpdate"
}

chunksCache.l2.suffix	string	Append to the name of the resources to make names different for l1 and l2	

"l2"

chunksCache.l2.terminationGracePeriodSeconds	int	Grace period to allow the chunks-cache-l2 to shutdown before it is killed	

60

chunksCache.l2.timeout	string	Memcached operation timeout	

"2000ms"

chunksCache.l2.tolerations	list	Tolerations for chunks-cache-l2 pods	

[]

chunksCache.l2.topologySpreadConstraints	list	topologySpreadConstraints allows to customize the default topologySpreadConstraints. This can be either a single dict as shown below or a slice of topologySpreadConstraints. labelSelector is taken from the constraint itself (if it exists) or is generated by the chart using the same selectors as for services.	

[]

chunksCache.l2.writebackBuffer	int	Max number of objects to use for cache write back	

500000

chunksCache.l2.writebackParallelism	int	Number of parallel threads for cache write back	

1

chunksCache.l2.writebackSizeLimit	string	Max memory to use for cache write back	

"500MB"

chunksCache.maxItemMemory	int	Maximum item memory for chunks-cache (in MB).	

5

chunksCache.maxUnavailable	int	Pod Disruption Budget maxUnavailable	

1

chunksCache.nodeSelector	object	Node selector for chunks-cache pods	

{}

chunksCache.parallelism	int	Parallel threads for sending and receiving chunks from chunks cache	

5

chunksCache.persistence	object	Persistence settings for the chunks-cache	

{
  "enabled": false,
  "labels": {},
  "mountPath": "/data",
  "storageClass": null,
  "storageSize": "10G"
}

chunksCache.persistence.enabled	bool	Enable creating PVCs for the chunks-cache	

false

chunksCache.persistence.mountPath	string	Volume mount path	

"/data"

chunksCache.persistence.storageClass	string	Storage class to be used. If defined, storageClassName: . If set to "-", storageClassName: "", which disables dynamic provisioning. If empty or set to null, no storageClassName spec is set, choosing the default provisioner (gp2 on AWS, standard on GKE, AWS, and OpenStack).	

null

chunksCache.persistence.storageSize	string	Size of persistent disk, must be in G or Gi	

"10G"

chunksCache.podAnnotations	object	Annotations for chunks-cache pods	

{}

chunksCache.podLabels	object	Labels for chunks-cache pods	

{}

chunksCache.podManagementPolicy	string	Management policy for chunks-cache pods	

"Parallel"

chunksCache.port	int	Port of the chunks-cache service	

11211

chunksCache.priorityClassName	string	The name of the PriorityClass for chunks-cache pods	

null

chunksCache.replicas	int	Specify how long cached chunks should be stored in the chunks-cache before being expired	

1

chunksCache.resources	string	Resource requests and limits for the chunks-cache By default a safe memory limit will be requested based on allocatedMemory value (floor (* 1.2 allocatedMemory)).	

null

chunksCache.service	object	Service annotations and labels	

{
  "annotations": {},
  "labels": {}
}

chunksCache.statefulStrategy	object	Stateful chunks-cache strategy	

{
  "type": "RollingUpdate"
}

chunksCache.suffix	string	Append to the name of the resources to make names different for l1 and l2	

""

chunksCache.terminationGracePeriodSeconds	int	Grace period to allow the chunks-cache to shutdown before it is killed	

60

chunksCache.timeout	string	Memcached operation timeout	

"2000ms"

chunksCache.tolerations	list	Tolerations for chunks-cache pods	

[]

chunksCache.topologySpreadConstraints	list	topologySpreadConstraints allows to customize the default topologySpreadConstraints. This can be either a single dict as shown below or a slice of topologySpreadConstraints. labelSelector is taken from the constraint itself (if it exists) or is generated by the chart using the same selectors as for services.	

[]

chunksCache.writebackBuffer	int	Max number of objects to use for cache write back	

500000

chunksCache.writebackParallelism	int	Number of parallel threads for cache write back	

1

chunksCache.writebackSizeLimit	string	Max memory to use for cache write back	

"500MB"

clusterLabelOverride	string	Overrides the chart's cluster label	

null

compactor	object	Configuration for the compactor	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "compactor",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "command": null,
  "dnsConfig": {},
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "livenessProbe": {},
  "nodeSelector": {},
  "persistence": {
    "claims": [
      {
        "accessModes": [
          "ReadWriteOnce"
        ],
        "annotations": {},
        "labels": {},
        "name": "data",
        "size": "10Gi",
        "storageClass": null
      }
    ],
    "enableStatefulSetAutoDeletePVC": false,
    "enabled": false,
    "size": "10Gi",
    "storageClass": null,
    "whenDeleted": "Retain",
    "whenScaled": "Retain"
  },
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "readinessProbe": {},
  "replicas": 0,
  "resources": {},
  "serviceAccount": {
    "annotations": {},
    "automountServiceAccountToken": true,
    "create": false,
    "imagePullSecrets": [],
    "name": null
  },
  "serviceAnnotations": {},
  "serviceLabels": {},
  "serviceType": "ClusterIP",
  "terminationGracePeriodSeconds": 30,
  "tolerations": []
}

compactor.affinity	object	Affinity for compactor pods. The value will be passed through tpl.	

Hard node anti-affinity

compactor.appProtocol	object	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

{
  "grpc": ""
}

compactor.command	string	Command to execute instead of defined in Docker image	

null

compactor.dnsConfig	object	DNSConfig for compactor pods	

{}

compactor.extraArgs	list	Additional CLI args for the compactor	

[]

compactor.extraContainers	list	Containers to add to the compactor pods	

[]

compactor.extraEnv	list	Environment variables to add to the compactor pods	

[]

compactor.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the compactor pods	

[]

compactor.extraVolumeMounts	list	Volume mounts to add to the compactor pods	

[]

compactor.extraVolumes	list	Volumes to add to the compactor pods	

[]

compactor.hostAliases	list	hostAliases to add	

[]

compactor.hostUsers	string	Use the host's user namespace in the compactor	

"nil"

compactor.image.registry	string	The Docker registry for the compactor image. Overrides `loki.image.registry`	

null

compactor.image.repository	string	Docker image repository for the compactor image. Overrides `loki.image.repository`	

null

compactor.image.tag	string	Docker image tag for the compactor image. Overrides `loki.image.tag`	

null

compactor.initContainers	list	Init containers to add to the compactor pods	

[]

compactor.livenessProbe	object	liveness probe settings for ingester pods. If empty use `loki.livenessProbe`	

{}

compactor.nodeSelector	object	Node selector for compactor pods	

{}

compactor.persistence.claims	list	List of the compactor PVCs	

compactor.persistence.claims[0].accessModes	list	Set access modes on the PersistentVolumeClaim	

[
  "ReadWriteOnce"
]

compactor.persistence.claims[0].annotations	object	Annotations for compactor PVCs	

{}

compactor.persistence.claims[0].labels	object	Labels for compactor PVCs	

{}

compactor.persistence.enableStatefulSetAutoDeletePVC	bool	Enable StatefulSetAutoDeletePVC feature	

false

compactor.persistence.enabled	bool	Enable creating PVCs for the compactor	

false

compactor.persistence.size	string	Size of persistent disk	

"10Gi"

compactor.persistence.storageClass	string	Storage class to be used. If defined, storageClassName: . If set to "-", storageClassName: "", which disables dynamic provisioning. If empty or set to null, no storageClassName spec is set, choosing the default provisioner (gp2 on AWS, standard on GKE, AWS, and OpenStack).	

null

compactor.podAnnotations	object	Annotations for compactor pods	

{}

compactor.podLabels	object	Labels for compactor pods	

{}

compactor.priorityClassName	string	The name of the PriorityClass for compactor pods	

null

compactor.readinessProbe	object	readiness probe settings for ingester pods. If empty, use `loki.readinessProbe`	

{}

compactor.replicas	int	Number of replicas for the compactor	

0

compactor.resources	object	Resource requests and limits for the compactor	

{}

compactor.serviceAccount.annotations	object	Annotations for the compactor service account	

{}

compactor.serviceAccount.automountServiceAccountToken	bool	Set this toggle to false to opt out of automounting API credentials for the service account	

true

compactor.serviceAccount.imagePullSecrets	list	Image pull secrets for the compactor service account	

[]

compactor.serviceAccount.name	string	The name of the ServiceAccount to use for the compactor. If not set and create is true, a name is generated by appending "-compactor" to the common ServiceAccount.	

null

compactor.serviceAnnotations	object	Annotations for compactor service	

{}

compactor.serviceLabels	object	Labels for compactor service	

{}

compactor.serviceType	string	Service type for compactor service	

"ClusterIP"

compactor.terminationGracePeriodSeconds	int	Grace period to allow the compactor to shutdown before it is killed	

30

compactor.tolerations	list	Tolerations for compactor pods	

[]

deploymentMode	string	Deployment mode lets you specify how to deploy Loki. There are 3 options: - SingleBinary: Loki is deployed as a single binary, useful for small installs typically without HA, up to a few tens of GB/day. - SimpleScalable: Loki is deployed as 3 targets: read, write, and backend. Useful for medium installs easier to manage than distributed, up to a about 1TB/day. - Distributed: Loki is deployed as individual microservices. The most complicated but most capable, useful for large installs, typically over 1TB/day. There are also 2 additional modes used for migrating between deployment modes: - SingleBinary<->SimpleScalable: Migrate from SingleBinary to SimpleScalable (or vice versa) - SimpleScalable<->Distributed: Migrate from SimpleScalable to Distributed (or vice versa) Note: SimpleScalable and Distributed REQUIRE the use of object storage.	

"SimpleScalable"

distributor	object	Configuration for the distributor	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "distributor",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "autoscaling": {
    "behavior": {
      "enabled": false,
      "scaleDown": {},
      "scaleUp": {}
    },
    "customMetrics": [],
    "enabled": false,
    "maxReplicas": 3,
    "minReplicas": 1,
    "targetCPUUtilizationPercentage": 60,
    "targetMemoryUtilizationPercentage": null
  },
  "command": null,
  "dnsConfig": {},
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "maxSurge": 0,
  "maxUnavailable": null,
  "nodeSelector": {},
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "replicas": 0,
  "resources": {},
  "serviceAnnotations": {},
  "serviceLabels": {},
  "serviceType": "ClusterIP",
  "terminationGracePeriodSeconds": 30,
  "tolerations": [],
  "topologySpreadConstraints": [],
  "trafficDistribution": ""
}

distributor.affinity	object	Affinity for distributor pods. The value will be passed through tpl.	

Hard node anti-affinity

distributor.appProtocol	object	Adds the appProtocol field to the distributor service. This allows distributor to work with istio protocol selection.	

{
  "grpc": ""
}

distributor.appProtocol.grpc	string	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

""

distributor.autoscaling.behavior.enabled	bool	Enable autoscaling behaviours	

false

distributor.autoscaling.behavior.scaleDown	object	define scale down policies, must conform to HPAScalingRules	

{}

distributor.autoscaling.behavior.scaleUp	object	define scale up policies, must conform to HPAScalingRules	

{}

distributor.autoscaling.customMetrics	list	Allows one to define custom metrics using the HPA/v2 schema (for example, Pods, Object or External metrics)	

[]

distributor.autoscaling.enabled	bool	Enable autoscaling for the distributor	

false

distributor.autoscaling.maxReplicas	int	Maximum autoscaling replicas for the distributor	

3

distributor.autoscaling.minReplicas	int	Minimum autoscaling replicas for the distributor	

1

distributor.autoscaling.targetCPUUtilizationPercentage	int	Target CPU utilisation percentage for the distributor	

60

distributor.autoscaling.targetMemoryUtilizationPercentage	string	Target memory utilisation percentage for the distributor	

null

distributor.command	string	Command to execute instead of defined in Docker image	

null

distributor.dnsConfig	object	DNSConfig for distributor pods	

{}

distributor.extraArgs	list	Additional CLI args for the distributor	

[]

distributor.extraContainers	list	Containers to add to the distributor pods	

[]

distributor.extraEnv	list	Environment variables to add to the distributor pods	

[]

distributor.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the distributor pods	

[]

distributor.extraVolumeMounts	list	Volume mounts to add to the distributor pods	

[]

distributor.extraVolumes	list	Volumes to add to the distributor pods	

[]

distributor.hostAliases	list	hostAliases to add	

[]

distributor.hostUsers	string	Use the host's user namespace in the distributor	

"nil"

distributor.image.registry	string	The Docker registry for the distributor image. Overrides `loki.image.registry`	

null

distributor.image.repository	string	Docker image repository for the distributor image. Overrides `loki.image.repository`	

null

distributor.image.tag	string	Docker image tag for the distributor image. Overrides `loki.image.tag`	

null

distributor.initContainers	list	Init containers to add to the distributor pods	

[]

distributor.maxSurge	int	Max Surge for distributor pods	

0

distributor.maxUnavailable	string	Pod Disruption Budget maxUnavailable	

null

distributor.nodeSelector	object	Node selector for distributor pods	

{}

distributor.podAnnotations	object	Annotations for distributor pods	

{}

distributor.podLabels	object	Labels for distributor pods	

{}

distributor.priorityClassName	string	The name of the PriorityClass for distributor pods	

null

distributor.replicas	int	Number of replicas for the distributor	

0

distributor.resources	object	Resource requests and limits for the distributor	

{}

distributor.serviceAnnotations	object	Annotations for distributor service	

{}

distributor.serviceLabels	object	Labels for distributor service	

{}

distributor.serviceType	string	Service type for distributor service	

"ClusterIP"

distributor.terminationGracePeriodSeconds	int	Grace period to allow the distributor to shutdown before it is killed	

30

distributor.tolerations	list	Tolerations for distributor pods	

[]

distributor.topologySpreadConstraints	list	Topology Spread Constraints for distributor pods The value will be passed through tpl.	

[]

distributor.trafficDistribution	string	trafficDistribution for distributor service	

""

enterprise	object	Configuration for running Enterprise Loki	

{
  "adminApi": {
    "enabled": true
  },
  "adminToken": {
    "secret": null
  },
  "canarySecret": null,
  "cluster_name": null,
  "config": "{{- if .Values.enterprise.adminApi.enabled }}\nadmin_client:\n  {{ include \"enterprise-logs.adminAPIStorageConfig\" . | nindent 2 }}\n{{ end }}\nauth:\n  type: {{ .Values.enterprise.adminApi.enabled | ternary \"enterprise\" \"trust\" }}\nauth_enabled: {{ .Values.loki.auth_enabled }}\ncluster_name: {{ include \"loki.clusterName\" . }}\nlicense:\n  path: /etc/loki/license/license.jwt\n",
  "enabled": false,
  "externalConfigName": "",
  "externalLicenseName": null,
  "gelGateway": true,
  "image": {
    "digest": null,
    "pullPolicy": "IfNotPresent",
    "registry": "docker.io",
    "repository": "grafana/enterprise-logs",
    "tag": "3.5.5"
  },
  "license": {
    "contents": "NOTAVALIDLICENSE"
  },
  "provisioner": {
    "additionalTenants": [],
    "affinity": {},
    "annotations": {},
    "apiUrl": "{{ include \"loki.address\" . }}",
    "enabled": true,
    "env": [],
    "extraVolumeMounts": [],
    "extraVolumes": [],
    "hookType": "post-install",
    "hostUsers": "nil",
    "image": {
      "digest": null,
      "pullPolicy": "IfNotPresent",
      "registry": "us-docker.pkg.dev",
      "repository": "grafanalabs-global/docker-enterprise-provisioner-prod/enterprise-provisioner",
      "tag": "latest"
    },
    "labels": {},
    "nodeSelector": {},
    "priorityClassName": null,
    "provisionedSecretPrefix": null,
    "securityContext": {
      "fsGroup": 10001,
      "runAsGroup": 10001,
      "runAsNonRoot": true,
      "runAsUser": 10001
    },
    "tolerations": []
  },
  "useExternalLicense": false,
  "version": "3.5.2"
}

enterprise.adminApi	object	If enabled, the correct admin_client storage will be configured. If disabled while running enterprise, make sure auth is set to `type: trust`, or that `auth_enabled` is set to `false`.	

{
  "enabled": true
}

enterprise.adminToken.secret	string	Name of external secret containing the admin token for enterprise provisioner This secret must exist before deploying and must contain a key named 'token'	

null

enterprise.canarySecret	string	Alternative name of the secret to store token for the canary	

null

enterprise.cluster_name	string	Optional name of the GEL cluster, otherwise will use .Release.Name The cluster name must match what is in your GEL license	

null

enterprise.externalConfigName	string	Name of the external config secret to use	

""

enterprise.externalLicenseName	string	Name of external license secret to use	

null

enterprise.gelGateway	bool	Use GEL gateway, if false will use the default nginx gateway	

true

enterprise.image.digest	string	Overrides the image tag with an image digest	

null

enterprise.image.pullPolicy	string	Docker image pull policy	

"IfNotPresent"

enterprise.image.registry	string	The Docker registry	

"docker.io"

enterprise.image.repository	string	Docker image repository	

"grafana/enterprise-logs"

enterprise.image.tag	string	Docker image tag	

"3.5.5"

enterprise.license	object	Grafana Enterprise Logs license In order to use Grafana Enterprise Logs features, you will need to provide the contents of your Grafana Enterprise Logs license, either by providing the contents of the license.jwt, or the name Kubernetes Secret that contains your license.jwt. To set the license contents, use the flag `--set-file 'enterprise.license.contents=./license.jwt'`	

{
  "contents": "NOTAVALIDLICENSE"
}

enterprise.provisioner	object	Configuration for `provisioner` target Note: Uses enterprise.adminToken.secret value to mount the admin token used to call the admin api.	

{
  "additionalTenants": [],
  "affinity": {},
  "annotations": {},
  "apiUrl": "{{ include \"loki.address\" . }}",
  "enabled": true,
  "env": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hookType": "post-install",
  "hostUsers": "nil",
  "image": {
    "digest": null,
    "pullPolicy": "IfNotPresent",
    "registry": "us-docker.pkg.dev",
    "repository": "grafanalabs-global/docker-enterprise-provisioner-prod/enterprise-provisioner",
    "tag": "latest"
  },
  "labels": {},
  "nodeSelector": {},
  "priorityClassName": null,
  "provisionedSecretPrefix": null,
  "securityContext": {
    "fsGroup": 10001,
    "runAsGroup": 10001,
    "runAsNonRoot": true,
    "runAsUser": 10001
  },
  "tolerations": []
}

enterprise.provisioner.additionalTenants	list	Additional tenants to be created. Each tenant will get a read and write policy and associated token. Tenant must have a name and a namespace for the secret containting the token to be created in. For example additionalTenants: - name: loki secretNamespace: grafana	

[]

enterprise.provisioner.affinity	object	Affinity for provisioner Pods The value will be passed through tpl.	

{}

enterprise.provisioner.annotations	object	Additional annotations for the `provisioner` Job	

{}

enterprise.provisioner.apiUrl	string	url of the admin api to use for the provisioner	

"{{ include \"loki.address\" . }}"

enterprise.provisioner.enabled	bool	Whether the job should be part of the deployment	

true

enterprise.provisioner.env	list	Additional Kubernetes environment	

[]

enterprise.provisioner.extraVolumeMounts	list	Volume mounts to add to the provisioner pods	

[]

enterprise.provisioner.extraVolumes	list	Additional volumes for Pods	

[]

enterprise.provisioner.hookType	string	Hook type(s) to customize when the job runs. defaults to post-install	

"post-install"

enterprise.provisioner.hostUsers	string	Use the host's user namespace in provisioner pods	

"nil"

enterprise.provisioner.image	object	Provisioner image to Utilize	

{
  "digest": null,
  "pullPolicy": "IfNotPresent",
  "registry": "us-docker.pkg.dev",
  "repository": "grafanalabs-global/docker-enterprise-provisioner-prod/enterprise-provisioner",
  "tag": "latest"
}

enterprise.provisioner.image.digest	string	Overrides the image tag with an image digest	

null

enterprise.provisioner.image.pullPolicy	string	Docker image pull policy	

"IfNotPresent"

enterprise.provisioner.image.registry	string	The Docker registry	

"us-docker.pkg.dev"

enterprise.provisioner.image.repository	string	Docker image repository	

"grafanalabs-global/docker-enterprise-provisioner-prod/enterprise-provisioner"

enterprise.provisioner.image.tag	string	Overrides the image tag whose default is the chart's appVersion	

"latest"

enterprise.provisioner.labels	object	Additional labels for the `provisioner` Job	

{}

enterprise.provisioner.nodeSelector	object	Node selector for provisioner Pods	

{}

enterprise.provisioner.priorityClassName	string	The name of the PriorityClass for provisioner Job	

null

enterprise.provisioner.provisionedSecretPrefix	string	Name of the secret to store provisioned tokens in	

null

enterprise.provisioner.securityContext	object	Run containers as user `enterprise-logs(uid=10001)`	

{
  "fsGroup": 10001,
  "runAsGroup": 10001,
  "runAsNonRoot": true,
  "runAsUser": 10001
}

enterprise.provisioner.tolerations	list	Tolerations for provisioner Pods	

[]

enterprise.useExternalLicense	bool	Set to true when providing an external license	

false

enterpriseGateway	object	If running enterprise and using the default enterprise gateway, configs go here.	

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
  "env": [],
  "extraArgs": {},
  "extraContainers": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "initContainers": [],
  "labels": {},
  "nodeSelector": {},
  "podSecurityContext": {
    "fsGroup": 10001,
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
    "labels": {},
    "type": "ClusterIP"
  },
  "strategy": {
    "type": "RollingUpdate"
  },
  "terminationGracePeriodSeconds": 60,
  "tolerations": [],
  "topologySpreadConstraints": [],
  "useDefaultProxyURLs": true
}

enterpriseGateway.affinity	object	Affinity for gateway Pods The value will be passed through tpl.	

{}

enterpriseGateway.annotations	object	Additional annotations for the `gateway` Pod	

{}

enterpriseGateway.env	list	Configure optional environment variables	

[]

enterpriseGateway.extraArgs	object	Additional CLI arguments for the `gateway` target	

{}

enterpriseGateway.extraContainers	list	Conifgure optional extraContainers	

[]

enterpriseGateway.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the enterprise gateway pods	

[]

enterpriseGateway.extraVolumeMounts	list	Additional volume mounts for Pods	

[]

enterpriseGateway.extraVolumes	list	Additional volumes for Pods	

[]

enterpriseGateway.hostAliases	list	hostAliases to add	

[]

enterpriseGateway.hostUsers	string	Use the host's user namespace in the `gateway` pod	

"nil"

enterpriseGateway.initContainers	list	Configure optional initContainers	

[]

enterpriseGateway.labels	object	Additional labels for the `gateway` Pod	

{}

enterpriseGateway.nodeSelector	object	Node selector for gateway Pods	

{}

enterpriseGateway.podSecurityContext	object	Run container as user `enterprise-logs(uid=10001)`	

{
  "fsGroup": 10001,
  "runAsGroup": 10001,
  "runAsNonRoot": true,
  "runAsUser": 10001
}

enterpriseGateway.readinessProbe	object	Readiness probe	

{
  "httpGet": {
    "path": "/ready",
    "port": "http-metrics"
  },
  "initialDelaySeconds": 45
}

enterpriseGateway.replicas	int	Define the amount of instances	

1

enterpriseGateway.resources	object	Values are defined in small.yaml and large.yaml	

{}

enterpriseGateway.service	object	Service overriding service type	

{
  "annotations": {},
  "labels": {},
  "type": "ClusterIP"
}

enterpriseGateway.strategy	object	update strategy	

{
  "type": "RollingUpdate"
}

enterpriseGateway.terminationGracePeriodSeconds	int	Grace period to allow the gateway to shutdown before it is killed	

60

enterpriseGateway.tolerations	list	Tolerations for gateway Pods	

[]

enterpriseGateway.topologySpreadConstraints	list	Topology Spread Constraints for enterprise-gateway pods The value will be passed through tpl.	

[]

enterpriseGateway.useDefaultProxyURLs	bool	If you want to use your own proxy URLs, set this to false.	

true

extraObjects	string		

null

fullnameOverride	string	Overrides the chart's computed fullname	

null

gateway.affinity	object	Affinity for gateway pods. The value will be passed through tpl.	

Hard node anti-affinity

gateway.annotations	object	Annotations for gateway deployment	

{}

gateway.autoscaling.behavior	object	Behavior policies while scaling.	

{}

gateway.autoscaling.enabled	bool	Enable autoscaling for the gateway	

false

gateway.autoscaling.maxReplicas	int	Maximum autoscaling replicas for the gateway	

3

gateway.autoscaling.minReplicas	int	Minimum autoscaling replicas for the gateway	

1

gateway.autoscaling.targetCPUUtilizationPercentage	int	Target CPU utilisation percentage for the gateway	

60

gateway.autoscaling.targetMemoryUtilizationPercentage	string	Target memory utilisation percentage for the gateway	

null

gateway.basicAuth.enabled	bool	Enables basic authentication for the gateway	

false

gateway.basicAuth.existingSecret	string	Existing basic auth secret to use. Must contain '.htpasswd'	

null

gateway.basicAuth.htpasswd	string	Uses the specified users from the `loki.tenants` list to create the htpasswd file. if `loki.tenants` is not set, the `gateway.basicAuth.username` and `gateway.basicAuth.password` are used. The value is templated using `tpl`. Override this to use a custom htpasswd, e.g. in case the default causes high CPU load.	

Either `loki.tenants` or `gateway.basicAuth.username` and `gateway.basicAuth.password`.

gateway.basicAuth.password	string	The basic auth password for the gateway	

null

gateway.basicAuth.username	string	The basic auth username for the gateway	

null

gateway.containerPort	int	Default container port	

8080

gateway.containerSecurityContext	object	The SecurityContext for gateway containers	

{
  "allowPrivilegeEscalation": false,
  "capabilities": {
    "drop": [
      "ALL"
    ]
  },
  "readOnlyRootFilesystem": true
}

gateway.deploymentStrategy.type	string		

"RollingUpdate"

gateway.dnsConfig	object	DNS config for gateway pods	

{}

gateway.enabled	bool	Specifies whether the gateway should be enabled	

true

gateway.extraArgs	list	Additional CLI args for the gateway	

[]

gateway.extraContainers	list	Containers to add to the gateway pods	

[]

gateway.extraEnv	list	Environment variables to add to the gateway pods	

[]

gateway.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the gateway pods	

[]

gateway.extraVolumeMounts	list	Volume mounts to add to the gateway pods	

[]

gateway.extraVolumes	list	Volumes to add to the gateway pods	

[]

gateway.hostUsers	string	Use the host's user namespace in the gateway	

"nil"

gateway.image.digest	string	Overrides the gateway image tag with an image digest	

null

gateway.image.pullPolicy	string	The gateway image pull policy	

"IfNotPresent"

gateway.image.registry	string	The Docker registry for the gateway image	

"docker.io"

gateway.image.repository	string	The gateway image repository	

"nginxinc/nginx-unprivileged"

gateway.image.tag	string	The gateway image tag	

"1.29-alpine"

gateway.ingress.annotations	object	Annotations for the gateway ingress	

{}

gateway.ingress.enabled	bool	Specifies whether an ingress for the gateway should be created	

false

gateway.ingress.hosts	list	Hosts configuration for the gateway ingress, passed through the `tpl` function to allow templating	

[
  {
    "host": "gateway.loki.example.com",
    "paths": [
      {
        "path": "/"
      }
    ]
  }
]

gateway.ingress.ingressClassName	string	Ingress Class Name. MAY be required for Kubernetes versions >= 1.18	

""

gateway.ingress.labels	object	Labels for the gateway ingress	

{}

gateway.ingress.tls	list	TLS configuration for the gateway ingress. Hosts passed through the `tpl` function to allow templating	

[
  {
    "hosts": [
      "gateway.loki.example.com"
    ],
    "secretName": "loki-gateway-tls"
  }
]

gateway.lifecycle	object	Lifecycle for the gateway container	

{}

gateway.livenessProbe	object	liveness probe for the nginx container in the gateway pods.	

{}

gateway.nginxConfig.clientMaxBodySize	string	Allows customizing the `client_max_body_size` directive	

"4M"

gateway.nginxConfig.customBackendUrl	string	Override Backend URL	

null

gateway.nginxConfig.customReadUrl	string	Override Read URL	

null

gateway.nginxConfig.customWriteUrl	string	Override Write URL	

null

gateway.nginxConfig.enableIPv6	bool	Enable listener for IPv6, disable on IPv4-only systems	

true

gateway.nginxConfig.file	string	Config file contents for Nginx. Passed through the `tpl` function to allow templating	

See values.yaml

gateway.nginxConfig.httpSnippet	string	Allows appending custom configuration to the http block, passed through the `tpl` function to allow templating	

""

gateway.nginxConfig.locationSnippet	string	Allows appending custom configuration inside every location block, useful for authentication or setting headers that are not inherited from the server block, passed through the `tpl` function to allow templating.	

"{{ if .Values.loki.tenants }}proxy_set_header X-Scope-OrgID $remote_user;{{ end }}"

gateway.nginxConfig.logFormat	string	NGINX log format	

"main '$remote_addr - $remote_user [$time_local]  $status '\n        '\"$request\" $body_bytes_sent \"$http_referer\" '\n        '\"$http_user_agent\" \"$http_x_forwarded_for\"';"

gateway.nginxConfig.resolver	string	Allows overriding the DNS resolver address nginx will use.	

""

gateway.nginxConfig.schema	string	Which schema to be used when building URLs. Can be 'http' or 'https'.	

"http"

gateway.nginxConfig.serverSnippet	string	Allows appending custom configuration to the server block	

""

gateway.nginxConfig.ssl	bool	Whether ssl should be appended to the listen directive of the server block or not.	

false

gateway.nodeSelector	object	Node selector for gateway pods	

{}

gateway.podAnnotations	object	Annotations for gateway pods	

{}

gateway.podLabels	object	Additional labels for gateway pods	

{}

gateway.podSecurityContext	object	The SecurityContext for gateway containers	

{
  "fsGroup": 101,
  "runAsGroup": 101,
  "runAsNonRoot": true,
  "runAsUser": 101
}

gateway.priorityClassName	string	The name of the PriorityClass for gateway pods	

null

gateway.readinessProbe.httpGet.path	string		

"/"

gateway.readinessProbe.httpGet.port	string		

"http-metrics"

gateway.readinessProbe.initialDelaySeconds	int		

15

gateway.readinessProbe.timeoutSeconds	int		

1

gateway.replicas	int	Number of replicas for the gateway	

1

gateway.resources	object	Resource requests and limits for the gateway	

{}

gateway.service.annotations	object	Annotations for the gateway service	

{}

gateway.service.clusterIP	string	ClusterIP of the gateway service	

null

gateway.service.labels	object	Labels for gateway service	

{}

gateway.service.loadBalancerIP	string	Load balancer IPO address if service type is LoadBalancer	

null

gateway.service.nodePort	int	Node port if service type is NodePort	

null

gateway.service.port	int	Port of the gateway service	

80

gateway.service.type	string	Type of the gateway service	

"ClusterIP"

gateway.startupProbe	object	startup probe for the nginx container in the gateway pods.	

{}

gateway.terminationGracePeriodSeconds	int	Grace period to allow the gateway to shutdown before it is killed	

30

gateway.tolerations	list	Tolerations for gateway pods	

[]

gateway.topologySpreadConstraints	list	Topology Spread Constraints for gateway pods The value will be passed through tpl.	

[]

gateway.verboseLogging	bool	Enable logging of 2xx and 3xx HTTP requests	

true

global.clusterDomain	string	configures cluster domain ("cluster.local" by default)	

"cluster.local"

global.dnsNamespace	string	configures DNS service namespace	

"kube-system"

global.dnsService	string	configures DNS service name	

"kube-dns"

global.extraArgs	list	Common additional CLI arguments for all jobs (that is, -log.level debug, -config.expand-env=true or -log-config-reverse-order) scope: admin-api, backend, bloom-builder, bloom-gateway, bloom-planner, compactor, distributor, index-gateway, ingester, overrides-exporter, pattern-ingester, querier, query-frontend, query-scheduler, read, ruler, write.	

[]

global.extraEnv	list	Common environment variables to add to all pods directly managed by this chart. scope: admin-api, backend, bloom-builder, bloom-gateway, bloom-planner, compactor, distributor, index-gateway, ingester, overrides-exporter, pattern-ingester, querier, query-frontend, query-scheduler, read, ruler, write.	

[]

global.extraEnvFrom	list	Common source of environment injections to add to all pods directly managed by this chart. scope: admin-api, backend, bloom-builder, bloom-gateway, bloom-planner, compactor, distributor, index-gateway, ingester, overrides-exporter, pattern-ingester, querier, query-frontend, query-scheduler, read, ruler, write. For example to inject values from a Secret, use: extraEnvFrom: - secretRef: name: mysecret	

[]

global.extraVolumeMounts	list	Common mount points to add to all pods directly managed by this chart. scope: admin-api, backend, bloom-builder, bloom-gateway, bloom-planner, compactor, distributor, index-gateway, ingester, overrides-exporter, pattern-ingester, querier, query-frontend, query-scheduler, read, ruler, write.	

[]

global.extraVolumes	list	Common volumes to add to all pods directly managed by this chart. scope: admin-api, backend, bloom-builder, bloom-gateway, bloom-planner, compactor, distributor, index-gateway, ingester, overrides-exporter, pattern-ingester, querier, query-frontend, query-scheduler, read, ruler, write.	

[]

global.image.registry	string	Overrides the Docker registry globally for all images	

null

global.priorityClassName	string	Overrides the priorityClassName for all pods	

null

imagePullSecrets	list	Image pull secrets for Docker images	

[]

indexGateway	object	Configuration for the index-gateway	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "index-gateway",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "dnsConfig": {},
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "joinMemberlist": true,
  "maxUnavailable": null,
  "nodeSelector": {},
  "persistence": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "annotations": {},
    "enableStatefulSetAutoDeletePVC": false,
    "enabled": false,
    "inMemory": false,
    "labels": {},
    "size": "10Gi",
    "storageClass": null,
    "whenDeleted": "Retain",
    "whenScaled": "Retain"
  },
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "replicas": 0,
  "resources": {},
  "serviceAnnotations": {},
  "serviceLabels": {},
  "serviceType": "ClusterIP",
  "terminationGracePeriodSeconds": 300,
  "tolerations": [],
  "topologySpreadConstraints": [],
  "updateStrategy": {
    "type": "RollingUpdate"
  }
}

indexGateway.affinity	object	Affinity for index-gateway pods. The value will be passed through tpl.	

Hard node anti-affinity

indexGateway.appProtocol	object	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

{
  "grpc": ""
}

indexGateway.dnsConfig	object	DNSConfig for index-gateway pods	

{}

indexGateway.extraArgs	list	Additional CLI args for the index-gateway	

[]

indexGateway.extraContainers	list	Containers to add to the index-gateway pods	

[]

indexGateway.extraEnv	list	Environment variables to add to the index-gateway pods	

[]

indexGateway.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the index-gateway pods	

[]

indexGateway.extraVolumeMounts	list	Volume mounts to add to the index-gateway pods	

[]

indexGateway.extraVolumes	list	Volumes to add to the index-gateway pods	

[]

indexGateway.hostAliases	list	hostAliases to add	

[]

indexGateway.hostUsers	string	Use the host's user namespace in the index-gateway	

"nil"

indexGateway.image.registry	string	The Docker registry for the index-gateway image. Overrides `loki.image.registry`	

null

indexGateway.image.repository	string	Docker image repository for the index-gateway image. Overrides `loki.image.repository`	

null

indexGateway.image.tag	string	Docker image tag for the index-gateway image. Overrides `loki.image.tag`	

null

indexGateway.initContainers	list	Init containers to add to the index-gateway pods	

[]

indexGateway.joinMemberlist	bool	Whether the index gateway should join the memberlist hashring	

true

indexGateway.maxUnavailable	string	Pod Disruption Budget maxUnavailable	

null

indexGateway.nodeSelector	object	Node selector for index-gateway pods	

{}

indexGateway.persistence.accessModes	list	Set access modes on the PersistentVolumeClaim	

[
  "ReadWriteOnce"
]

indexGateway.persistence.annotations	object	Annotations for index gateway PVCs	

{}

indexGateway.persistence.enableStatefulSetAutoDeletePVC	bool	Enable StatefulSetAutoDeletePVC feature	

false

indexGateway.persistence.enabled	bool	Enable creating PVCs which is required when using boltdb-shipper	

false

indexGateway.persistence.inMemory	bool	Use emptyDir with ramdisk for storage. **Please note that all data in indexGateway will be lost on pod restart**	

false

indexGateway.persistence.labels	object	Labels for index gateway PVCs	

{}

indexGateway.persistence.size	string	Size of persistent or memory disk	

"10Gi"

indexGateway.persistence.storageClass	string	Storage class to be used. If defined, storageClassName: . If set to "-", storageClassName: "", which disables dynamic provisioning. If empty or set to null, no storageClassName spec is set, choosing the default provisioner (gp2 on AWS, standard on GKE, AWS, and OpenStack).	

null

indexGateway.podAnnotations	object	Annotations for index-gateway pods	

{}

indexGateway.podLabels	object	Labels for index-gateway pods	

{}

indexGateway.priorityClassName	string	The name of the PriorityClass for index-gateway pods	

null

indexGateway.replicas	int	Number of replicas for the index-gateway	

0

indexGateway.resources	object	Resource requests and limits for the index-gateway	

{}

indexGateway.serviceAnnotations	object	Annotations for index-gateway service	

{}

indexGateway.serviceLabels	object	Labels for index-gateway service	

{}

indexGateway.serviceType	string	Service type for index-gateway service	

"ClusterIP"

indexGateway.terminationGracePeriodSeconds	int	Grace period to allow the index-gateway to shutdown before it is killed.	

300

indexGateway.tolerations	list	Tolerations for index-gateway pods	

[]

indexGateway.topologySpreadConstraints	list	Topology Spread Constraints for index-gateway pods The value will be passed through tpl.	

[]

indexGateway.updateStrategy	object	UpdateStrategy for the indexGateway StatefulSet.	

{
  "type": "RollingUpdate"
}

indexGateway.updateStrategy.type	string	One of 'OnDelete' or 'RollingUpdate'	

"RollingUpdate"

ingester	object	Configuration for the ingester	

{
  "addIngesterNamePrefix": false,
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "ingester",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "autoscaling": {
    "behavior": {
      "enabled": false,
      "scaleDown": {},
      "scaleUp": {}
    },
    "customMetrics": [],
    "enabled": false,
    "maxReplicas": 3,
    "minReplicas": 1,
    "targetCPUUtilizationPercentage": 60,
    "targetMemoryUtilizationPercentage": null
  },
  "command": null,
  "dnsConfig": {},
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "labels": {},
  "lifecycle": {},
  "livenessProbe": {},
  "maxUnavailable": 1,
  "nodeSelector": {},
  "persistence": {
    "claims": [
      {
        "accessModes": [
          "ReadWriteOnce"
        ],
        "name": "data",
        "size": "10Gi",
        "storageClass": null
      }
    ],
    "enableStatefulSetAutoDeletePVC": false,
    "enabled": false,
    "inMemory": false,
    "whenDeleted": "Retain",
    "whenScaled": "Retain"
  },
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "readinessProbe": {},
  "replicas": 0,
  "resources": {},
  "rolloutGroupPrefix": null,
  "serviceAnnotations": {},
  "serviceLabels": {},
  "serviceType": "ClusterIP",
  "terminationGracePeriodSeconds": 300,
  "tolerations": [],
  "topologySpreadConstraints": [
    {
      "labelSelector": {
        "matchLabels": {
          "app.kubernetes.io/component": "ingester",
          "app.kubernetes.io/instance": "{{ .Release.Name }}",
          "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
        }
      },
      "maxSkew": 1,
      "topologyKey": "kubernetes.io/hostname",
      "whenUnsatisfiable": "ScheduleAnyway"
    }
  ],
  "updateStrategy": {
    "type": "RollingUpdate"
  },
  "zoneAwareReplication": {
    "enabled": true,
    "maxUnavailablePct": 33,
    "migration": {
      "enabled": false,
      "excludeDefaultZone": false,
      "readPath": false,
      "writePath": false
    },
    "zoneA": {
      "annotations": {},
      "extraAffinity": {},
      "nodeSelector": null,
      "podAnnotations": {}
    },
    "zoneB": {
      "annotations": {},
      "extraAffinity": {},
      "nodeSelector": null,
      "podAnnotations": {}
    },
    "zoneC": {
      "annotations": {},
      "extraAffinity": {},
      "nodeSelector": null,
      "podAnnotations": {}
    }
  }
}

ingester.affinity	object	Affinity for ingester pods. Ignored if zoneAwareReplication is enabled. The value will be passed through tpl.	

Hard node anti-affinity

ingester.appProtocol	object	Adds the appProtocol field to the ingester service. This allows ingester to work with istio protocol selection.	

{
  "grpc": ""
}

ingester.appProtocol.grpc	string	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

""

ingester.autoscaling.behavior.enabled	bool	Enable autoscaling behaviours	

false

ingester.autoscaling.behavior.scaleDown	object	define scale down policies, must conform to HPAScalingRules	

{}

ingester.autoscaling.behavior.scaleUp	object	define scale up policies, must conform to HPAScalingRules	

{}

ingester.autoscaling.customMetrics	list	Allows one to define custom metrics using the HPA/v2 schema (for example, Pods, Object or External metrics)	

[]

ingester.autoscaling.enabled	bool	Enable autoscaling for the ingester	

false

ingester.autoscaling.maxReplicas	int	Maximum autoscaling replicas for the ingester	

3

ingester.autoscaling.minReplicas	int	Minimum autoscaling replicas for the ingester	

1

ingester.autoscaling.targetCPUUtilizationPercentage	int	Target CPU utilisation percentage for the ingester	

60

ingester.autoscaling.targetMemoryUtilizationPercentage	string	Target memory utilisation percentage for the ingester	

null

ingester.command	string	Command to execute instead of defined in Docker image	

null

ingester.dnsConfig	object	DNSConfig for ingester pods	

{}

ingester.extraArgs	list	Additional CLI args for the ingester	

[]

ingester.extraContainers	list	Containers to add to the ingester pods	

[]

ingester.extraEnv	list	Environment variables to add to the ingester pods	

[]

ingester.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the ingester pods	

[]

ingester.extraVolumeMounts	list	Volume mounts to add to the ingester pods	

[]

ingester.extraVolumes	list	Volumes to add to the ingester pods	

[]

ingester.hostAliases	list	hostAliases to add	

[]

ingester.hostUsers	string	Use the host's user namespace in the ingester	

"nil"

ingester.image.registry	string	The Docker registry for the ingester image. Overrides `loki.image.registry`	

null

ingester.image.repository	string	Docker image repository for the ingester image. Overrides `loki.image.repository`	

null

ingester.image.tag	string	Docker image tag for the ingester image. Overrides `loki.image.tag`	

null

ingester.initContainers	list	Init containers to add to the ingester pods	

[]

ingester.lifecycle	object	Lifecycle for the ingester container	

{}

ingester.livenessProbe	object	liveness probe settings for ingester pods. If empty use `loki.livenessProbe`	

{}

ingester.maxUnavailable	int	Pod Disruption Budget maxUnavailable	

1

ingester.nodeSelector	object	Node selector for ingester pods	

{}

ingester.persistence.claims	list	List of the ingester PVCs	

ingester.persistence.claims[0].accessModes	list	Set access modes on the PersistentVolumeClaim	

[
  "ReadWriteOnce"
]

ingester.persistence.enableStatefulSetAutoDeletePVC	bool	Enable StatefulSetAutoDeletePVC feature	

false

ingester.persistence.enabled	bool	Enable creating PVCs which is required when using boltdb-shipper	

false

ingester.persistence.inMemory	bool	Use emptyDir with ramdisk for storage. **Please note that all data in ingester will be lost on pod restart**	

false

ingester.podAnnotations	object	Annotations for ingester pods	

{}

ingester.podLabels	object	Labels for ingester pods	

{}

ingester.readinessProbe	object	readiness probe settings for ingester pods. If empty, use `loki.readinessProbe`	

{}

ingester.replicas	int	Number of replicas for the ingester, when zoneAwareReplication.enabled is true, the total number of replicas will match this value with each zone having 1/3rd of the total replicas.	

0

ingester.resources	object	Resource requests and limits for the ingester	

{}

ingester.serviceAnnotations	object	Annotations for ingestor service	

{}

ingester.serviceLabels	object	Labels for ingestor service	

{}

ingester.serviceType	string	Service type for ingestor service	

"ClusterIP"

ingester.terminationGracePeriodSeconds	int	Grace period to allow the ingester to shutdown before it is killed. Especially for the ingestor, this must be increased. It must be long enough so ingesters can be gracefully shutdown flushing/transferring all data and to successfully leave the member ring on shutdown.	

300

ingester.tolerations	list	Tolerations for ingester pods	

[]

ingester.topologySpreadConstraints	list	topologySpread for ingester pods. The value will be passed through tpl.	

Defaults to allow skew no more than 1 node

ingester.updateStrategy	object	UpdateStrategy for the ingester StatefulSets.	

{
  "type": "RollingUpdate"
}

ingester.updateStrategy.type	string	One of 'OnDelete' or 'RollingUpdate'	

"RollingUpdate"

ingester.zoneAwareReplication	object	Enabling zone awareness on ingesters will create 3 statefulests where all writes will send a replica to each zone. This is primarily intended to accelerate rollout operations by allowing for multiple ingesters within a single zone to be shutdown and restart simultaneously (the remaining 2 zones will be guaranteed to have at least one copy of the data). Note: This can be used to run Loki over multiple cloud provider availability zones however this is not currently recommended as Loki is not optimized for this and cross zone network traffic costs can become extremely high extremely quickly. Even with zone awareness enabled, it is recommended to run Loki in a single availability zone.	

{
  "enabled": true,
  "maxUnavailablePct": 33,
  "migration": {
    "enabled": false,
    "excludeDefaultZone": false,
    "readPath": false,
    "writePath": false
  },
  "zoneA": {
    "annotations": {},
    "extraAffinity": {},
    "nodeSelector": null,
    "podAnnotations": {}
  },
  "zoneB": {
    "annotations": {},
    "extraAffinity": {},
    "nodeSelector": null,
    "podAnnotations": {}
  },
  "zoneC": {
    "annotations": {},
    "extraAffinity": {},
    "nodeSelector": null,
    "podAnnotations": {}
  }
}

ingester.zoneAwareReplication.enabled	bool	Enable zone awareness.	

true

ingester.zoneAwareReplication.maxUnavailablePct	int	The percent of replicas in each zone that will be restarted at once. In a value of 0-100	

33

ingester.zoneAwareReplication.migration	object	The migration block allows migrating non zone aware ingesters to zone aware ingesters.	

{
  "enabled": false,
  "excludeDefaultZone": false,
  "readPath": false,
  "writePath": false
}

ingester.zoneAwareReplication.zoneA	object	zoneA configuration	

{
  "annotations": {},
  "extraAffinity": {},
  "nodeSelector": null,
  "podAnnotations": {}
}

ingester.zoneAwareReplication.zoneA.annotations	object	Specific annotations to add to zone A statefulset	

{}

ingester.zoneAwareReplication.zoneA.extraAffinity	object	optionally define extra affinity rules, by default different zones are not allowed to schedule on the same host The value will be passed through tpl.	

{}

ingester.zoneAwareReplication.zoneA.nodeSelector	string	optionally define a node selector for this zone	

null

ingester.zoneAwareReplication.zoneA.podAnnotations	object	Specific annotations to add to zone A pods	

{}

ingester.zoneAwareReplication.zoneB.annotations	object	Specific annotations to add to zone B statefulset	

{}

ingester.zoneAwareReplication.zoneB.extraAffinity	object	optionally define extra affinity rules, by default different zones are not allowed to schedule on the same host The value will be passed through tpl.	

{}

ingester.zoneAwareReplication.zoneB.nodeSelector	string	optionally define a node selector for this zone	

null

ingester.zoneAwareReplication.zoneB.podAnnotations	object	Specific annotations to add to zone B pods	

{}

ingester.zoneAwareReplication.zoneC.annotations	object	Specific annotations to add to zone C statefulset	

{}

ingester.zoneAwareReplication.zoneC.extraAffinity	object	optionally define extra affinity rules, by default different zones are not allowed to schedule on the same host The value will be passed through tpl.	

{}

ingester.zoneAwareReplication.zoneC.nodeSelector	string	optionally define a node selector for this zone	

null

ingester.zoneAwareReplication.zoneC.podAnnotations	object	Specific annotations to add to zone C pods	

{}

ingress	object	Ingress configuration Use either this ingress or the gateway, but not both at once. If you enable this, make sure to disable the gateway. You'll need to supply authn configuration for your ingress controller.	

{
  "annotations": {},
  "enabled": false,
  "hosts": [
    "loki.example.com"
  ],
  "ingressClassName": "",
  "labels": {},
  "paths": {
    "compactor": [
      "/loki/api/v1/delete"
    ],
    "distributor": [
      "/api/prom/push",
      "/loki/api/v1/push",
      "/otlp/v1/logs",
      "/ui"
    ],
    "queryFrontend": [
      "/api/prom/query",
      "/api/prom/label",
      "/api/prom/series",
      "/api/prom/tail",
      "/loki/api/v1/query",
      "/loki/api/v1/query_range",
      "/loki/api/v1/tail",
      "/loki/api/v1/label",
      "/loki/api/v1/labels",
      "/loki/api/v1/series",
      "/loki/api/v1/index/stats",
      "/loki/api/v1/index/volume",
      "/loki/api/v1/index/volume_range",
      "/loki/api/v1/format_query",
      "/loki/api/v1/detected_field",
      "/loki/api/v1/detected_fields",
      "/loki/api/v1/detected_labels",
      "/loki/api/v1/patterns"
    ],
    "ruler": [
      "/api/prom/rules",
      "/api/prom/api/v1/rules",
      "/api/prom/api/v1/alerts",
      "/loki/api/v1/rules",
      "/prometheus/api/v1/rules",
      "/prometheus/api/v1/alerts"
    ]
  },
  "tls": []
}

ingress.hosts	list	Hosts configuration for the ingress, passed through the `tpl` function to allow templating	

[
  "loki.example.com"
]

ingress.paths.compactor	list	Paths that are exposed by Loki Compactor. If deployment mode is Distributed, the requests are forwarded to the service: `{{"loki.compactorFullname"}}`. If deployment mode is SimpleScalable, the requests are forwarded to k8s service: `{{"loki.backendFullname"}}`. If deployment mode is SingleBinary, the requests are forwarded to the central/single k8s service: `{{"loki.singleBinaryFullname"}}`	

[
  "/loki/api/v1/delete"
]

ingress.paths.distributor	list	Paths that are exposed by Loki Distributor. If deployment mode is Distributed, the requests are forwarded to the service: `{{"loki.distributorFullname"}}`. If deployment mode is SimpleScalable, the requests are forwarded to write k8s service: `{{"loki.writeFullname"}}`. If deployment mode is SingleBinary, the requests are forwarded to the central/single k8s service: `{{"loki.singleBinaryFullname"}}`	

[
  "/api/prom/push",
  "/loki/api/v1/push",
  "/otlp/v1/logs",
  "/ui"
]

ingress.paths.queryFrontend	list	Paths that are exposed by Loki Query Frontend. If deployment mode is Distributed, the requests are forwarded to the service: `{{"loki.queryFrontendFullname"}}`. If deployment mode is SimpleScalable, the requests are forwarded to write k8s service: `{{"loki.readFullname"}}`. If deployment mode is SingleBinary, the requests are forwarded to the central/single k8s service: `{{"loki.singleBinaryFullname"}}`	

[
  "/api/prom/query",
  "/api/prom/label",
  "/api/prom/series",
  "/api/prom/tail",
  "/loki/api/v1/query",
  "/loki/api/v1/query_range",
  "/loki/api/v1/tail",
  "/loki/api/v1/label",
  "/loki/api/v1/labels",
  "/loki/api/v1/series",
  "/loki/api/v1/index/stats",
  "/loki/api/v1/index/volume",
  "/loki/api/v1/index/volume_range",
  "/loki/api/v1/format_query",
  "/loki/api/v1/detected_field",
  "/loki/api/v1/detected_fields",
  "/loki/api/v1/detected_labels",
  "/loki/api/v1/patterns"
]

ingress.paths.ruler	list	Paths that are exposed by Loki Ruler. If deployment mode is Distributed, the requests are forwarded to the service: `{{"loki.rulerFullname"}}`. If deployment mode is SimpleScalable, the requests are forwarded to k8s service: `{{"loki.backendFullname"}}`. If deployment mode is SimpleScalable but `read.legacyReadTarget` is `true`, the requests are forwarded to k8s service: `{{"loki.readFullname"}}`. If deployment mode is SingleBinary, the requests are forwarded to the central/single k8s service: `{{"loki.singleBinaryFullname"}}`	

[
  "/api/prom/rules",
  "/api/prom/api/v1/rules",
  "/api/prom/api/v1/alerts",
  "/loki/api/v1/rules",
  "/prometheus/api/v1/rules",
  "/prometheus/api/v1/alerts"
]

ingress.tls	list	TLS configuration for the ingress. Hosts passed through the `tpl` function to allow templating	

[]

kubeVersionOverride	string	Overrides the version used to determine compatibility of resources with the target Kubernetes cluster. This is useful when using `helm template`, because then helm will use the client version of kubectl as the Kubernetes version, which may or may not match your cluster's server version. Example: 'v1.24.4'. Set to null to use the version that helm devises.	

null

loki	object	Configuration for running Loki	

See values.yaml

loki.analytics	object	Optional analytics configuration	

{}

loki.annotations	object	Common annotations for all deployments/StatefulSets	

{}

loki.block_builder	object	Optional block builder configuration	

{}

loki.commonConfig	object	Check https://grafana.com/docs/loki/latest/configuration/#common_config for more info on how to provide a common configuration	

{
  "compactor_grpc_address": "{{ include \"loki.compactorAddress\" . }}",
  "path_prefix": "/var/loki",
  "replication_factor": 3
}

loki.commonConfig.compactor_grpc_address	string	The gRPC address of the compactor. The use of compactor_grpc_address is prefered over compactor_address. If a customized compactor_address is set, compactor_grpc_address should be set to an empty string.	

"{{ include \"loki.compactorAddress\" . }}"

loki.compactor	object	Optional compactor configuration	

{}

loki.compactor_grpc_client	object	Optional compactor grpc client configuration	

{}

loki.config	string	Config file contents for Loki	

See values.yaml

loki.configObjectName	string	The name of the object which Loki will mount as a volume containing the config. If the configStorageType is Secret, this will be the name of the Secret, if it is ConfigMap, this will be the name of the ConfigMap. The value will be passed through tpl.	

"{{ include \"loki.name\" . }}"

loki.configStorageType	string	Defines what kind of object stores the configuration, a ConfigMap or a Secret. In order to move sensitive information (such as credentials) from the ConfigMap/Secret to a more secure location (e.g. vault), it is possible to use [environment variables in the configuration](https://grafana.com/docs/loki/latest/configuration/#use-environment-variables-in-the-configuration). Such environment variables can be then stored in a separate Secret and injected via the global.extraEnvFrom value. For details about environment injection from a Secret please see [Secrets](https://kubernetes.io/docs/concepts/configuration/secret/#use-case-as-container-environment-variables).	

"ConfigMap"

loki.containerSecurityContext	object	The SecurityContext for Loki containers	

{
  "allowPrivilegeEscalation": false,
  "capabilities": {
    "drop": [
      "ALL"
    ]
  },
  "readOnlyRootFilesystem": true
}

loki.distributor	object	Optional distributor configuration	

{}

loki.dnsConfig	object	DNS config for Loki pods	

{}

loki.enableServiceLinks	bool	Should enableServiceLinks be enabled. Default to enable	

true

loki.extraMemberlistConfig	object	Extra memberlist configuration	

{}

loki.generatedConfigObjectName	string	The name of the Secret or ConfigMap that will be created by this chart. If empty, no configmap or secret will be created. The value will be passed through tpl.	

"{{ include \"loki.name\" . }}"

loki.image.digest	string	Overrides the image tag with an image digest	

null

loki.image.pullPolicy	string	Docker image pull policy	

"IfNotPresent"

loki.image.registry	string	The Docker registry	

"docker.io"

loki.image.repository	string	Docker image repository	

"grafana/loki"

loki.image.tag	string	Overrides the image tag whose default is the chart's appVersion	

"3.5.5"

loki.index_gateway	object	Optional index gateway configuration	

{
  "mode": "simple"
}

loki.ingester	object	Optional ingester configuration	

{}

loki.ingester_client	object	Optional ingester client configuration	

{}

loki.limits_config	object	Limits config	

{
  "max_cache_freshness_per_query": "10m",
  "query_timeout": "300s",
  "reject_old_samples": true,
  "reject_old_samples_max_age": "168h",
  "split_queries_by_interval": "15m",
  "volume_enabled": true
}

loki.memberlistConfig	object	memberlist configuration (overrides embedded default)	

{}

loki.operational_config	object	Optional operational configuration	

{}

loki.pattern_ingester	object	Optional pattern ingester configuration	

{
  "enabled": false
}

loki.podAnnotations	object	Common annotations for all pods	

{}

loki.podLabels	object	Common labels for all pods	

{}

loki.podSecurityContext	object	The SecurityContext for Loki pods	

{
  "fsGroup": 10001,
  "runAsGroup": 10001,
  "runAsNonRoot": true,
  "runAsUser": 10001
}

loki.querier	object	Optional querier configuration	

{}

loki.query_range	object	Optional querier configuration	

{}

loki.query_scheduler	object	Additional query scheduler config	

{}

loki.revisionHistoryLimit	int	The number of old ReplicaSets to retain to allow rollback	

10

loki.rulerConfig	object	Check https://grafana.com/docs/loki/latest/configuration/#ruler for more info on configuring ruler	

{
  "wal": {
    "dir": "/var/loki/ruler-wal"
  }
}

loki.runtimeConfig	object	Provides a reloadable runtime configuration file for some specific configuration	

{}

loki.schemaConfig	object	Check https://grafana.com/docs/loki/latest/configuration/#schema_config for more info on how to configure schemas	

{}

loki.server	object	Check https://grafana.com/docs/loki/latest/configuration/#server for more info on the server configuration.	

{
  "grpc_listen_port": 9095,
  "http_listen_port": 3100,
  "http_server_read_timeout": "600s",
  "http_server_write_timeout": "600s"
}

loki.serviceAnnotations	object	Common annotations for all services	

{}

loki.serviceLabels	object	Common labels for all services	

{}

loki.storage	object	In case of using thanos storage, enable use_thanos_objstore and the configuration should be done inside the object_store section.	

{
  "azure": {
    "accountKey": null,
    "accountName": null,
    "chunkDelimiter": null,
    "connectionString": null,
    "endpointSuffix": null,
    "requestTimeout": null,
    "useFederatedToken": false,
    "useManagedIdentity": false,
    "userAssignedId": null
  },
  "filesystem": {
    "chunks_directory": "/var/loki/chunks",
    "rules_directory": "/var/loki/rules"
  },
  "gcs": {
    "chunkBufferSize": 0,
    "enableHttp2": true,
    "requestTimeout": "0s"
  },
  "object_store": {
    "azure": {
      "account_key": null,
      "account_name": null
    },
    "gcs": {
      "bucket_name": null,
      "service_account": null
    },
    "s3": {
      "access_key_id": null,
      "endpoint": null,
      "http": {},
      "insecure": false,
      "region": null,
      "secret_access_key": null,
      "sse": {}
    },
    "storage_prefix": null,
    "type": "s3"
  },
  "s3": {
    "accessKeyId": null,
    "backoff_config": {},
    "disable_dualstack": false,
    "endpoint": null,
    "http_config": {},
    "insecure": false,
    "region": null,
    "s3": null,
    "s3ForcePathStyle": false,
    "secretAccessKey": null,
    "signatureVersion": null
  },
  "swift": {
    "auth_url": null,
    "auth_version": null,
    "connect_timeout": null,
    "container_name": null,
    "domain_id": null,
    "domain_name": null,
    "internal": null,
    "max_retries": null,
    "password": null,
    "project_domain_id": null,
    "project_domain_name": null,
    "project_id": null,
    "project_name": null,
    "region_name": null,
    "request_timeout": null,
    "user_domain_id": null,
    "user_domain_name": null,
    "user_id": null,
    "username": null
  },
  "type": "s3",
  "use_thanos_objstore": false
}

loki.storage.s3.backoff_config	object	Check https://grafana.com/docs/loki/latest/configure/#s3_storage_config for more info on how to provide a backoff_config	

{}

loki.storage_config	object	Additional storage config	

{
  "bloom_shipper": {
    "working_directory": "/var/loki/data/bloomshipper"
  },
  "boltdb_shipper": {
    "index_gateway_client": {
      "server_address": "{{ include \"loki.indexGatewayAddress\" . }}"
    }
  },
  "hedging": {
    "at": "250ms",
    "max_per_second": 20,
    "up_to": 3
  },
  "tsdb_shipper": {
    "index_gateway_client": {
      "server_address": "{{ include \"loki.indexGatewayAddress\" . }}"
    }
  }
}

loki.structuredConfig	object	Structured loki configuration, takes precedence over `loki.config`, `loki.schemaConfig`, `loki.storageConfig`	

{}

loki.tenants	list	Tenants list to be created on nginx htpasswd file, with name and password or passwordHash keys

Example:

 tenants:
   - name: "test-user-1"
     password: "test-password-1"
   - name: "test-user-2"
     passwordHash: "$2y$10$7O40CaY1yz7fu9O24k2/u.ct/wELYHRBsn25v/7AyuQ8E8hrLqpva" # generated using `htpasswd -nbBC10 test-user-2 test-password-2` 

	

[]

loki.tracing	object	Enable tracing	

{
  "enabled": false
}

loki.ui	object	Optional Loki UI: Provides access to a operators UI for Loki distributed. When enabled UI will be available at /ui/ of loki-gateway	

{
  "enabled": false,
  "gateway": {
    "enabled": true
  }
}

loki.useTestSchema	bool	a real Loki install requires a proper schemaConfig defined above this, however for testing or playing around you can enable useTestSchema	

false

lokiCanary.affinity	object	Affinity for canary pods	

{}

lokiCanary.annotations	object	Additional annotations for the `loki-canary` Daemonset	

{}

lokiCanary.dnsConfig	object	DNS config for canary pods	

{}

lokiCanary.enabled	bool		

true

lokiCanary.extraArgs	list	Additional CLI arguments for the `loki-canary' command	

[]

lokiCanary.extraEnv	list	Environment variables to add to the canary pods	

[]

lokiCanary.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the canary pods	

[]

lokiCanary.extraVolumeMounts	list	Volume mounts to add to the canary pods	

[]

lokiCanary.extraVolumes	list	Volumes to add to the canary pods	

[]

lokiCanary.hostUsers	string	Use the host's user namespace in loki-canary pods	

"nil"

lokiCanary.image	object	Image to use for loki canary	

{
  "digest": null,
  "pullPolicy": "IfNotPresent",
  "registry": "docker.io",
  "repository": "grafana/loki-canary",
  "tag": null
}

lokiCanary.image.digest	string	Overrides the image tag with an image digest	

null

lokiCanary.image.pullPolicy	string	Docker image pull policy	

"IfNotPresent"

lokiCanary.image.registry	string	The Docker registry	

"docker.io"

lokiCanary.image.repository	string	Docker image repository	

"grafana/loki-canary"

lokiCanary.image.tag	string	Overrides the image tag whose default is the chart's appVersion	

null

lokiCanary.kind	string	The type of the loki canary k8s rollout. This can be a DaemonSet or Deployment.	

"DaemonSet"

lokiCanary.labelname	string	The name of the label to look for at loki when doing the checks.	

"pod"

lokiCanary.lokiurl	string	If set overwrites the default value set by loki.host helper function. Use this if gateway not enabled.	

null

lokiCanary.nodeSelector	object	Node selector for canary pods	

{}

lokiCanary.podLabels	object	Additional labels for each `loki-canary` pod	

{}

lokiCanary.priorityClassName	string	The name of the PriorityClass for loki-canary pods	

null

lokiCanary.push	bool		

true

lokiCanary.replicas	int	Replicas for `loki-canary` when using a Deployment	

1

lokiCanary.resources	object	Resource requests and limits for the canary	

{}

lokiCanary.service.annotations	object	Annotations for loki-canary Service	

{}

lokiCanary.service.labels	object	Additional labels for loki-canary Service	

{}

lokiCanary.tolerations	list	Tolerations for canary pods	

[]

lokiCanary.updateStrategy	object	Update strategy for the `loki-canary` Daemonset pods	

{
  "rollingUpdate": {
    "maxUnavailable": 1
  },
  "type": "RollingUpdate"
}

memberlist.service.annotations	object		

{}

memberlist.service.publishNotReadyAddresses	bool		

false

memcached.containerSecurityContext	object	The SecurityContext for memcached containers	

{
  "allowPrivilegeEscalation": false,
  "capabilities": {
    "drop": [
      "ALL"
    ]
  },
  "readOnlyRootFilesystem": true
}

memcached.enabled	bool	Enable the built in memcached server provided by the chart	

true

memcached.image.pullPolicy	string	Memcached Docker image pull policy	

"IfNotPresent"

memcached.image.repository	string	Memcached Docker image repository	

"memcached"

memcached.image.tag	string	Memcached Docker image tag	

"1.6.39-alpine"

memcached.livenessProbe	object	Liveness probe for memcached pods	

{
  "failureThreshold": 3,
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "tcpSocket": {
    "port": "client"
  },
  "timeoutSeconds": 5
}

memcached.podSecurityContext	object	The SecurityContext override for memcached pods	

{
  "fsGroup": 11211,
  "runAsGroup": 11211,
  "runAsNonRoot": true,
  "runAsUser": 11211
}

memcached.priorityClassName	string	The name of the PriorityClass for memcached pods	

null

memcached.readinessProbe	object	Readiness probe for memcached pods (probe port defaults to container port)	

{
  "failureThreshold": 6,
  "initialDelaySeconds": 5,
  "periodSeconds": 5,
  "tcpSocket": {
    "port": "client"
  },
  "timeoutSeconds": 3
}

memcached.startupProbe	object	Startup probe for memcached pods	

{}

memcachedExporter.containerSecurityContext	object	The SecurityContext for memcached exporter containers	

{
  "allowPrivilegeEscalation": false,
  "capabilities": {
    "drop": [
      "ALL"
    ]
  },
  "readOnlyRootFilesystem": true
}

memcachedExporter.enabled	bool	Whether memcached metrics should be exported	

true

memcachedExporter.extraArgs	object	Extra args to add to the exporter container. Example: extraArgs: memcached.tls.enable: true memcached.tls.cert-file: /certs/cert.crt memcached.tls.key-file: /certs/cert.key memcached.tls.ca-file: /certs/ca.crt memcached.tls.insecure-skip-verify: false memcached.tls.server-name: memcached	

{}

memcachedExporter.image.pullPolicy	string		

"IfNotPresent"

memcachedExporter.image.repository	string		

"prom/memcached-exporter"

memcachedExporter.image.tag	string		

"v0.15.3"

memcachedExporter.livenessProbe	object	Liveness probe for memcached exporter	

{
  "failureThreshold": 3,
  "httpGet": {
    "path": "/metrics",
    "port": "http-metrics"
  },
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "timeoutSeconds": 5
}

memcachedExporter.readinessProbe	object	Readiness probe for memcached exporter	

{
  "failureThreshold": 3,
  "httpGet": {
    "path": "/metrics",
    "port": "http-metrics"
  },
  "initialDelaySeconds": 5,
  "periodSeconds": 5,
  "timeoutSeconds": 3
}

memcachedExporter.resources.limits	object		

{}

memcachedExporter.resources.requests	object		

{}

memcachedExporter.startupProbe	object	Startup probe for memcached exporter	

{}

migrate	object	Options that may be necessary when performing a migration from another helm chart	

{
  "fromDistributed": {
    "enabled": false,
    "memberlistService": ""
  }
}

migrate.fromDistributed	object	When migrating from a distributed chart like loki-distributed or enterprise-logs	

{
  "enabled": false,
  "memberlistService": ""
}

migrate.fromDistributed.enabled	bool	Set to true if migrating from a distributed helm chart	

false

migrate.fromDistributed.memberlistService	string	If migrating from a distributed service, provide the distributed deployment's memberlist service DNS so the new deployment can join its ring.	

""

minio	object	Configuration for the minio subchart	

{
  "address": null,
  "buckets": [
    {
      "name": "chunks",
      "policy": "none",
      "purge": false
    },
    {
      "name": "ruler",
      "policy": "none",
      "purge": false
    },
    {
      "name": "admin",
      "policy": "none",
      "purge": false
    }
  ],
  "drivesPerNode": 2,
  "enabled": false,
  "persistence": {
    "annotations": {},
    "size": "5Gi"
  },
  "replicas": 1,
  "resources": {
    "requests": {
      "cpu": "100m",
      "memory": "128Mi"
    }
  },
  "rootPassword": "supersecretpassword",
  "rootUser": "root-user",
  "users": [
    {
      "accessKey": "logs-user",
      "policy": "readwrite",
      "secretKey": "supersecretpassword"
    }
  ]
}

monitoring	object	Monitoring section determines which monitoring features to enable	

{
  "dashboards": {
    "annotations": {},
    "enabled": false,
    "labels": {
      "grafana_dashboard": "1"
    },
    "namespace": null
  },
  "rules": {
    "additionalGroups": [],
    "additionalRuleAnnotations": {},
    "additionalRuleLabels": {},
    "alerting": true,
    "annotations": {},
    "disabled": {},
    "enabled": false,
    "labels": {},
    "namespace": null
  },
  "selfMonitoring": {
    "enabled": false,
    "grafanaAgent": {
      "annotations": {},
      "enableConfigReadAPI": false,
      "installOperator": false,
      "labels": {},
      "priorityClassName": null,
      "resources": {},
      "tolerations": []
    },
    "logsInstance": {
      "annotations": {},
      "clients": null,
      "labels": {}
    },
    "podLogs": {
      "additionalPipelineStages": [],
      "annotations": {},
      "apiVersion": "monitoring.grafana.com/v1alpha1",
      "labels": {},
      "relabelings": []
    },
    "tenant": {
      "name": "self-monitoring",
      "password": null,
      "secretNamespace": "{{ include \"loki.namespace\" . }}"
    }
  },
  "serviceMonitor": {
    "annotations": {},
    "enabled": false,
    "interval": "15s",
    "labels": {},
    "metricRelabelings": [],
    "metricsInstance": {
      "annotations": {},
      "enabled": true,
      "labels": {},
      "remoteWrite": null
    },
    "namespaceSelector": {},
    "relabelings": [],
    "scheme": "http",
    "scrapeTimeout": null,
    "tlsConfig": null
  }
}

monitoring.dashboards.annotations	object	Additional annotations for the dashboards ConfigMap	

{}

monitoring.dashboards.enabled	bool	If enabled, create configmap with dashboards for monitoring Loki	

false

monitoring.dashboards.labels	object	Labels for the dashboards ConfigMap	

{
  "grafana_dashboard": "1"
}

monitoring.dashboards.namespace	string	Alternative namespace to create dashboards ConfigMap in	

null

monitoring.rules	object	Recording rules for monitoring Loki, required for some dashboards	

{
  "additionalGroups": [],
  "additionalRuleAnnotations": {},
  "additionalRuleLabels": {},
  "alerting": true,
  "annotations": {},
  "disabled": {},
  "enabled": false,
  "labels": {},
  "namespace": null
}

monitoring.rules.additionalGroups	list	Additional groups to add to the rules file	

[]

monitoring.rules.additionalRuleAnnotations	object	Additional annotations for PrometheusRule alerts	

{}

monitoring.rules.additionalRuleLabels	object	Additional labels for PrometheusRule alerts	

{}

monitoring.rules.alerting	bool	Include alerting rules	

true

monitoring.rules.annotations	object	Additional annotations for the rules PrometheusRule resource	

{}

monitoring.rules.disabled	object	If you disable all the alerts and keep .monitoring.rules.alerting set to true, the chart will fail to render.	

{}

monitoring.rules.enabled	bool	If enabled, create PrometheusRule resource with Loki recording rules	

false

monitoring.rules.labels	object	Additional labels for the rules PrometheusRule resource	

{}

monitoring.rules.namespace	string	Alternative namespace to create PrometheusRule resources in	

null

monitoring.selfMonitoring	object	DEPRECATED Self monitoring determines whether Loki should scrape its own logs. This feature relies on Grafana Agent Operator, which is deprecated. It will create custom resources for GrafanaAgent, LogsInstance, and PodLogs to configure scrape configs to scrape its own logs with the labels expected by the included dashboards.	

{
  "enabled": false,
  "grafanaAgent": {
    "annotations": {},
    "enableConfigReadAPI": false,
    "installOperator": false,
    "labels": {},
    "priorityClassName": null,
    "resources": {},
    "tolerations": []
  },
  "logsInstance": {
    "annotations": {},
    "clients": null,
    "labels": {}
  },
  "podLogs": {
    "additionalPipelineStages": [],
    "annotations": {},
    "apiVersion": "monitoring.grafana.com/v1alpha1",
    "labels": {},
    "relabelings": []
  },
  "tenant": {
    "name": "self-monitoring",
    "password": null,
    "secretNamespace": "{{ include \"loki.namespace\" . }}"
  }
}

monitoring.selfMonitoring.grafanaAgent	object	DEPRECATED Grafana Agent configuration	

{
  "annotations": {},
  "enableConfigReadAPI": false,
  "installOperator": false,
  "labels": {},
  "priorityClassName": null,
  "resources": {},
  "tolerations": []
}

monitoring.selfMonitoring.grafanaAgent.annotations	object	Grafana Agent annotations	

{}

monitoring.selfMonitoring.grafanaAgent.enableConfigReadAPI	bool	Enable the config read api on port 8080 of the agent	

false

monitoring.selfMonitoring.grafanaAgent.installOperator	bool	DEPRECATED Controls whether to install the Grafana Agent Operator and its CRDs. Note that helm will not install CRDs if this flag is enabled during an upgrade. In that case install the CRDs manually from https://github.com/grafana/agent/tree/main/production/operator/crds	

false

monitoring.selfMonitoring.grafanaAgent.labels	object	Additional Grafana Agent labels	

{}

monitoring.selfMonitoring.grafanaAgent.priorityClassName	string	The name of the PriorityClass for GrafanaAgent pods	

null

monitoring.selfMonitoring.grafanaAgent.resources	object	Resource requests and limits for the grafanaAgent pods	

{}

monitoring.selfMonitoring.grafanaAgent.tolerations	list	Tolerations for GrafanaAgent pods	

[]

monitoring.selfMonitoring.logsInstance.annotations	object	LogsInstance annotations	

{}

monitoring.selfMonitoring.logsInstance.clients	string	Additional clients for remote write	

null

monitoring.selfMonitoring.logsInstance.labels	object	Additional LogsInstance labels	

{}

monitoring.selfMonitoring.podLogs.additionalPipelineStages	list	Additional pipeline stages to process logs after scraping https://grafana.com/docs/agent/latest/operator/api/#pipelinestagespec-a-namemonitoringgrafanacomv1alpha1pipelinestagespeca	

[]

monitoring.selfMonitoring.podLogs.annotations	object	PodLogs annotations	

{}

monitoring.selfMonitoring.podLogs.apiVersion	string	PodLogs version	

"monitoring.grafana.com/v1alpha1"

monitoring.selfMonitoring.podLogs.labels	object	Additional PodLogs labels	

{}

monitoring.selfMonitoring.podLogs.relabelings	list	PodLogs relabel configs to apply to samples before scraping https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#relabelconfig	

[]

monitoring.selfMonitoring.tenant	object	Tenant to use for self monitoring	

{
  "name": "self-monitoring",
  "password": null,
  "secretNamespace": "{{ include \"loki.namespace\" . }}"
}

monitoring.selfMonitoring.tenant.name	string	Name of the tenant	

"self-monitoring"

monitoring.selfMonitoring.tenant.password	string	Password of the gateway for Basic auth	

null

monitoring.selfMonitoring.tenant.secretNamespace	string	Namespace to create additional tenant token secret in. Useful if your Grafana instance is in a separate namespace. Token will still be created in the canary namespace.	

The same namespace as the loki chart is installed in.

monitoring.serviceMonitor	object	ServiceMonitor configuration	

{
  "annotations": {},
  "enabled": false,
  "interval": "15s",
  "labels": {},
  "metricRelabelings": [],
  "metricsInstance": {
    "annotations": {},
    "enabled": true,
    "labels": {},
    "remoteWrite": null
  },
  "namespaceSelector": {},
  "relabelings": [],
  "scheme": "http",
  "scrapeTimeout": null,
  "tlsConfig": null
}

monitoring.serviceMonitor.annotations	object	ServiceMonitor annotations	

{}

monitoring.serviceMonitor.enabled	bool	If enabled, ServiceMonitor resources for Prometheus Operator are created	

false

monitoring.serviceMonitor.interval	string	ServiceMonitor scrape interval Default is 15s because included recording rules use a 1m rate, and scrape interval needs to be at least 1/4 rate interval.	

"15s"

monitoring.serviceMonitor.labels	object	Additional ServiceMonitor labels	

{}

monitoring.serviceMonitor.metricRelabelings	list	ServiceMonitor metric relabel configs to apply to samples before ingestion https://github.com/prometheus-operator/prometheus-operator/blob/main/Documentation/api.md#endpoint	

[]

monitoring.serviceMonitor.metricsInstance	object	DEPRECATED If defined, will create a MetricsInstance for the Grafana Agent Operator.	

{
  "annotations": {},
  "enabled": true,
  "labels": {},
  "remoteWrite": null
}

monitoring.serviceMonitor.metricsInstance.annotations	object	MetricsInstance annotations	

{}

monitoring.serviceMonitor.metricsInstance.enabled	bool	If enabled, MetricsInstance resources for Grafana Agent Operator are created	

true

monitoring.serviceMonitor.metricsInstance.labels	object	Additional MetricsInstance labels	

{}

monitoring.serviceMonitor.metricsInstance.remoteWrite	string	If defined a MetricsInstance will be created to remote write metrics.	

null

monitoring.serviceMonitor.namespaceSelector	object	Namespace selector for ServiceMonitor resources	

{}

monitoring.serviceMonitor.relabelings	list	ServiceMonitor relabel configs to apply to samples before scraping https://github.com/prometheus-operator/prometheus-operator/blob/master/Documentation/api.md#relabelconfig	

[]

monitoring.serviceMonitor.scheme	string	ServiceMonitor will use http by default, but you can pick https as well	

"http"

monitoring.serviceMonitor.scrapeTimeout	string	ServiceMonitor scrape timeout in Go duration format (e.g. 15s)	

null

monitoring.serviceMonitor.tlsConfig	string	ServiceMonitor will use these tlsConfig settings to make the health check requests	

null

nameOverride	string	Overrides the chart's name	

null

namespaceOverride	string	Overrides the chart's namespace	

null

networkPolicy.alertmanager.namespaceSelector	object	Specifies the namespace the alertmanager is running in	

{}

networkPolicy.alertmanager.podSelector	object	Specifies the alertmanager Pods. As this is cross-namespace communication, you also need the namespaceSelector.	

{}

networkPolicy.alertmanager.port	int	Specify the alertmanager port used for alerting	

9093

networkPolicy.discovery.namespaceSelector	object	Specifies the namespace the discovery Pods are running in	

{}

networkPolicy.discovery.podSelector	object	Specifies the Pods labels used for discovery. As this is cross-namespace communication, you also need the namespaceSelector.	

{}

networkPolicy.discovery.port	int	Specify the port used for discovery	

null

networkPolicy.egressKubeApiserver.enabled	bool	Enable additional cilium egress rules to kube-apiserver for backend.	

false

networkPolicy.egressWorld.enabled	bool	Enable additional cilium egress rules to external world for write, read and backend.	

false

networkPolicy.enabled	bool	Specifies whether Network Policies should be created	

false

networkPolicy.externalStorage.cidrs	list	Specifies specific network CIDRs you want to limit access to	

[]

networkPolicy.externalStorage.ports	list	Specify the port used for external storage, e.g. AWS S3	

[]

networkPolicy.flavor	string	Specifies whether the policies created will be standard Network Policies (flavor: kubernetes) or Cilium Network Policies (flavor: cilium)	

"kubernetes"

networkPolicy.ingress.namespaceSelector	object	Specifies the namespaces which are allowed to access the http port	

{}

networkPolicy.ingress.podSelector	object	Specifies the Pods which are allowed to access the http port. As this is cross-namespace communication, you also need the namespaceSelector.	

{}

networkPolicy.metrics.cidrs	list	Specifies specific network CIDRs which are allowed to access the metrics port. In case you use namespaceSelector, you also have to specify your kubelet networks here. The metrics ports are also used for probes.	

[]

networkPolicy.metrics.namespaceSelector	object	Specifies the namespaces which are allowed to access the metrics port	

{}

networkPolicy.metrics.podSelector	object	Specifies the Pods which are allowed to access the metrics port. As this is cross-namespace communication, you also need the namespaceSelector.	

{}

overridesExporter	object	Configuration for the overrides-exporter	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "overrides-exporter",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "command": null,
  "dnsConfig": {},
  "enabled": false,
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "maxUnavailable": null,
  "nodeSelector": {},
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "replicas": 0,
  "resources": {},
  "serviceAnnotations": {},
  "serviceLabels": {},
  "terminationGracePeriodSeconds": 300,
  "tolerations": [],
  "topologySpreadConstraints": []
}

overridesExporter.affinity	object	Affinity for overrides-exporter pods. The value will be passed through tpl.	

Hard node anti-affinity

overridesExporter.appProtocol	object	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

{
  "grpc": ""
}

overridesExporter.command	string	Command to execute instead of defined in Docker image	

null

overridesExporter.dnsConfig	object	DNSConfig for overrides-exporter	

{}

overridesExporter.enabled	bool	The overrides-exporter component is optional and can be disabled if desired.	

false

overridesExporter.extraArgs	list	Additional CLI args for the overrides-exporter	

[]

overridesExporter.extraContainers	list	Containers to add to the overrides-exporter pods	

[]

overridesExporter.extraEnv	list	Environment variables to add to the overrides-exporter pods	

[]

overridesExporter.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the overrides-exporter pods	

[]

overridesExporter.extraVolumeMounts	list	Volume mounts to add to the overrides-exporter pods	

[]

overridesExporter.extraVolumes	list	Volumes to add to the overrides-exporter pods	

[]

overridesExporter.hostAliases	list	hostAliases to add	

[]

overridesExporter.hostUsers	string	Use the host's user namespace in the overrides-exporter	

"nil"

overridesExporter.image.registry	string	The Docker registry for the overrides-exporter image. Overrides `loki.image.registry`	

null

overridesExporter.image.repository	string	Docker image repository for the overrides-exporter image. Overrides `loki.image.repository`	

null

overridesExporter.image.tag	string	Docker image tag for the overrides-exporter image. Overrides `loki.image.tag`	

null

overridesExporter.initContainers	list	Init containers to add to the overrides-exporter pods	

[]

overridesExporter.maxUnavailable	string	Pod Disruption Budget maxUnavailable	

null

overridesExporter.nodeSelector	object	Node selector for overrides-exporter pods	

{}

overridesExporter.podAnnotations	object	Annotations for overrides-exporter pods	

{}

overridesExporter.podLabels	object	Labels for overrides-exporter pods	

{}

overridesExporter.priorityClassName	string	The name of the PriorityClass for overrides-exporter pods	

null

overridesExporter.replicas	int	Number of replicas for the overrides-exporter	

0

overridesExporter.resources	object	Resource requests and limits for the overrides-exporter	

{}

overridesExporter.serviceAnnotations	object	Annotations for overrides-exporter service	

{}

overridesExporter.serviceLabels	object	Labels for overrides-exporter service	

{}

overridesExporter.terminationGracePeriodSeconds	int	Grace period to allow the overrides-exporter to shutdown before it is killed	

300

overridesExporter.tolerations	list	Tolerations for overrides-exporter pods	

[]

overridesExporter.topologySpreadConstraints	list	Topology Spread Constraints for overrides-exporter pods The value will be passed through tpl.	

[]

patternIngester	object	Configuration for the pattern ingester	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "pattern-ingester",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "command": null,
  "dnsConfig": {},
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "livenessProbe": {},
  "maxUnavailable": null,
  "nodeSelector": {},
  "persistence": {
    "claims": [
      {
        "accessModes": [
          "ReadWriteOnce"
        ],
        "annotations": {},
        "labels": {},
        "name": "data",
        "size": "10Gi",
        "storageClass": null
      }
    ],
    "enableStatefulSetAutoDeletePVC": false,
    "enabled": false,
    "size": "10Gi",
    "storageClass": null,
    "whenDeleted": "Retain",
    "whenScaled": "Retain"
  },
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "readinessProbe": {},
  "replicas": 0,
  "resources": {},
  "serviceAccount": {
    "annotations": {},
    "automountServiceAccountToken": true,
    "create": false,
    "imagePullSecrets": [],
    "name": null
  },
  "serviceAnnotations": {},
  "serviceLabels": {},
  "terminationGracePeriodSeconds": 30,
  "tolerations": [],
  "topologySpreadConstraints": []
}

patternIngester.affinity	object	Affinity for pattern ingester pods. The value will be passed through tpl.	

Hard node anti-affinity

patternIngester.appProtocol	object	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

{
  "grpc": ""
}

patternIngester.command	string	Command to execute instead of defined in Docker image	

null

patternIngester.dnsConfig	object	DNSConfig for pattern ingester pods	

{}

patternIngester.extraArgs	list	Additional CLI args for the pattern ingester	

[]

patternIngester.extraContainers	list	Containers to add to the pattern ingester pods	

[]

patternIngester.extraEnv	list	Environment variables to add to the pattern ingester pods	

[]

patternIngester.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the pattern ingester pods	

[]

patternIngester.extraVolumeMounts	list	Volume mounts to add to the pattern ingester pods	

[]

patternIngester.extraVolumes	list	Volumes to add to the pattern ingester pods	

[]

patternIngester.hostAliases	list	hostAliases to add	

[]

patternIngester.hostUsers	string	Use the host's user namespace in the pattern ingester	

"nil"

patternIngester.image.registry	string	The Docker registry for the pattern ingester image. Overrides `loki.image.registry`	

null

patternIngester.image.repository	string	Docker image repository for the pattern ingester image. Overrides `loki.image.repository`	

null

patternIngester.image.tag	string	Docker image tag for the pattern ingester image. Overrides `loki.image.tag`	

null

patternIngester.initContainers	list	Init containers to add to the pattern ingester pods	

[]

patternIngester.livenessProbe	object	liveness probe settings for ingester pods. If empty use `loki.livenessProbe`	

{}

patternIngester.maxUnavailable	string	Pod Disruption Budget maxUnavailable	

null

patternIngester.nodeSelector	object	Node selector for pattern ingester pods	

{}

patternIngester.persistence.claims	list	List of the pattern ingester PVCs	

patternIngester.persistence.claims[0].accessModes	list	Set access modes on the PersistentVolumeClaim	

[
  "ReadWriteOnce"
]

patternIngester.persistence.claims[0].annotations	object	Annotations for pattern ingester PVCs	

{}

patternIngester.persistence.claims[0].labels	object	Labels for pattern ingester PVCs	

{}

patternIngester.persistence.enableStatefulSetAutoDeletePVC	bool	Enable StatefulSetAutoDeletePVC feature	

false

patternIngester.persistence.enabled	bool	Enable creating PVCs for the pattern ingester	

false

patternIngester.persistence.size	string	Size of persistent disk	

"10Gi"

patternIngester.persistence.storageClass	string	Storage class to be used. If defined, storageClassName: . If set to "-", storageClassName: "", which disables dynamic provisioning. If empty or set to null, no storageClassName spec is set, choosing the default provisioner (gp2 on AWS, standard on GKE, AWS, and OpenStack).	

null

patternIngester.podAnnotations	object	Annotations for pattern ingester pods	

{}

patternIngester.podLabels	object	Labels for pattern ingester pods	

{}

patternIngester.priorityClassName	string	The name of the PriorityClass for pattern ingester pods	

null

patternIngester.readinessProbe	object	readiness probe settings for ingester pods. If empty, use `loki.readinessProbe`	

{}

patternIngester.replicas	int	Number of replicas for the pattern ingester	

0

patternIngester.resources	object	Resource requests and limits for the pattern ingester	

{}

patternIngester.serviceAccount.annotations	object	Annotations for the pattern ingester service account	

{}

patternIngester.serviceAccount.automountServiceAccountToken	bool	Set this toggle to false to opt out of automounting API credentials for the service account	

true

patternIngester.serviceAccount.imagePullSecrets	list	Image pull secrets for the pattern ingester service account	

[]

patternIngester.serviceAccount.name	string	The name of the ServiceAccount to use for the pattern ingester. If not set and create is true, a name is generated by appending "-pattern-ingester" to the common ServiceAccount.	

null

patternIngester.serviceAnnotations	object	Annotations for pattern ingester service	

{}

patternIngester.serviceLabels	object	Labels for pattern ingester service	

{}

patternIngester.terminationGracePeriodSeconds	int	Grace period to allow the pattern ingester to shutdown before it is killed	

30

patternIngester.tolerations	list	Tolerations for pattern ingester pods	

[]

patternIngester.topologySpreadConstraints	list	Topology Spread Constraints for pattern ingester pods The value will be passed through tpl.	

[]

querier	object	Configuration for the querier	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "querier",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "autoscaling": {
    "behavior": {
      "enabled": false,
      "scaleDown": {},
      "scaleUp": {}
    },
    "customMetrics": [],
    "enabled": false,
    "maxReplicas": 3,
    "minReplicas": 1,
    "targetCPUUtilizationPercentage": 60,
    "targetMemoryUtilizationPercentage": null
  },
  "command": null,
  "dnsConfig": {},
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "maxSurge": 0,
  "maxUnavailable": null,
  "nodeSelector": {},
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "replicas": 0,
  "resources": {},
  "serviceAnnotations": {},
  "serviceLabels": {},
  "serviceType": "ClusterIP",
  "terminationGracePeriodSeconds": 30,
  "tolerations": [],
  "topologySpreadConstraints": [
    {
      "labelSelector": {
        "matchLabels": {
          "app.kubernetes.io/component": "querier",
          "app.kubernetes.io/instance": "{{ .Release.Name }}",
          "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
        }
      },
      "maxSkew": 1,
      "topologyKey": "kubernetes.io/hostname",
      "whenUnsatisfiable": "ScheduleAnyway"
    }
  ]
}

querier.affinity	object	Affinity for querier pods. The value will be passed through tpl.	

Hard node anti-affinity

querier.appProtocol	object	Adds the appProtocol field to the querier service. This allows querier to work with istio protocol selection.	

{
  "grpc": ""
}

querier.appProtocol.grpc	string	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

""

querier.autoscaling.behavior.enabled	bool	Enable autoscaling behaviours	

false

querier.autoscaling.behavior.scaleDown	object	define scale down policies, must conform to HPAScalingRules	

{}

querier.autoscaling.behavior.scaleUp	object	define scale up policies, must conform to HPAScalingRules	

{}

querier.autoscaling.customMetrics	list	Allows one to define custom metrics using the HPA/v2 schema (for example, Pods, Object or External metrics)	

[]

querier.autoscaling.enabled	bool	Enable autoscaling for the querier, this is only used if `indexGateway.enabled: true`	

false

querier.autoscaling.maxReplicas	int	Maximum autoscaling replicas for the querier	

3

querier.autoscaling.minReplicas	int	Minimum autoscaling replicas for the querier	

1

querier.autoscaling.targetCPUUtilizationPercentage	int	Target CPU utilisation percentage for the querier	

60

querier.autoscaling.targetMemoryUtilizationPercentage	string	Target memory utilisation percentage for the querier	

null

querier.command	string	Command to execute instead of defined in Docker image	

null

querier.dnsConfig	object	DNSConfig for querier pods	

{}

querier.extraArgs	list	Additional CLI args for the querier	

[]

querier.extraContainers	list	Containers to add to the querier pods	

[]

querier.extraEnv	list	Environment variables to add to the querier pods	

[]

querier.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the querier pods	

[]

querier.extraVolumeMounts	list	Volume mounts to add to the querier pods	

[]

querier.extraVolumes	list	Volumes to add to the querier pods	

[]

querier.hostAliases	list	hostAliases to add	

[]

querier.hostUsers	string	Use the host's user namespace in the querier	

"nil"

querier.image.registry	string	The Docker registry for the querier image. Overrides `loki.image.registry`	

null

querier.image.repository	string	Docker image repository for the querier image. Overrides `loki.image.repository`	

null

querier.image.tag	string	Docker image tag for the querier image. Overrides `loki.image.tag`	

null

querier.initContainers	list	Init containers to add to the querier pods	

[]

querier.maxSurge	int	Max Surge for querier pods	

0

querier.maxUnavailable	string	Pod Disruption Budget maxUnavailable	

null

querier.nodeSelector	object	Node selector for querier pods	

{}

querier.podAnnotations	object	Annotations for querier pods	

{}

querier.podLabels	object	Labels for querier pods	

{}

querier.priorityClassName	string	The name of the PriorityClass for querier pods	

null

querier.replicas	int	Number of replicas for the querier	

0

querier.resources	object	Resource requests and limits for the querier	

{}

querier.serviceAnnotations	object	Annotations for querier service	

{}

querier.serviceLabels	object	Labels for querier service	

{}

querier.serviceType	string	Service Type for querier service	

"ClusterIP"

querier.terminationGracePeriodSeconds	int	Grace period to allow the querier to shutdown before it is killed	

30

querier.tolerations	list	Tolerations for querier pods	

[]

querier.topologySpreadConstraints	list	topologySpread for querier pods. The value will be passed through tpl.	

Defaults to allow skew no more then 1 node

queryFrontend	object	Configuration for the query-frontend	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "query-frontend",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "autoscaling": {
    "behavior": {
      "enabled": false,
      "scaleDown": {},
      "scaleUp": {}
    },
    "customMetrics": [],
    "enabled": false,
    "maxReplicas": 3,
    "minReplicas": 1,
    "targetCPUUtilizationPercentage": 60,
    "targetMemoryUtilizationPercentage": null
  },
  "command": null,
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "maxUnavailable": null,
  "nodeSelector": {},
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "replicas": 0,
  "resources": {},
  "serviceAnnotations": {},
  "serviceLabels": {},
  "serviceType": "ClusterIP",
  "terminationGracePeriodSeconds": 30,
  "tolerations": [],
  "topologySpreadConstraints": []
}

queryFrontend.affinity	object	Affinity for query-frontend pods. The value will be passed through tpl.	

Hard node anti-affinity

queryFrontend.appProtocol	object	Adds the appProtocol field to the queryFrontend service. This allows queryFrontend to work with istio protocol selection.	

{
  "grpc": ""
}

queryFrontend.appProtocol.grpc	string	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

""

queryFrontend.autoscaling.behavior.enabled	bool	Enable autoscaling behaviours	

false

queryFrontend.autoscaling.behavior.scaleDown	object	define scale down policies, must conform to HPAScalingRules	

{}

queryFrontend.autoscaling.behavior.scaleUp	object	define scale up policies, must conform to HPAScalingRules	

{}

queryFrontend.autoscaling.customMetrics	list	Allows one to define custom metrics using the HPA/v2 schema (for example, Pods, Object or External metrics)	

[]

queryFrontend.autoscaling.enabled	bool	Enable autoscaling for the query-frontend	

false

queryFrontend.autoscaling.maxReplicas	int	Maximum autoscaling replicas for the query-frontend	

3

queryFrontend.autoscaling.minReplicas	int	Minimum autoscaling replicas for the query-frontend	

1

queryFrontend.autoscaling.targetCPUUtilizationPercentage	int	Target CPU utilisation percentage for the query-frontend	

60

queryFrontend.autoscaling.targetMemoryUtilizationPercentage	string	Target memory utilisation percentage for the query-frontend	

null

queryFrontend.command	string	Command to execute instead of defined in Docker image	

null

queryFrontend.extraArgs	list	Additional CLI args for the query-frontend	

[]

queryFrontend.extraContainers	list	Containers to add to the query-frontend pods	

[]

queryFrontend.extraEnv	list	Environment variables to add to the query-frontend pods	

[]

queryFrontend.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the query-frontend pods	

[]

queryFrontend.extraVolumeMounts	list	Volume mounts to add to the query-frontend pods	

[]

queryFrontend.extraVolumes	list	Volumes to add to the query-frontend pods	

[]

queryFrontend.hostAliases	list	hostAliases to add	

[]

queryFrontend.hostUsers	string	Use the host's user namespace in the query-frontend	

"nil"

queryFrontend.image.registry	string	The Docker registry for the query-frontend image. Overrides `loki.image.registry`	

null

queryFrontend.image.repository	string	Docker image repository for the query-frontend image. Overrides `loki.image.repository`	

null

queryFrontend.image.tag	string	Docker image tag for the query-frontend image. Overrides `loki.image.tag`	

null

queryFrontend.initContainers	list	init containers to add to the query-frontend pods	

[]

queryFrontend.maxUnavailable	string	Pod Disruption Budget maxUnavailable	

null

queryFrontend.nodeSelector	object	Node selector for query-frontend pods	

{}

queryFrontend.podAnnotations	object	Annotations for query-frontend pods	

{}

queryFrontend.podLabels	object	Labels for query-frontend pods	

{}

queryFrontend.priorityClassName	string	The name of the PriorityClass for query-frontend pods	

null

queryFrontend.replicas	int	Number of replicas for the query-frontend	

0

queryFrontend.resources	object	Resource requests and limits for the query-frontend	

{}

queryFrontend.serviceAnnotations	object	Annotations for query-frontend service	

{}

queryFrontend.serviceLabels	object	Labels for query-frontend service	

{}

queryFrontend.serviceType	string	Service Type for query-frontend service	

"ClusterIP"

queryFrontend.terminationGracePeriodSeconds	int	Grace period to allow the query-frontend to shutdown before it is killed	

30

queryFrontend.tolerations	list	Tolerations for query-frontend pods	

[]

queryFrontend.topologySpreadConstraints	list	Topology Spread Constraints for query-frontend pods The value will be passed through tpl.	

[]

queryScheduler	object	Configuration for the query-scheduler	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "query-scheduler",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "dnsConfig": {},
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "maxUnavailable": 1,
  "nodeSelector": {},
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "replicas": 0,
  "resources": {},
  "serviceAnnotations": {},
  "serviceLabels": {},
  "terminationGracePeriodSeconds": 30,
  "tolerations": [],
  "topologySpreadConstraints": []
}

queryScheduler.affinity	object	Affinity for query-scheduler pods. The value will be passed through tpl.	

Hard node anti-affinity

queryScheduler.appProtocol	object	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

{
  "grpc": ""
}

queryScheduler.dnsConfig	object	DNSConfig for query-scheduler	

{}

queryScheduler.extraArgs	list	Additional CLI args for the query-scheduler	

[]

queryScheduler.extraContainers	list	Containers to add to the query-scheduler pods	

[]

queryScheduler.extraEnv	list	Environment variables to add to the query-scheduler pods	

[]

queryScheduler.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the query-scheduler pods	

[]

queryScheduler.extraVolumeMounts	list	Volume mounts to add to the query-scheduler pods	

[]

queryScheduler.extraVolumes	list	Volumes to add to the query-scheduler pods	

[]

queryScheduler.hostAliases	list	hostAliases to add	

[]

queryScheduler.hostUsers	string	Use the host's user namespace in the query-scheduler	

"nil"

queryScheduler.image.registry	string	The Docker registry for the query-scheduler image. Overrides `loki.image.registry`	

null

queryScheduler.image.repository	string	Docker image repository for the query-scheduler image. Overrides `loki.image.repository`	

null

queryScheduler.image.tag	string	Docker image tag for the query-scheduler image. Overrides `loki.image.tag`	

null

queryScheduler.initContainers	list	init containers to add to the query-scheduler pods	

[]

queryScheduler.maxUnavailable	int	Pod Disruption Budget maxUnavailable	

1

queryScheduler.nodeSelector	object	Node selector for query-scheduler pods	

{}

queryScheduler.podAnnotations	object	Annotations for query-scheduler pods	

{}

queryScheduler.podLabels	object	Labels for query-scheduler pods	

{}

queryScheduler.priorityClassName	string	The name of the PriorityClass for query-scheduler pods	

null

queryScheduler.replicas	int	Number of replicas for the query-scheduler. It should be lower than `-querier.max-concurrent` to avoid generating back-pressure in queriers; it's also recommended that this value evenly divides the latter	

0

queryScheduler.resources	object	Resource requests and limits for the query-scheduler	

{}

queryScheduler.serviceAnnotations	object	Annotations for query-scheduler service	

{}

queryScheduler.serviceLabels	object	Labels for query-scheduler service	

{}

queryScheduler.terminationGracePeriodSeconds	int	Grace period to allow the query-scheduler to shutdown before it is killed	

30

queryScheduler.tolerations	list	Tolerations for query-scheduler pods	

[]

queryScheduler.topologySpreadConstraints	list	Topology Spread Constraints for query-scheduler pods The value will be passed through tpl.	

[]

rbac.namespaced	bool	Whether to install RBAC in the namespace only or cluster-wide. Useful if you want to watch ConfigMap globally.	

false

rbac.pspAnnotations	object	Specify PSP annotations Ref: https://kubernetes.io/docs/reference/access-authn-authz/psp-to-pod-security-standards/#podsecuritypolicy-annotations	

{}

rbac.pspEnabled	bool	If pspEnabled true, a PodSecurityPolicy is created for K8s that use psp.	

false

rbac.sccAllowHostDirVolumePlugin	bool	Toggle this to true to allow the use of hostPath volumes on OpenShift	

false

rbac.sccEnabled	bool	For OpenShift set pspEnabled to 'false' and sccEnabled to 'true' to use the SecurityContextConstraints.	

false

read	object	Configuration for the read pod(s)	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "read",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "annotations": {},
  "autoscaling": {
    "behavior": {},
    "enabled": false,
    "maxReplicas": 6,
    "minReplicas": 2,
    "targetCPUUtilizationPercentage": 60,
    "targetMemoryUtilizationPercentage": null
  },
  "dnsConfig": {},
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "legacyReadTarget": false,
  "lifecycle": {},
  "livenessProbe": {},
  "nodeSelector": {},
  "persistence": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "annotations": {},
    "enableStatefulSetAutoDeletePVC": true,
    "labels": {},
    "selector": null,
    "size": "10Gi",
    "storageClass": null
  },
  "podAnnotations": {},
  "podLabels": {},
  "podManagementPolicy": "Parallel",
  "priorityClassName": null,
  "replicas": 3,
  "resources": {},
  "selectorLabels": {},
  "service": {
    "annotations": {},
    "labels": {},
    "type": "ClusterIP"
  },
  "targetModule": "read",
  "terminationGracePeriodSeconds": 30,
  "tolerations": [],
  "topologySpreadConstraints": []
}

read.affinity	object	Affinity for read pods. The value will be passed through tpl.	

Hard node anti-affinity

read.annotations	object	Annotations for read deployment	

{}

read.autoscaling.behavior	object	Behavior policies while scaling.	

{}

read.autoscaling.enabled	bool	Enable autoscaling for the read, this is only used if `queryIndex.enabled: true`	

false

read.autoscaling.maxReplicas	int	Maximum autoscaling replicas for the read	

6

read.autoscaling.minReplicas	int	Minimum autoscaling replicas for the read	

2

read.autoscaling.targetCPUUtilizationPercentage	int	Target CPU utilisation percentage for the read	

60

read.autoscaling.targetMemoryUtilizationPercentage	string	Target memory utilisation percentage for the read	

null

read.dnsConfig	object	DNS config for read pods	

{}

read.extraArgs	list	Additional CLI args for the read	

[]

read.extraContainers	list	Containers to add to the read pods	

[]

read.extraEnv	list	Environment variables to add to the read pods	

[]

read.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the read pods	

[]

read.extraVolumeMounts	list	Volume mounts to add to the read pods	

[]

read.extraVolumes	list	Volumes to add to the read pods	

[]

read.hostUsers	string	Use the host's user namespace in the read pods.	

"nil"

read.image.registry	string	The Docker registry for the read image. Overrides `loki.image.registry`	

null

read.image.repository	string	Docker image repository for the read image. Overrides `loki.image.repository`	

null

read.image.tag	string	Docker image tag for the read image. Overrides `loki.image.tag`	

null

read.initContainers	list	init containers to add to the read pods	

[]

read.legacyReadTarget	bool	Whether or not to use the 2 target type simple scalable mode (read, write) or the 3 target type (read, write, backend). Legacy refers to the 2 target type, so true will run two targets, false will run 3 targets.	

false

read.lifecycle	object	Lifecycle for the read container	

{}

read.livenessProbe	object	liveness probe settings for read pods. If empty, applies no livenessProbe	

{}

read.nodeSelector	object	Node selector for read pods	

{}

read.persistence	object	read.persistence is used only if legacyReadTarget is set to true	

{
  "accessModes": [
    "ReadWriteOnce"
  ],
  "annotations": {},
  "enableStatefulSetAutoDeletePVC": true,
  "labels": {},
  "selector": null,
  "size": "10Gi",
  "storageClass": null
}

read.persistence.accessModes	list	Set access modes on the PersistentVolumeClaim	

[
  "ReadWriteOnce"
]

read.persistence.annotations	object	Annotations for volume claim	

{}

read.persistence.enableStatefulSetAutoDeletePVC	bool	Enable StatefulSetAutoDeletePVC feature	

true

read.persistence.labels	object	Labels for volume claim	

{}

read.persistence.selector	string	Selector for persistent disk	

null

read.persistence.size	string	Size of persistent disk	

"10Gi"

read.persistence.storageClass	string	Storage class to be used. If defined, storageClassName: . If set to "-", storageClassName: "", which disables dynamic provisioning. If empty or set to null, no storageClassName spec is set, choosing the default provisioner (gp2 on AWS, standard on GKE, AWS, and OpenStack).	

null

read.podAnnotations	object	Annotations for read pods	

{}

read.podLabels	object	Additional labels for each `read` pod	

{}

read.podManagementPolicy	string	The default is to deploy all pods in parallel.	

"Parallel"

read.priorityClassName	string	The name of the PriorityClass for read pods	

null

read.replicas	int	Number of replicas for the read	

3

read.resources	object	Resource requests and limits for the read	

{}

read.selectorLabels	object	Additional selector labels for each `read` pod	

{}

read.service.annotations	object	Annotations for read Service	

{}

read.service.labels	object	Additional labels for read Service	

{}

read.service.type	string	Service Type for read Service	

"ClusterIP"

read.targetModule	string	Comma-separated list of Loki modules to load for the read	

"read"

read.terminationGracePeriodSeconds	int	Grace period to allow the read to shutdown before it is killed	

30

read.tolerations	list	Tolerations for read pods	

[]

read.topologySpreadConstraints	list	Topology Spread Constraints for read pods The value will be passed through tpl.	

[]

resultsCache.addresses	string	Comma separated addresses list in DNS Service Discovery format	

"dnssrvnoa+_memcached-client._tcp.{{ include \"loki.resourceName\" (dict \"ctx\" $ \"component\" \"results-cache\") }}.{{ include \"loki.namespace\" $ }}.svc"

resultsCache.affinity	object	Affinity for results-cache pods	

{}

resultsCache.allocatedMemory	int	Amount of memory allocated to results-cache for object storage (in MB).	

1024

resultsCache.annotations	object	Annotations for the results-cache pods	

{}

resultsCache.connectionLimit	int	Maximum number of connections allowed	

16384

resultsCache.defaultValidity	string	Specify how long cached results should be stored in the results-cache before being expired	

"12h"

resultsCache.dnsConfig	object	DNSConfig for results-cache	

{}

resultsCache.enabled	bool	Specifies whether memcached based results-cache should be enabled	

true

resultsCache.extraArgs	object	Additional CLI args for results-cache	

{}

resultsCache.extraContainers	list	Additional containers to be added to the results-cache pod.	

[]

resultsCache.extraExtendedOptions	string	Add extended options for results-cache memcached container. The format is the same as for the memcached -o/--extend flag. Example: extraExtendedOptions: 'tls,modern,track_sizes'	

""

resultsCache.extraVolumeMounts	list	Additional volume mounts to be added to the results-cache pod (applies to both memcached and exporter containers). Example: extraVolumeMounts: - name: extra-volume mountPath: /etc/extra-volume readOnly: true	

[]

resultsCache.extraVolumes	list	Additional volumes to be added to the results-cache pod (applies to both memcached and exporter containers). Example: extraVolumes: - name: extra-volume secret: secretName: extra-volume-secret	

[]

resultsCache.hostUsers	string	Use the host's user namespace in results-cache pods	

"nil"

resultsCache.initContainers	list	Extra init containers for results-cache pods	

[]

resultsCache.maxItemMemory	int	Maximum item results-cache for memcached (in MB).	

5

resultsCache.maxUnavailable	int	Pod Disruption Budget maxUnavailable	

1

resultsCache.nodeSelector	object	Node selector for results-cache pods	

{}

resultsCache.persistence	object	Persistence settings for the results-cache	

{
  "enabled": false,
  "labels": {},
  "mountPath": "/data",
  "storageClass": null,
  "storageSize": "10G"
}

resultsCache.persistence.enabled	bool	Enable creating PVCs for the results-cache	

false

resultsCache.persistence.labels	object	PVC additional labels	

{}

resultsCache.persistence.mountPath	string	Volume mount path	

"/data"

resultsCache.persistence.storageClass	string	Storage class to be used. If defined, storageClassName: . If set to "-", storageClassName: "", which disables dynamic provisioning. If empty or set to null, no storageClassName spec is set, choosing the default provisioner (gp2 on AWS, standard on GKE, AWS, and OpenStack).	

null

resultsCache.persistence.storageSize	string	Size of persistent disk, must be in G or Gi	

"10G"

resultsCache.podAnnotations	object	Annotations for results-cache pods	

{}

resultsCache.podLabels	object	Labels for results-cache pods	

{}

resultsCache.podManagementPolicy	string	Management policy for results-cache pods	

"Parallel"

resultsCache.port	int	Port of the results-cache service	

11211

resultsCache.priorityClassName	string	The name of the PriorityClass for results-cache pods	

null

resultsCache.replicas	int	Total number of results-cache replicas	

1

resultsCache.resources	string	Resource requests and limits for the results-cache By default a safe memory limit will be requested based on allocatedMemory value (floor (* 1.2 allocatedMemory)).	

null

resultsCache.service	object	Service annotations and labels	

{
  "annotations": {},
  "labels": {}
}

resultsCache.statefulStrategy	object	Stateful results-cache strategy	

{
  "type": "RollingUpdate"
}

resultsCache.terminationGracePeriodSeconds	int	Grace period to allow the results-cache to shutdown before it is killed	

60

resultsCache.timeout	string	Memcached operation timeout	

"500ms"

resultsCache.tolerations	list	Tolerations for results-cache pods	

[]

resultsCache.topologySpreadConstraints	list	topologySpreadConstraints allows to customize the default topologySpreadConstraints. This can be either a single dict as shown below or a slice of topologySpreadConstraints. labelSelector is taken from the constraint itself (if it exists) or is generated by the chart using the same selectors as for services.	

[]

resultsCache.writebackBuffer	int	Max number of objects to use for cache write back	

500000

resultsCache.writebackParallelism	int	Number of parallel threads for cache write back	

1

resultsCache.writebackSizeLimit	string	Max memory to use for cache write back	

"500MB"

rollout_operator	object	Setting for the Grafana Rollout Operator https://github.com/grafana/helm-charts/tree/main/charts/rollout-operator	

{
  "enabled": false,
  "podSecurityContext": {
    "fsGroup": 10001,
    "runAsGroup": 10001,
    "runAsNonRoot": true,
    "runAsUser": 10001,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "securityContext": {
    "allowPrivilegeEscalation": false,
    "capabilities": {
      "drop": [
        "ALL"
      ]
    },
    "readOnlyRootFilesystem": true
  }
}

rollout_operator.podSecurityContext	object	podSecurityContext is the pod security context for the rollout operator. When installing on OpenShift, override podSecurityContext settings with rollout_operator: podSecurityContext: fsGroup: null runAsGroup: null runAsUser: null	

{
  "fsGroup": 10001,
  "runAsGroup": 10001,
  "runAsNonRoot": true,
  "runAsUser": 10001,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}

ruler	object	Configuration for the ruler	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "ruler",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "appProtocol": {
    "grpc": ""
  },
  "command": null,
  "directories": {},
  "dnsConfig": {},
  "enabled": true,
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostAliases": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "initContainers": [],
  "maxUnavailable": null,
  "nodeSelector": {},
  "persistence": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "annotations": {},
    "enabled": false,
    "labels": {},
    "size": "10Gi",
    "storageClass": null
  },
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "replicas": 0,
  "resources": {},
  "serviceAnnotations": {},
  "serviceLabels": {},
  "sidecar": false,
  "terminationGracePeriodSeconds": 300,
  "tolerations": [],
  "topologySpreadConstraints": []
}

ruler.affinity	object	Affinity for ruler pods. The value will be passed through tpl.	

Hard node anti-affinity

ruler.appProtocol	object	Set the optional grpc service protocol. Ex: "grpc", "http2" or "https"	

{
  "grpc": ""
}

ruler.command	string	Command to execute instead of defined in Docker image	

null

ruler.directories	object	Directories containing rules files. If used, you must also configure `loki.rulerConfig.storage` to use local storage.	

{}

ruler.dnsConfig	object	DNSConfig for ruler pods	

{}

ruler.enabled	bool	The ruler component is optional and can be disabled if desired.	

true

ruler.extraArgs	list	Additional CLI args for the ruler	

[]

ruler.extraContainers	list	Containers to add to the ruler pods	

[]

ruler.extraEnv	list	Environment variables to add to the ruler pods	

[]

ruler.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the ruler pods	

[]

ruler.extraVolumeMounts	list	Volume mounts to add to the ruler pods	

[]

ruler.extraVolumes	list	Volumes to add to the ruler pods	

[]

ruler.hostAliases	list	hostAliases to add	

[]

ruler.hostUsers	string	Use the host's user namespace in the ruler	

"nil"

ruler.image.registry	string	The Docker registry for the ruler image. Overrides `loki.image.registry`	

null

ruler.image.repository	string	Docker image repository for the ruler image. Overrides `loki.image.repository`	

null

ruler.image.tag	string	Docker image tag for the ruler image. Overrides `loki.image.tag`	

null

ruler.initContainers	list	Init containers to add to the ruler pods	

[]

ruler.maxUnavailable	string	Pod Disruption Budget maxUnavailable	

null

ruler.nodeSelector	object	Node selector for ruler pods	

{}

ruler.persistence.accessModes	list	Set access modes on the PersistentVolumeClaim	

[
  "ReadWriteOnce"
]

ruler.persistence.annotations	object	Annotations for ruler PVCs	

{}

ruler.persistence.enabled	bool	Enable creating PVCs which is required when using recording rules	

false

ruler.persistence.labels	object	Labels for ruler PVCs	

{}

ruler.persistence.size	string	Size of persistent disk	

"10Gi"

ruler.persistence.storageClass	string	Storage class to be used. If defined, storageClassName: . If set to "-", storageClassName: "", which disables dynamic provisioning. If empty or set to null, no storageClassName spec is set, choosing the default provisioner (gp2 on AWS, standard on GKE, AWS, and OpenStack).	

null

ruler.podAnnotations	object	Annotations for ruler pods	

{}

ruler.podLabels	object	Labels for compactor pods	

{}

ruler.priorityClassName	string	The name of the PriorityClass for ruler pods	

null

ruler.replicas	int	Number of replicas for the ruler	

0

ruler.resources	object	Resource requests and limits for the ruler	

{}

ruler.serviceAnnotations	object	Annotations for ruler service	

{}

ruler.serviceLabels	object	Labels for ruler service	

{}

ruler.sidecar	bool	Whether to enable the rules sidecar	

false

ruler.terminationGracePeriodSeconds	int	Grace period to allow the ruler to shutdown before it is killed	

300

ruler.tolerations	list	Tolerations for ruler pods	

[]

ruler.topologySpreadConstraints	list	Topology Spread Constraints for ruler pods The value will be passed through tpl.	

[]

serviceAccount.annotations	object	Annotations for the service account	

{}

serviceAccount.automountServiceAccountToken	bool	Set this toggle to false to opt out of automounting API credentials for the service account	

true

serviceAccount.create	bool	Specifies whether a ServiceAccount should be created	

true

serviceAccount.imagePullSecrets	list	Image pull secrets for the service account	

[]

serviceAccount.labels	object	Labels for the service account	

{}

serviceAccount.name	string	The name of the ServiceAccount to use. If not set and create is true, a name is generated using the fullname template	

null

sidecar.enableUniqueFilenames	bool	Ensure that rule files aren't conflicting and being overwritten by prefixing their name with the namespace they are defined in.	

false

sidecar.image.pullPolicy	string	Docker image pull policy	

"IfNotPresent"

sidecar.image.repository	string	The Docker registry and image for the k8s sidecar	

"docker.io/kiwigrid/k8s-sidecar"

sidecar.image.sha	string	Docker image sha. If empty, no sha will be used	

""

sidecar.image.tag	string	Docker image tag	

"1.30.10"

sidecar.livenessProbe	object	Liveness probe definition. Probe is disabled on the sidecar by default.	

{}

sidecar.readinessProbe	object	Readiness probe definition. Probe is disabled on the sidecar by default.	

{}

sidecar.resources	object	Resource requests and limits for the sidecar	

{}

sidecar.rules.enabled	bool	Whether or not to create a sidecar to ingest rule from specific ConfigMaps and/or Secrets.	

true

sidecar.rules.folder	string	Folder into which the rules will be placed.	

"/rules"

sidecar.rules.folderAnnotation	string	The annotation overwriting the folder value. The annotation value can be either an absolute or a relative path. Relative paths will be relative to FOLDER. Useful for multi-tenancy setups.	

null

sidecar.rules.label	string	Label that the configmaps/secrets with rules will be marked with.	

"loki_rule"

sidecar.rules.labelValue	string	Label value that the configmaps/secrets with rules will be set to.	

""

sidecar.rules.logLevel	string	Log level of the sidecar container.	

"INFO"

sidecar.rules.resource	string	Search in configmap, secret, or both.	

"both"

sidecar.rules.script	string	Absolute path to the shell script to execute after a configmap or secret has been reloaded.	

null

sidecar.rules.searchNamespace	string	Comma separated list of namespaces. If specified, the sidecar will search for config-maps/secrets inside these namespaces. Otherwise the namespace in which the sidecar is running will be used. It's also possible to specify 'ALL' to search in all namespaces.	

null

sidecar.rules.watchClientTimeout	int	WatchClientTimeout: is a client-side timeout, configuring your local socket. If you have a network outage dropping all packets with no RST/FIN, this is how long your client waits before realizing & dropping the connection. Defaults to 66sec.	

60

sidecar.rules.watchMethod	string	Method to use to detect ConfigMap changes. With WATCH the sidecar will do a WATCH request, with SLEEP it will list all ConfigMaps, then sleep for 60 seconds.	

"WATCH"

sidecar.rules.watchServerTimeout	int	WatchServerTimeout: request to the server, asking it to cleanly close the connection after that. defaults to 60sec; much higher values like 3600 seconds (1h) are feasible for non-Azure K8S.	

60

sidecar.securityContext	object	The SecurityContext for the sidecar.	

{
  "allowPrivilegeEscalation": false,
  "capabilities": {
    "drop": [
      "ALL"
    ]
  },
  "readOnlyRootFilesystem": true
}

sidecar.skipTlsVerify	bool	Set to true to skip tls verification for kube api calls.	

false

sidecar.startupProbe	object	Startup probe definition. Probe is disabled on the sidecar by default.	

{}

singleBinary.affinity	object	Affinity for single binary pods. The value will be passed through tpl.	

Hard node anti-affinity

singleBinary.annotations	object	Annotations for single binary StatefulSet	

{}

singleBinary.autoscaling.enabled	bool	Enable autoscaling	

false

singleBinary.autoscaling.maxReplicas	int	Maximum autoscaling replicas for the single binary	

3

singleBinary.autoscaling.minReplicas	int	Minimum autoscaling replicas for the single binary	

1

singleBinary.autoscaling.targetCPUUtilizationPercentage	int	Target CPU utilisation percentage for the single binary	

60

singleBinary.autoscaling.targetMemoryUtilizationPercentage	string	Target memory utilisation percentage for the single binary	

null

singleBinary.dnsConfig	object	DNS config for single binary pods	

{}

singleBinary.extraArgs	list	Labels for single binary service	

[]

singleBinary.extraContainers	list	Extra containers to add to the single binary loki pod	

[]

singleBinary.extraEnv	list	Environment variables to add to the single binary pods	

[]

singleBinary.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the single binary pods	

[]

singleBinary.extraVolumeMounts	list	Volume mounts to add to the single binary pods	

[]

singleBinary.extraVolumes	list	Volumes to add to the single binary pods	

[]

singleBinary.hostUsers	string	Use the host's user namespace in the single binary pods	

"nil"

singleBinary.image.registry	string	The Docker registry for the single binary image. Overrides `loki.image.registry`	

null

singleBinary.image.repository	string	Docker image repository for the single binary image. Overrides `loki.image.repository`	

null

singleBinary.image.tag	string	Docker image tag for the single binary image. Overrides `loki.image.tag`	

null

singleBinary.initContainers	list	Init containers to add to the single binary pods	

[]

singleBinary.nodeSelector	object	Node selector for single binary pods	

{}

singleBinary.persistence.accessModes	list	Set access modes on the PersistentVolumeClaim	

[
  "ReadWriteOnce"
]

singleBinary.persistence.annotations	object	Annotations for volume claim	

{}

singleBinary.persistence.enableStatefulSetAutoDeletePVC	bool	Enable StatefulSetAutoDeletePVC feature	

true

singleBinary.persistence.enableStatefulSetRecreationForSizeChange	bool	Enable StatefulSetRecreation for changes to PVC size. This means that the StatefulSet will be deleted, recreated (with the same name) and rolled when a change to the PVC size is detected. That way the PVC can be resized without manual intervention.	

false

singleBinary.persistence.enabled	bool	Enable persistent disk	

true

singleBinary.persistence.labels	object	Labels for volume claim	

{}

singleBinary.persistence.selector	string	Selector for persistent disk	

null

singleBinary.persistence.size	string	Size of persistent disk	

"10Gi"

singleBinary.persistence.storageClass	string	Storage class to be used. If defined, storageClassName: . If set to "-", storageClassName: "", which disables dynamic provisioning. If empty or set to null, no storageClassName spec is set, choosing the default provisioner (gp2 on AWS, standard on GKE, AWS, and OpenStack).	

null

singleBinary.persistence.whenDeleted	string	What to do with the volumes when the StatefulSet is deleted.	

"Delete"

singleBinary.persistence.whenScaled	string	What to do with the volume when the StatefulSet is scaled down.	

"Delete"

singleBinary.podAnnotations	object	Annotations for single binary pods	

{}

singleBinary.podLabels	object	Additional labels for each `single binary` pod	

{}

singleBinary.priorityClassName	string	The name of the PriorityClass for single binary pods	

null

singleBinary.replicas	int	Number of replicas for the single binary	

0

singleBinary.resources	object	Resource requests and limits for the single binary	

{}

singleBinary.selectorLabels	object	Additional selector labels for each `single binary` pod	

{}

singleBinary.service.annotations	object	Annotations for single binary Service	

{}

singleBinary.service.labels	object	Additional labels for single binary Service	

{}

singleBinary.service.type	string	Service Type for single binary Service	

"ClusterIP"

singleBinary.targetModule	string	Comma-separated list of Loki modules to load for the single binary	

"all"

singleBinary.terminationGracePeriodSeconds	int	Grace period to allow the single binary to shutdown before it is killed	

30

singleBinary.tolerations	list	Tolerations for single binary pods	

[]

tableManager	object	DEPRECATED Configuration for the table-manager. The table-manager is only necessary when using a deprecated index type such as Cassandra, Bigtable, or DynamoDB, it has not been necessary since loki introduced self- contained index types like 'boltdb-shipper' and 'tsdb'. This will be removed in a future helm chart.	

{
  "affinity": {
    "podAntiAffinity": {
      "requiredDuringSchedulingIgnoredDuringExecution": [
        {
          "labelSelector": {
            "matchLabels": {
              "app.kubernetes.io/component": "table-manager",
              "app.kubernetes.io/instance": "{{ .Release.Name }}",
              "app.kubernetes.io/name": "{{ include \"loki.name\" . }}"
            }
          },
          "topologyKey": "kubernetes.io/hostname"
        }
      ]
    }
  },
  "annotations": {},
  "command": null,
  "dnsConfig": {},
  "enabled": false,
  "extraArgs": [],
  "extraContainers": [],
  "extraEnv": [],
  "extraEnvFrom": [],
  "extraVolumeMounts": [],
  "extraVolumes": [],
  "hostUsers": "nil",
  "image": {
    "registry": null,
    "repository": null,
    "tag": null
  },
  "nodeSelector": {},
  "podAnnotations": {},
  "podLabels": {},
  "priorityClassName": null,
  "resources": {},
  "retention_deletes_enabled": false,
  "retention_period": 0,
  "service": {
    "annotations": {},
    "labels": {}
  },
  "terminationGracePeriodSeconds": 30,
  "tolerations": []
}

tableManager.affinity	object	Affinity for table-manager pods. The value will be passed through tpl.	

Hard node and anti-affinity

tableManager.annotations	object	Annotations for table-manager deployment	

{}

tableManager.command	string	Command to execute instead of defined in Docker image	

null

tableManager.dnsConfig	object	DNS config table-manager pods	

{}

tableManager.enabled	bool	Specifies whether the table-manager should be enabled	

false

tableManager.extraArgs	list	Additional CLI args for the table-manager	

[]

tableManager.extraContainers	list	Containers to add to the table-manager pods	

[]

tableManager.extraEnv	list	Environment variables to add to the table-manager pods	

[]

tableManager.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the table-manager pods	

[]

tableManager.extraVolumeMounts	list	Volume mounts to add to the table-manager pods	

[]

tableManager.extraVolumes	list	Volumes to add to the table-manager pods	

[]

tableManager.hostUsers	string	Use the host's user namespace in table-manager pods	

"nil"

tableManager.image.registry	string	The Docker registry for the table-manager image. Overrides `loki.image.registry`	

null

tableManager.image.repository	string	Docker image repository for the table-manager image. Overrides `loki.image.repository`	

null

tableManager.image.tag	string	Docker image tag for the table-manager image. Overrides `loki.image.tag`	

null

tableManager.nodeSelector	object	Node selector for table-manager pods	

{}

tableManager.podAnnotations	object	Annotations for table-manager pods	

{}

tableManager.podLabels	object	Labels for table-manager pods	

{}

tableManager.priorityClassName	string	The name of the PriorityClass for table-manager pods	

null

tableManager.resources	object	Resource requests and limits for the table-manager	

{}

tableManager.retention_deletes_enabled	bool	Enable deletes by retention	

false

tableManager.retention_period	int	Set retention period	

0

tableManager.service.annotations	object	Annotations for table-manager Service	

{}

tableManager.service.labels	object	Additional labels for table-manager Service	

{}

tableManager.terminationGracePeriodSeconds	int	Grace period to allow the table-manager to shutdown before it is killed	

30

tableManager.tolerations	list	Tolerations for table-manager pods	

[]

test	object	Section for configuring optional Helm test	

{
  "annotations": {},
  "canaryServiceAddress": "http://loki-canary:3500/metrics",
  "enabled": true,
  "hostUsers": "nil",
  "image": {
    "digest": null,
    "pullPolicy": "IfNotPresent",
    "registry": "docker.io",
    "repository": "grafana/loki-helm-test",
    "tag": "latest"
  },
  "labels": {},
  "prometheusAddress": "",
  "timeout": "1m"
}

test.annotations	object	Additional annotations for test pods	

{}

test.canaryServiceAddress	string	Used to directly query the metrics endpoint of the canary for testing, this approach avoids needing prometheus for testing. This in a newer approach to using prometheusAddress such that tests do not have a dependency on prometheus	

"http://loki-canary:3500/metrics"

test.hostUsers	string	Use the host's user namespace in test pods	

"nil"

test.image	object	Image to use for loki canary	

{
  "digest": null,
  "pullPolicy": "IfNotPresent",
  "registry": "docker.io",
  "repository": "grafana/loki-helm-test",
  "tag": "latest"
}

test.image.digest	string	Overrides the image tag with an image digest	

null

test.image.pullPolicy	string	Docker image pull policy	

"IfNotPresent"

test.image.registry	string	The Docker registry	

"docker.io"

test.image.repository	string	Docker image repository	

"grafana/loki-helm-test"

test.image.tag	string	Overrides the image tag whose default is the chart's appVersion	

"latest"

test.labels	object	Additional labels for the test pods	

{}

test.prometheusAddress	string	Address of the prometheus server to query for the test. This overrides any value set for canaryServiceAddress. This is kept for backward compatibility and may be removed in future releases. Previous value was 'http://prometheus:9090'	

""

test.timeout	string	Number of times to retry the test before failing	

"1m"

write.affinity	object	Affinity for write pods. The value will be passed through tpl.	

Hard node anti-affinity

write.annotations	object	Annotations for write StatefulSet	

{}

write.autoscaling.behavior	object	Behavior policies while scaling.	

{
  "scaleDown": {
    "policies": [
      {
        "periodSeconds": 1800,
        "type": "Pods",
        "value": 1
      }
    ],
    "stabilizationWindowSeconds": 3600
  },
  "scaleUp": {
    "policies": [
      {
        "periodSeconds": 900,
        "type": "Pods",
        "value": 1
      }
    ]
  }
}

write.autoscaling.behavior.scaleUp	object	see https://github.com/grafana/loki/blob/main/docs/sources/operations/storage/wal.md#how-to-scale-updown for scaledown details	

{
  "policies": [
    {
      "periodSeconds": 900,
      "type": "Pods",
      "value": 1
    }
  ]
}

write.autoscaling.enabled	bool	Enable autoscaling for the write.	

false

write.autoscaling.maxReplicas	int	Maximum autoscaling replicas for the write.	

6

write.autoscaling.minReplicas	int	Minimum autoscaling replicas for the write.	

2

write.autoscaling.targetCPUUtilizationPercentage	int	Target CPU utilisation percentage for the write.	

60

write.autoscaling.targetMemoryUtilizationPercentage	string	Target memory utilization percentage for the write.	

null

write.dnsConfig	object	DNS config for write pods	

{}

write.extraArgs	list	Additional CLI args for the write	

[]

write.extraContainers	list	Containers to add to the write pods	

[]

write.extraEnv	list	Environment variables to add to the write pods	

[]

write.extraEnvFrom	list	Environment variables from secrets or configmaps to add to the write pods	

[]

write.extraVolumeClaimTemplates	list	volumeClaimTemplates to add to StatefulSet	

[]

write.extraVolumeMounts	list	Volume mounts to add to the write pods	

[]

write.extraVolumes	list	Volumes to add to the write pods	

[]

write.hostUsers	string	Use the host's user namespace in the write pods.	

"nil"

write.image.registry	string	The Docker registry for the write image. Overrides `loki.image.registry`	

null

write.image.repository	string	Docker image repository for the write image. Overrides `loki.image.repository`	

null

write.image.tag	string	Docker image tag for the write image. Overrides `loki.image.tag`	

null

write.initContainers	list	Init containers to add to the write pods	

[]

write.lifecycle	object	Lifecycle for the write container	

{}

write.nodeSelector	object	Node selector for write pods	

{}

write.persistence.accessModes	list	Set access modes on the PersistentVolumeClaim	

[
  "ReadWriteOnce"
]

write.persistence.annotations	object	Annotations for volume claim	

{}

write.persistence.dataVolumeParameters	object	Parameters used for the `data` volume when volumeClaimEnabled if false	

{
  "emptyDir": {}
}

write.persistence.enableStatefulSetAutoDeletePVC	bool	Enable StatefulSetAutoDeletePVC feature	

false

write.persistence.labels	object	Labels for volume claim	

{}

write.persistence.selector	string	Selector for persistent disk	

null

write.persistence.size	string	Size of persistent disk	

"10Gi"

write.persistence.storageClass	string	Storage class to be used. If defined, storageClassName: . If set to "-", storageClassName: "", which disables dynamic provisioning. If empty or set to null, no storageClassName spec is set, choosing the default provisioner (gp2 on AWS, standard on GKE, AWS, and OpenStack).	

null

write.persistence.volumeClaimsEnabled	bool	Enable volume claims in pod spec	

true

write.podAnnotations	object	Annotations for write pods	

{}

write.podLabels	object	Additional labels for each `write` pod	

{}

write.podManagementPolicy	string	The default is to deploy all pods in parallel.	

"Parallel"

write.priorityClassName	string	The name of the PriorityClass for write pods	

null

write.replicas	int	Number of replicas for the write	

3

write.resources	object	Resource requests and limits for the write	

{}

write.selectorLabels	object	Additional selector labels for each `write` pod	

{}

write.service.annotations	object	Annotations for write Service	

{}

write.service.labels	object	Additional labels for write Service	

{}

write.service.type	string	Service Type for write Service	

"ClusterIP"

write.targetModule	string	Comma-separated list of Loki modules to load for the write	

"write"

write.terminationGracePeriodSeconds	int	Grace period to allow the write to shutdown before it is killed. Especially for the ingester, this must be increased. It must be long enough so writes can be gracefully shutdown flushing/transferring all data and to successfully leave the member ring on shutdown.	

300

write.tolerations	list	Tolerations for write pods	

[]

write.topologySpreadConstraints	list	Topology Spread Constraints for write pods The value will be passed through tpl.	

[]


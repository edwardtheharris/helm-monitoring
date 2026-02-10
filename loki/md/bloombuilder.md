
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

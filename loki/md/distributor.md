

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


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

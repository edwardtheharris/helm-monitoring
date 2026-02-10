

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

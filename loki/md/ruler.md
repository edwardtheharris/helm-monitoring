
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

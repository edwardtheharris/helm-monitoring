
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

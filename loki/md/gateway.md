

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
{}ue

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

gateway.service.annotations	object	Annotations for the gateway service	ue

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

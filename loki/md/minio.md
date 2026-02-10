

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

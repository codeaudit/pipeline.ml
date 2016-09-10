## Prequisites
* None

## Start Docker Container with [Kubernetes](http://kubernetes.io) and [Fabric8](fabric8.io) Installed
* KUBERNETES_SERVER:  Host/IP of Google Container (GKE) Cluster Endpoint

![Google Container Endpoint](http://advancedspark.com/img/gke-cluster-endpoint.png)

* KUBERNETES_USERNAME:  Admin User of Google Container (GKE) Cluster
* KUBERNETES_PASSWORD:  Admin Password of Google Container (GKE) Cluster

![Google Container Credentials](http://advancedspark.com/img/gke-cluster-show-credentials.png)

![Google Container Username and Password](http://advancedspark.com/img/gke-cluster-username-password.png)

```
docker run -itd --name=pipeline-manager --privileged --net=host -e KUBERNETES_SERVER=<kubernetes-server> -e KUBERNETES_USERNAME=<kubernetes-username> -e KUBERNETES_PASSWORD=<kubernetes-password> fluxcapacitor/pipeline-manager
```

## Verify Successful Start through Logs
```
docker logs -f pipeline-manager

### EXPECTED OUTPUT ###
...
user "demo" set.
cluster "demo" set.
context "demo" set.
switched to context "demo".
NAME              STATUS    AGE
gke-cluster-...   Ready     1m
gke-cluster-...   Ready     1m
gke-cluster-...   Ready     1m
Kubernetes master is running at https://...
GLBCDefaultBackend is running at https://.../api/v1/proxy/namespaces/kube-system/services/default-http-backend
Heapster is running at https://.../api/v1/proxy/namespaces/kube-system/services/heapster
KubeDNS is running at https://.../api/v1/proxy/namespaces/kube-system/services/kube-dns
kubernetes-dashboard is running at https://.../api/v1/proxy/namespaces/kube-system/services/kubernetes-dashboard
...
```

## Navigate to the Fabric8 Console
```
https://<kubernetes-server>/api/v1/proxy/namespaces/default/services/fabric8
```

## Shell into the Docker Container 
```
docker exec -it pipeline-manager bash
```

## (Optional) Build new Docker Image
```
cd pipeline.ml

docker build -t fluxcapacitor/pipeline-manager .
```

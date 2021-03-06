Based on [this](https://blog.fabric8.io/fabric8-on-google-container-engine-cbb1bdc9f6f4#.4b1koxa83) video and [this](http://fabric8.io/guide/getStarted/gke.html) documentation.

## Prequisites
* Create a Google Container (GKE) Cluster

![Google Container Cluster Create](http://advancedspark.com/img/gke-create-cluster.png)

![Google Container Cluster Create Options](http://advancedspark.com/img/gke-create-cluster-options.png)

## Start Docker Container with [Kubernetes](http://kubernetes.io) and [Fabric8](fabric8.io) Installed
```
docker run -itd --name=pipeline-manager --privileged --net=host -e KUBERNETES_SERVER=<kubernetes-server> -e KUBERNETES_USERNAME=<kubernetes-username> -e KUBERNETES_PASSWORD=<kubernetes-password> fluxcapacitor/pipeline-manager
```

* KUBERNETES_SERVER:  Host/IP of Google Container (GKE) Cluster Endpoint

![Google Container Endpoint](http://advancedspark.com/img/gke-cluster-endpoint-ip.png)

* KUBERNETES_USERNAME:  Admin User of Google Container (GKE) Cluster
* KUBERNETES_PASSWORD:  Admin Password of Google Container (GKE) Cluster

![Google Container Credentials](http://advancedspark.com/img/gke-cluster-show-credentials.png)

![Google Container Username and Password](http://advancedspark.com/img/gke-cluster-username-password.png)

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
## Wait for External IPs
```
kubectl get svc -w

### EXPECTED OUTPUT ###
...
NAME                      CLUSTER-IP     EXTERNAL-IP       PORT(S)     AGE
fabric8                   10.3.242.187   a.valid.ip.addr   80/TCP      8m  <-- GOOD (Use this External IP in Next Step)
...
nexus                     10.3.242.128   <pending>         80/TCP      8m  <-- NOT GOOD (Possibly Exceeding Quota)
```

_If you are having problems acquiring external IPs, you may be exceeding your Google Platform Quotas._

_See http://fabric8.io/guide/getStarted/gke.html#google-container-engine-quotas, create a new account, or request a limit increase from Google_

![Google Container Cluster Create Options](http://advancedspark.com/img/gke-exceed-quotas.png)

## Navigate to the Fabric8 Console (External IP from Above)
* Copy and Paste the External IP from Above (a.valid.ip.addr)
```
https://<fabric8-external-ip>
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

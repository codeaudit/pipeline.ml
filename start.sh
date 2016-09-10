kubectl config set-credentials demo --username=$KUBERNETES_USERNAME --password=$KUBERNETES_PASSWORD
kubectl config set-cluster demo --insecure-skip-tls-verify=true --server=https://$KUBERNETES_SERVER
kubectl config set-context demo --user=demo --namespace=default --cluster=demo
kubectl config use-context demo
kubectl get nodes
kubectl cluster-info

./gofabric8 deploy -y

kubectl get pods --watch

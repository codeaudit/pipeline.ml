## Prequisites

## Start Docker Container
```
docker run -itd --name=pipeline-manager --privileged --net=host -e KUBERNETES_SERVER=<kubernetes-server> -e KUBERNETES_USERNAME=<kubernetes-username> -e KUBERNETES_PASSWORD=<kubernetes-password> fluxcapacitor/pipeline-manager
```

## Verify Successful Start through Logs
```
docker logs -f pipeline-manager
```
## Verify Successful Start through Kafka REST API
```
# TODO:  curl http://localhost:8082/topics

*** EXPECTED OUTPUT ***
# TODO:  
```
## (Optional) Verify Successful through Kafka Directly
* Bash into the Docker Container 
```
docker exec -it pipeline-manager bash
```
* From within the Docker Container
```
# TODO:  root@docker# confluent-3.0.0/bin/kafka-topics --zookeeper localhost:2181 --list

*** EXPECTED OUTPUT ***
# TODO:  
```

## (Optional) Build new Docker Image
```
cd pipeline.ml

docker build -t fluxcapacitor/pipeline-manager .
```

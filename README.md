
##   Happy panda - Hello World      
A simple HTML Hellow World application

### Docker 

#### You need to have install git and docker 

	docker build -t <container_name> .
    docker run --name helloworld-html -d -p 8080:80 <container_name>


Then http://localhost:8080
  

#### Clean up
	
	docker stop <container_name>

    docker rm <container_name>
   


### Kubernetes 	

    kubectl apply -f kubernetes/deployment.yaml

    kubectl apply -f kubernetes/service.yaml


#### Clean up

    kubectl delete -f kubernetes/deployment.yaml

    kubectl delete -f kubernetes/service.yaml
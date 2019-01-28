
##   Happy panda - Hello World      
A simple HTML Hellow World application.

### Docker 

##### You need to have install git and docker 

	docker build -t <container_name> .
    docker run --name helloworld-html -d -p 8080:80 <container_name>


Then http://localhost:8080
  

##### Clean up
	
	docker stop <container_name>

    docker rm <container_name>
   

### Kubernetes 	

##### Deploy Version 1

    kubectl apply -f kubernetes/deployment_happypanda_version1.yaml

    kubectl apply -f kubernetes/service.yaml

Then http://localhost:<Service_NodePort>

##### Deploy Version 2

     kubectl apply -f kubernetes/deployment_happypanda_version2.yaml

Then http://localhost:<Service_NodePort>

##### Rollback to Version 1

    sh rollback.sh

##### Clean up

    kubectl delete -f kubernetes/deployment_happypanda_version2.yaml

    kubectl delete -f kubernetes/service.yaml

Authors
=======
Originally created by [Andres Guisado](https://github.com/andresguisado) [@andresguisado](https://twitter.com/andresguisado)

License
=======

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details


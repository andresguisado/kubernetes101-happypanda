PROXY-PORT ?= 32500
HOST ?= localhost

#Cleanup any leftovers so we can try demo again
demo-cleanup:
				kubectl delete deployments -l name=helloworld-happypanda-deployment  --now
				kubectl delete services -l name=helloworld-happypanda-service --now
				kubectl delete secret -l name=helloworld-happypanda-secret --now
				kubectl delete configmap -l name=helloworld-happypanda-configmap --now

#Deploy Version1 of Hello World Happy panda
demo-1: 
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl apply -f ./kubernetes/deployment_happypanda_version1.yaml --record
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	sleep 15
	kubectl get pods
	kubectl get deployments
	kubectl get rs

#Create a service for Hello World Happy panda
demo-2:
	kubectl get services
	kubectl get endpoints
	kubectl apply -f ./kubernetes/service.yaml
	sleep 5
	kubectl get services
	kubectl get endpoints
	curl http://$(HOST):$(PROXY-PORT)/

#Deploy Version2 of Hello World Happy panda
demo-3:
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl get svc
	kubectl apply -f ./kubernetes/deployment_happypanda_version2.yaml --record
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl get svc
	sleep 15
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl get svc
	curl http://$(HOST):$(PROXY-PORT)/

#Rollback to Version1 of Hello World Happy Panda
demo-4:
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl get svc
	kubectl rollout undo deployment/helloworld-happypanda-deployment --to-revision=1
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl get svc
	sleep 15
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl get svc
	curl http://$(HOST):$(PROXY-PORT)/

#Deploy Version3 of Hello World Happy panda with configmap and secret
demo-5:
	kubectl get secrets
	kubectl get configmaps
	kubectl apply -f ./kubernetes/secret1.yaml
	kubectl apply -f ./kubernetes/configmap1.yaml
	kubectl get secrets
	kubectl get configmaps
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl get svc
	kubectl apply -f ./kubernetes/deployment_happypanda_version3_configmap_secret.yaml --record
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl get svc
	sleep 15
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl get svc
	curl http://$(HOST):$(PROXY-PORT)/

#Replace Secret
demo-6:
	kubectl apply -f ./kubernetes/secret2.yaml
	sleep 15

#Replace Configmap value
demo-7:
	kubectl apply -f ./kubernetes/configmap2.yaml
	sleep 15

#Rollback to Version1 of Hello World Happy Panda
demo-8:
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl get svc
	kubectl rollout undo deployment/helloworld-happypanda-deployment --to-revision=3
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl get svc
	sleep 15
	kubectl get pods
	kubectl get deployments
	kubectl get rs
	kubectl get svc
	curl http://$(HOST):$(PROXY-PORT)/

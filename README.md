
#   Kubernetes 101 - Happy Panda App      
A simple Happy Panda html page.

## Getting Started

You need the following software:

* Git
* Kubectl
* Kubernetes on Docker
* Make

## Docker for troubleshooting

You might want to run a container on docker with a volume dynamically mounted due to troubleshooting purposes, to do so you can run the following docker command:

    docker run --name <container_name> -v $PWD/src:/usr/share/nginx/html:ro -d -p 8080:80 nginx

Then http://localhost:8080

Now you can modify the code within **src** folder and check it out instantly in your browser.
  
##### Clean up
	
	docker stop <container_name>

    docker rm <container_name>
   

## Kubernetes 	

We need to execute the following commands within this repo directory.

Everything can be checked on this URL:

    http://localhost:32500

#### Demo-1: Deploy Version1 of Happy Panda app.

    make demo-1

#### Demo-2: Create a service for Happy Panda app.

    make demo-2

#### Demo-3: Deploy Version2 of Happy Panda app.

    make demo-3

#### Demo-4: Rollback to Version1 of Happy Panda app.

    make demo-4

#### Demo-5: Deploy Version3 of Happy Panda app with configmap and secret.

    make demo-5

#### Demo-6: Overwrite Secret.

    make demo-6

#### Demo-7: Overwrite Configmap value.

    make demo-7

#### Demo-8: Rollback to Version1 of Happy Panda app.

    make demo-8

#### Demo-cleanup: Delete everything.

    make demo-cleanup

Authors
=======
Originally created by [Andres Guisado](https://github.com/andresguisado) 

[@andresguisado](https://twitter.com/andresguisado)

License
=======

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details


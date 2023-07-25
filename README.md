# docker-centos7-apache-php8
Documenting the process of deploying a docker container using CentOS 7 image and apache/php8 services

We will deploy the container using a dockerfile and install the httpd and php services inside the container. 

## Building docker image
Create a docker image using below command 
```
docker build -t apache-php .
```
apache-php is the name of the docker image. You can change the <i><b>image name</i></b> as per your project. 

## Creating a docker container
To create or run a container using the image we created, we can use the below command
```
docker run -d --name web-server --privileged=true -p 8080:80 -p 8443:443 apache-php
```
In the above comamnd we can change the <b><i>name</i></b> of the <b><i>container</i></b> as per need. 

We can expose the ports using <i><b> -p </i></b> and redirect traffic from egress to ingress port. 

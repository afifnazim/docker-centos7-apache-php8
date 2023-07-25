# docker-centos7-apache-php8
Documenting the process of deploying a docker container using CentOS 7 image and apache/php8 services

We will deploy the container using a dockerfile and install the httpd and php services inside the container. 

## Building docker image
Create a docker image using below command 
```
docker build -t apache-php .
```
apache-php is the name of the docker image. You can change the <i>image name</i> as per your project. 

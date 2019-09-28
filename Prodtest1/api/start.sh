#!/bin/bash
imageName_api=xx:api
imageName_nginx=xx:nginx
containerName_nginx=nginx
containerName_api=api

docker build -t $imageName_api -f Dockerfile /scratch/test_nginx_docker/api/

docker build -t $imageName_nginx -f Dockerfile /scratch/test_nginx_docker/nginx/

echo Delete old_container

docker rm -f $containerName_nginx
docker rm -f $containerName_api

echo Run new_container

docker run -d --name $containerName_api $imageName_api
docker run -d -p 80:80 --name $containerName_nginx $imageName_nginx



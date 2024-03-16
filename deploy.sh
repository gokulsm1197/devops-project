#!/bin/bash
echo "deployment start"
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker rmi $(docker images -q)
docker pull gokulsm/dev
docker run -d -it -p 80:80 gokulsm/dev
echo "deployment completed"

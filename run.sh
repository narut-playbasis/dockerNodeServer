#!/bin/bash
if ! type "docker-compose" > /dev/null; then
  # install docker-compose here
  sudo wget --no-check-certificate https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m`
  sudo mv docker-compose-`uname -s`-`uname -m` /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  docker-compose --version
fi

rm -rf src
git clone -b feature/NodeServerDockerTest https://github.com/playbasis/api.git ./src
docker pull node
docker pull redis
docker-compose build
docker-compose up
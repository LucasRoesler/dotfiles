#!/bin/sh

# Clean up Docker for Mac cow problem

function print_cow {
    echo "The Docker cow is currently consuming:"
    du -smh ~/Library/Containers/com.docker.docker/Data/**/*.qcow2
}


function reset_docker {
    echo "Removing all docker images and volumes"
    docker rm $(docker ps -a -q)
    docker rmi -f $(docker images -q)
    docker volume rm $(docker volume ls |awk '{print $2}')

    echo "Stoping docker"
    killall Docker

    echo "Killing the cow"
    rm -r ~/Library/Containers/com.docker.docker/Data/**/*.qcow2

    echo "Restarting docker"
    open /Applications/Docker.app
}

function pull_favorites {
    echo "Pulling my favorite images"
    docker pull registry:2
    docker pull alpine:latest
    docker pull golang:1.9
    docker pull python:slim
    docker pull functions/alpine:health
    docker pull postgres:alpine
    docker pull jupyter/all-spark-notebook:latest
}

function wait_for_docker {
    echo "Waiting for Docker bootup"
    sleep 2s
    until docker system info &>/dev/null
    do
        sleep 2s
    done
}


echo "Resetting the docker env to use Docker for Mac"
eval $(docker-machine env -u)

print_cow

while true; do
    read -p "Do you wish to clean up the cow file and re-pull your favorite images? " yn
    case $yn in
        [Yy]* )
            reset_docker
            wait_for_docker
            pull_favorites
            exit
            ;;
        [Nn]* )
            exit
            ;;
        * )
            echo "Please answer yes or no."
            ;;
    esac
done

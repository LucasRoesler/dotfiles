function shell_into_docker () {
    docker exec -it "$1" /bin/sh
}

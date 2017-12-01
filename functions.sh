function shell_into_docker () {
    case "$1" in
    "-b" | "--bash")
        docker exec -it "$2" /bin/bash
        ;;
    *)
        docker exec -it "$1" /bin/sh
    esac
}

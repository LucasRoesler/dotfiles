#! /bin/bash

function core_dotfiles {
    echo "Setup dotfiles"
    ln -sf $(pwd)/aliases $HOME/.aliases
    ln -sf $(pwd)/functions.sh $HOME/.functions
    ln -sf $(pwd)/mac $HOME/.mac
    ln -sf $(pwd)/slate $HOME/.slate
    ln -sf $(pwd)/bashrc $HOME/.bashrc
    ln -sf $(pwd)/zshrc $HOME/.zshrc
    ln -sf $(pwd)/gitconfig $HOME/.gitconfig
    ln -sf $(pwd)/gitmessage $HOME/.gitmessage
}

USAGE='setup.sh (mac|linux)'

case "$1" in
    "mac")
        core_dotfiles
        bash ./setup_mac.sh
        ;;
    "linux")
        core_dotfiles
        bash ./setup_linux.sh
        ;;
    "-h" | "--help" | "help")
        echo $USAGE
        ;;
    *)
        echo "must provide a target system argument (mac|linux), for example"
        echo "    ./setup.sh mac"
        echo "use ./setup.sh -h for more information"
        exit 1
esac

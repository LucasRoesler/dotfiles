
if [ -e "$HOME/.config/lucas/kubectrl-completion.sh" ]
then
    # shellcheck source=/dev/null
    source $HOME/.config/lucas/kubectrl-completion.sh
fi

if [ -e "$HOME/.config/lucas/minikube-completion.sh" ]
then
    # shellcheck source=/dev/null
    source $HOME/.config/lucas/minikube-completion.sh
fi

if [ -e "$HOME/.config/lucas/helm-completion.sh" ];
then
    # shellcheck source=/dev/null
    source $HOME/.config/lucas/helm-completion.sh
fi


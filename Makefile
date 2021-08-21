
ANTIBODY:=/usr/local/bin/antibody
FISH_CONFIG:=${HOME}/.config/fish

${ANTIBODY}:
	curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

${HOME}/.zshrc:
	ln -sf $(CURDIR)/zshrc ${HOME}/.zshrc

${HOME}/.zsh_plugins.sh: ${ANTIBODY}
	ln -sf $(CURDIR)/zsh_plugins.txt ${HOME}/.zsh_plugins.txt
	antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

zsh: ${HOME}/.zshrc ${HOME}/.zsh_plugins.sh  ## Install zsh configuration


${HOME}/.config/fish:
	ln -sf $(CURDIR)/config/fish ${HOME}/.config/fish

fish: ${HOME}/.config/fish ## Install fish shell configuration
	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
	fisher update

FISH_CONFIG:=${HOME}/.config/fish

${HOME}/.config/fish:
	ln -sf $(CURDIR)/config/fish ${HOME}/.config/fish

fish: ${HOME}/.config/fish ## Install fish shell configuration
	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
	fisher update

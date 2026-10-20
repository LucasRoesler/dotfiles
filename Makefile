
FISH_CONFIG:=${HOME}/.config/fish

.PHONY: fish bin

${HOME}/.config/fish:
	ln -sf $(CURDIR)/config/fish ${HOME}/.config/fish

fish: ${HOME}/.config/fish ## Install fish shell configuration
	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
	fisher update

bin: ## Symlink bin/ scripts to ~/.local/bin
	mkdir -p ${HOME}/.local/bin
	@for f in $(CURDIR)/bin/*; do \
		ln -sf "$$f" ${HOME}/.local/bin/$$(basename "$$f"); \
	done

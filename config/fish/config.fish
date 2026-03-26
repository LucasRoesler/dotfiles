set -gxp PATH $HOME/.local/bin
set -gx EDITOR nvim

# Sensitive functions which are not pushed to Github
# It contains work related stuff, some functions, aliases etc...
function load_config
    if test -f "$HOME/.config/lucas/$argv"
        source $HOME/.config/lucas/$argv
    end
end

load_config "contiamo.env"
load_config "secrets.sh"

set -gx VAULT_PATH $HOME/Documents/notes-vault

set -gx DOCKER_BUILDKIT 1
set -gx BUILDKIT_PROGRESS plain
set -gx MOZ_ENABLE_WAYLAND 1

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

if status is-interactive
    # Ensures Zellij looks for an existing session to attach to
    set -gx ZELLIJ_AUTO_ATTACH true

end

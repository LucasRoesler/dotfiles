set -gxp PATH $HOME/.local/bin
set -gx EDITOR nvim
set -g fish_greeting
fish_add_path -g $HOME/.opencode/bin $HOME/.fzf/bin

# Zellij doesn't respond to fish's DA1 terminal query, causing a 2s startup pause.
# Disable the query-terminal feature flag when running inside Zellij.
if set -q ZELLIJ
    contains -- -query-terminal $fish_features; or set -U fish_features $fish_features -query-terminal
else
    set -U fish_features (string match -v -- -query-terminal $fish_features)
end

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

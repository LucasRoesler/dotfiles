set -gxp PATH $HOME/.local/bin
set -gx EDITOR nvim

set -g cyan (set_color -o cyan)
set -g yellow (set_color -o yellow)
set -g red (set_color -o red)
set -g blue (set_color -o blue)
set -g green (set_color -o green)
set -g normal (set_color normal)

# don't show any greetings
set fish_greeting ""

# # don't describe the command for darwin
# # https://github.com/fish-shell/fish-shell/issues/6270
# function __fish_describe_command
# end

# Senstive functions which are not pushed to Github
# It contains work related stuff, some functions, aliases etc...
function load_config
    if test -f "$HOME/.config/lucas/$argv"
        source $HOME/.config/lucas/$argv
    end
end

# load_config "functions.zsh"
load_config "contiamo.env"
load_config "secrets.sh"

set -gx DOCKER_BUILDKIT 1
set -gx BUILDKIT_PROGRESS plain
set -gx MOZ_ENABLE_WAYLAND 1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# content copied to conf.d/conda.fish
# eval /home/lucas/.miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
#


status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source


set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state
set -gx NVM_DIR $XDG_CONFIG_HOME/nvm

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

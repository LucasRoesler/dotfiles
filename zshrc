zmodload zsh/zprof

autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
    compinit
done

compinit -C

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
source $HOME/.profile


# >>>> antibody
source $HOME/.zsh_plugins.sh
# <<<< antibody

# >>>> oh-my-zsh
# Path to your oh-my-zsh installation.
#export ZSH="/home/lucas/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
#plugins=(git fzf git-extras golang wd)

# Faster vi-mode mode switching
export KEYTIMEOUT=1
export VI_MODE_SET_CURSOR=true

#source $ZSH/oh-my-zsh.sh
# <<<< oh-my-zsh


# User configuration

function load_config() {
  if [[ -f "$HOME/.config/lucas/$1" ]]; then
	  source "$HOME/.config/lucas/$1"
  fi
}

load_config "aliases.zsh"
load_config "functions.zsh"
load_config "contiamo.env"
load_config "multipass.zsh"
load_config "python.zsh"
load_config "xps.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lucas/conda miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lucas/conda miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lucas/conda miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lucas/conda miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

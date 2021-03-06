autoload -U +X bashcompinit && bashcompinit
export LANG=en

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

export GPG_TTY=$(tty)
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="lucas"
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras python pip brew wd docker docker-compose)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#
if [ -e $HOME/.config/lucas/private-exports.sh ]
then
	source $HOME/.config/lucas/private-exports.sh
fi

if [ -e $HOME/.config/lucas/aliases.sh ]
then
	source $HOME/.config/lucas/aliases.sh
fi

if [ -e $HOME/.config/lucas/functions.sh ]
then
    source $HOME/.config/lucas/functions.sh
fi

if [ -e $HOME/.config/lucas/mac.sh ]
then
    source $HOME/.config/lucas/mac.sh
fi

export DOCKER_BUILDKIT=1

# Homebrew
export HOMEBREW_GITHUB_API_TOKEN=433dbae9bdcb46a3682d395c9fc80b7aac9cb183

if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi


export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.bin:$PATH

# Miniconda install
export PATH="$PATH:$HOME/miniconda3/bin"

# Golang install
export GO111MODULE=on
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/lucasroesler/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/lucasroesler/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/lucasroesler/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/lucasroesler/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lucasroesler/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/lucasroesler/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/lucasroesler/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/lucasroesler/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

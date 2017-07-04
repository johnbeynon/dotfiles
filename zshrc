# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="honukai"

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
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

# Uncomment following line if you want to the command execution time stamp shown
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git web-search rails)

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/zsh/aliases

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/X11/bin:$PATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(nodenv init -)"

w() { cd ~/nobackup/Google\ Drive/workspace/$1; }
_w() { _files -W ~/nobackup/Google\ Drive/workspace -/; }
compdef _w w

hw() { cd ~/workspace/$1; }
_hw() { _files -W ~/workspace -/; }
compdef _hw hw

#export DOCKER_TLS_VERIFY="1"
#export DOCKER_HOST="tcp://192.168.99.100:2376"
#export DOCKER_CERT_PATH="/Users/jbeynon/.docker/machine/machines/default"
#export DOCKER_MACHINE_NAME="default"

# Run this command to configure your shell:
# # eval $(docker-machine env default)

function curlsupp() {
  curlapi https://support-api.heroku.com/$1
}

function curlstaging() {
  curlapi https://support-api-staging.herokuapp.com/$1
}

function r53lookup() {
  curl r53lookup.herokuapp.com/lookup\?name=$1
}

hevents() {
  app="$1"; days="$2"; heroku sudo events:app -a $app --from $(ruby -rDate -e "puts Date.today - ${days:-30}");
}
fpath=( /Users/jbeynon/.local/share/heroku/client/node_modules/cli-engine/autocomplete/zsh $fpath ); autoload -Uz compinit; compinit;

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jbeynon"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bundler brew gem jbeynon)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

# Customize to your needs..
export PATH="/usr/local/bin:$PATH"
#export PATH=/Users/john/.rvm/gems/ruby-1.9.3-p194/bin:/Users/john/.rvm/gems/ruby-1.9.3-p194@global/bin:/Users/john/.rvm/rubies/ruby-1.9.3-p194/bin:/Users/john/.rvm/bin:/usr/local/bin:/usr/local/share/npm/bin:/opt/local/lib/postgresql83/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# Add the following to your ~/.bashrc or ~/.zshrc
hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export CC=/usr/local/bin/gcc-4.2
export CPPFLAGS=-I/opt/X11/include

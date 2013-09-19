export EDITOR='vim'

export PATH="/usr/local/bin:$PATH"

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Colors
autoload -U colors
colors

setopt prompt_subst

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

setopt inc_append_history
setopt share_history

# Autocompletes for w and k
w() { cd ~/code/$1; }
_w() { _files -W ~/Google\ Drive/workspace -/; }
compdef _w w

k() { cd ~/workspace/kyan/$1; }
_k() { _files -W ~/workspace/kyan -/; }
compdef _k k

# Show completion on first TAB
setopt menucomplete

GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}" # outputs [ in green
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}" # outputs ] in green

parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# If inside a Git repository, print its branch and state
git_prompt_string() {
local git_where="$(parse_git_branch)"
[ -n "$git_where" ] && echo "$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
}

PROMPT='%~$(git_prompt_string) $ '

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

# Source stuff
source ~/.bin/tmuxinator.zsh
source ~/.bin/git-flow-completion.zsh
source ~/code/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/code/dotfiles/aliases
source ~/code/dotfiles/heroku

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

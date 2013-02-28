w() { cd ~/Google\ Drive/workspace/$1; }
_w() { _files -W ~/Google\ Drive/workspace -/; }
compdef _w w

k() { cd ~/workspace/kyan/$1; }
_k() { _files -W ~/workspace/kyan -/; }
compdef _k k

h() { cd ~/$1; }
_h() { _files -W ~/ -/; }
compdef _h h

export EDITOR='vim'

# project shortcuts
my='/Users/john/Google Drive/workspace/modelyachting'

# autocorrect is more annoying than helpful
# unsetopt correct_all
#
# # a few aliases I like
alias gs='git status'
alias gg='git grep --break --heading --line-number'

# Service starts
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias mysqlstart='mysql.server start'
alias mysqlstop='mysql.server stop'
alias redis='redis-server /usr/local/etc/redis.conf'
alias memcache='/usr/local/bin/memcached'
alias mongodb='mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf'
alias cov='open coverage/index.html'
alias elasticstart='elasticsearch -f -D es.config=/usr/local/Cellar/elasticsearch/0.19.4/config/elasticsearch.yml'
alias mongostart='launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist'
alias mongostop='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist'

# Rails stuff
alias rs='rails s'
alias rc='rails c'
alias rsd='rails s -u'
alias rg='rails generate'
alias dbm='rake db:migrate'
alias dbmc='rake db:migrate db:test:clone'
alias dbrst='rake db:reset'
alias rst='touch tmp/restart.txt'
alias tlog='tail -f log/development.log'

# Legacy rails
alias ss='script/server'
alias sc='script/console'
alias ssd='script/server -u'


#
# # add plugin's bin directory to path
# export PATH="$(dirname $0)/bin:$PATH"

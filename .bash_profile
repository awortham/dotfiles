export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

alias cdb="cd ~/Documents/ballantine_communications"
alias cdp="cd ~/Documents/personal"
alias gc="git commit -m "
alias gca="git commit -am "
alias gPo="git push origin "
alias gpo="git pull origin "
alias rr="rake routes"
alias fixdb="rake db:drop db:create db:migrate db:seed"
alias kts='tmux ls | awk '\''{print $1}'\'' | sed '\''s/://g'\'' | xargs -I{} tmux kill-session -t {}'
alias pow='launchctl stop cs.pow.powd'
alias reload_bash="source ~/.bash_profile"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}
### Added by the Heroku Toolbelt

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


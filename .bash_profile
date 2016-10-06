export CLICOLOR=1 export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=/usr/bin/vim

alias cdb="cd ~/Documents/ballantine_communications"
alias cdp="cd ~/Documents/personal" alias gc="git commit -m "
alias gca="git commit -am "
alias gPo="git push origin "
alias gpo="git pull origin "
alias rr="rake routes"
alias fixdb="rake db:drop db:create db:migrate db:seed"
alias kts='tmux ls | awk '\''{print $1}'\'' | sed '\''s/://g'\'' | xargs -I{} tmux kill-session -t {}'
alias pow='launchctl stop cs.pow.powd'
alias csd="cap staging deploy"
alias cpd="cap production deploy"
alias obash="vim ~/.bash_profile"
alias rebash="source ~/.bash_profile"
alias rn-ios="react-native run-ios"

### hub bash completion
if [ -f hub.bash_completion.sh ]; then
  . hub.bash_completion.sh
fi

eval "$(hub alias -s)"

### bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

### function for using g as git and if just g then it calls git status
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

### function opens new tab in same directory. if this functionality starts working again in iterm, then i will no longer need this
function t() {
  open . -a iterm
}

### function to display git branch in standard readout
source ~/.git-prompt.sh
export PS1="Macbook Pro:\u \e[0;31m\W\e[m\e[0;32m\$(__git_ps1)\[\033[00m\] $\e[m "

# open git directory on github
function gg() {
  URL=$(cat .git/config | grep github | sed -E 's/^.*(github\.com):(.*)(\.git)?/http:\/\/\1\/\2/')
  open $URL
}

### Added by the Heroku Toolbelt
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### shell integration for iterm
source ~/.iterm2_shell_integration.`basename $SHELL`

### Labels your current bash tab
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='iterm2_preexec_invoke_cmd'
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ';iterm2_preexec_invoke_cmd
fi


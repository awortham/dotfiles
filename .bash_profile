export CLICOLOR=1 export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=/usr/bin/vim

### aliases
alias cdp="cd ~/Documents/personal"
alias code="cd ~/Code"
alias cop="rubocop"
alias cp="cp -v"
alias dotfiles="cd ~/dotfiles"
alias fixdb="rake db:drop db:create db:migrate db:seed"
alias gPo="git push origin "
alias gc="git commit -m "
alias gca="git commit -am "
alias gpo="git pull origin "
alias hosts="sudo vim /etc/hosts"
alias kts='tmux ls | awk '\''{print $1}'\'' | sed '\''s/://g'\'' | xargs -I{} tmux kill-session -t {}'
alias mv="mv -v"
alias obash="vim ~/.bash_profile"
alias overview="open 'https://github.com/awortham?tab=overview&from="$(date '+%Y-%m-%d')"'"
alias ovim="vim ~/.vimrc"
alias pd="pco deploy"
alias pdp="pco deploy production"
alias rc="rails c"
alias rebash="source ~/.bash_profile && echo 'Your bash profile has been reloaded'"
alias rjs="RAILS_ENV=journal_des rails s -p 3001 -P 42342"
alias rm="rm -v"
alias rn-ios="react-native run-ios"
alias rps="RAILS_ENV=prt_des rails s -p 3002 -P 42344"
alias rr="rake routes"
alias rs="rails s"

symlink() {
  ln -sv dotfiles/$1 $1
}

### rundeck
export RUNDECK_BROWSERIFY="true"
export RUNDECK_API_TOKEN="5cvZeJ2UXxwq2cXUNWVsfR41fNJeO6X4"

### bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

__git_complete g _git
__git_complete gPo _git_checkout
__git_complete gpo _git_checkout

### function for using g as git and if just g then it calls git status
g() {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

function prompt_rbenv {
  rbv=eval rbenv version | sed -e 's/ .*//'
  echo $rbv
}

### function to display git branch in standard readout
source ~/.git-prompt.sh
export PS1="\u: \e[0;34m\$(prompt_rbenv) \e[0;31m\W\e[m\e[0;32m\$(__git_ps1)\[\033[00m\] $\e[m "

### open git directory on github
function gg() {
  URL=$(cat .git/config | grep github | sed -E 's/^.*(github\.com):(.*)(\.git)?/http:\/\/\1\/\2/')
  open $URL
}

### list all pull requests that your company has across all repos
function lpr() {
  # USER=$(cat .git/config | grep github | sed -E 's/^.*(github\.com):(.*)\/(.*)\.git?/\2/')
 # echo $USER
  # open "https://github.com/pulls?utf8=%E2%9C%93&q=is%3Aopen+is%3Apr+user%3A$USER"
  open "https://github.com/ministrycentered/registrations/pulls"
  # echo "https://$USER/pulls"
}

### create a pull request for your current branch
function pr(){
 USER=$(cat .git/config | grep github | sed -E 's/^.*(github\.com):(.*)\/(.*)\.git?/\2/')
 REPO=$(cat .git/config | grep github | sed -E 's/^.*(github\.com):(.*)\/(.*)\.git?/\3/')
 BRANCH=$(__git_ps1 | tr -d '()' | tr -d '[:space:]' | set -E '*/\/')
 echo $USER
 echo $REPO
 echo $BRANCH
 # open "https://github.com/ministrycentered/registrations/awortham/$BRANCH?expand=1"
 # open "https://github.com/ministrycentered/$REPO/compare/$BRANCH?expand=1"
}

### This allows you to fire up a Rails server and then connect via your phone.
### You must be on the same wifi as the computer is on.
function rsb() {
 IP=$(ifconfig | grep -Eo "inet (addr:)?([0-9]*\.){3}[0-9]*" | grep -Eo "([0-9]*\.){3}[0-9]*" | grep -v "127.0.0.1" | grep -m1 "")
 rails s -b $IP
}

### Added by the Heroku Toolbelt
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

### shell integration for iterm
source ~/.iterm2_shell_integration.`basename $SHELL`

### Labels your current bash tab
if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ';iterm2_preexec_invoke_cmd
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

eval "$(~/Code/pco/bin/pco init -)"

ssh-add ~/.ssh/pco_servers

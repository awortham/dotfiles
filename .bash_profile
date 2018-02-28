export CLICOLOR=1 export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=/usr/bin/vim

### aliases
alias cdb="cd ~/Code"
alias cdp="cd ~/Documents/personal"
alias code="cd ~/Code"
alias cdpeeps="cd ~/Code/people"
alias cdquix="cd ~/Documents/personal/personal/quiX-schedule/"
alias cop="rubocop"
alias cp="cp -v"
alias dotfiles="cd ~/dotfiles"
alias odots="vim ~/dotfiles"
alias fixdb="rake db:drop db:create db:migrate db:seed"
alias fore="foreman start -f Procfile.dev"
alias gPo="git push origin "
alias gc="git commit -m "
alias gca="git commit -am "
alias gpo="git pull origin "
alias hosts="sudo vim /etc/hosts"
alias mv="mv -v"
alias obash="vim ~/.bash_profile"
alias ogit="vim ~/.gitconfig"
alias omux="vim ~/.tmux.conf"
alias overview="open 'https://github.com/awortham?tab=overview&from="$(date '+%Y-%m-%d')"'"
alias ovim="vim ~/.vimrc"
alias pc="pco console"
alias pd="pco deploy"
alias pdp="pco deploy production"
alias pd="pco deploy"
alias pdp="pco deploy production"
alias rc="rails c"
alias rebash="source ~/.bash_profile && echo 'Your bash profile has been reloaded'"
alias rm="rm -v"
alias rn-ios="react-native run-ios"
alias rr="bundle exec rake routes"
alias rs="rails s"
alias rserver="box restart-app"
alias server="tail -f log/development.log"
alias setup="~/pco-development"
alias quix="~/quix-scheduler"

#tmux aliases
alias kts='tmux ls | awk '\''{print $1}'\'' | sed '\''s/://g'\'' | xargs -I{} tmux kill-session -t {}'
alias muxl='tmux list-sessions'
alias remux="source ~/.tmux.conf && echo 'Your tmux config has been reloaded'"

# I don't think I need this anymore. It was throwing an error when I loaded a new bash window and the
# g pr command still works without it. So I'm really not sure what this was doing anyway.
# eval "$(hub alias -s)"

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

# bake() {
#   if [[ $# > 0 ]]; then
#     bundle exec rake $@
#   else
#     bundle exec rake
#   fi
# }

muxa() {
  if [[ $# > 0 ]]; then
    tmux attach -t $@
  else
    echo "You must pass in which tmux session to attach to"
  fi
}

function prompt_rbenv {
  rbv=eval rbenv version | sed -e 's/ .*//'
  echo $rbv
}

### function to display git branch in standard readout
source ~/.git-prompt.sh
export PS1="\e[0;34m\$(prompt_rbenv) \e[0;31m\W\e[m\e[0;32m\$(__git_ps1)\[\033[00m\] $\e[m "

### open git directory on github
function gg() {
  URL=$(cat .git/config | grep github | sed -E 's/^.*(github\.com):(.*)(\.git)?/http:\/\/\1\/\2/')
  open $URL
}

### list pull requests by repo
function lppr() {
  # USER=$(cat .git/config | grep github | sed -E 's/^.*(github\.com):(.*)\/(.*)\.git?/\2/')
  # open "https://github.com/pulls?utf8=%E2%9C%93&q=is%3Aopen+is%3Apr+user%3A$USER"
  open "https://github.com/ministrycentered/people/pulls/awortham"
}

function lrpr() {
  open "https://github.com/ministrycentered/registrations/pulls/awortham"
}

function lapr {
  open "https://github.com/ministrycentered/accounts/pulls/awortham"
}

### list all my branches on people
function lpb() {
  open "https://github.com/ministrycentered/people/branches/yours"
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
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ';
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

eval "$(~/Code/pco/bin/pco init -)"

### Add yarn modules to the global path
export PATH="$PATH:$(yarn global bin)"
export PATH="$PATH:$(npm bin)"
export PATH="./node_modules/.bin:$PATH"

name() {
  branch=$(git rev-parse --abbrev-ref HEAD)
  echo $branch

  if [ $branch != "master" ] && [ $branch != "staging" ]; then
    if [[ $branch == *"awortham"* ]]; then
      echo "branch is not master or staging and has awortham in name"
    else
      echo "not master or staging, and does not have awortham in name"
      echo "awortham/${branch}"
    fi
  else
    echo "branch"
  fi

  # if [ $branch == *"awortham"* ] && [ $branch != "master" ] && [ $branch != "staging" ]; then
  #   echo "branch includes name and is not master or staging"
  # else
  #   echo "branch does not include name"
  # fi
}

ssh-add ~/.ssh/pco_servers
export RBENV_ROOT=$HOME/.rbenv
export MYSQL_PORT_3306_TCP_ADDR=127.0.0.1
export MYSQL_SLAVE_PORT_3306_TCP_ADDR=127.0.0.1
export MYSQL_SLAVE_PORT_3306_TCP_PORT=3307
export PATH=/Users/aaronwortham/pco-box/bin:/usr/local/bin:$PATH
eval "$(rbenv init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS='
  -i
  --color=info:#303030
'
# This was an attempt to make fzf use the silver searcher so that it used the gitignore. However, in my vim setup,
# I don't know how to make it use the standard fzf command. I either have :Files or :Gfiles.
# export FZF_DEFAULT_COMMAND='ag --nogroup --nocolor --column'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


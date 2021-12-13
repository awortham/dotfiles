export CLICOLOR=1 export LSCOLORS=GxFxCxDxBxegedabagaced
export EDITOR=nvim

### aliases
alias barn="bundle && yarn install --check-files"
alias cdp="cd ~/Documents/personal"
alias cdquix="cd ~/Documents/personal/personal/quiX-schedule/"
alias cop="rubocop"
alias cp="cp -v"
alias gdbranches="git branch | grep -v 'master' | grep -v 'staging' | xargs git branch -D "
alias dotfiles="cd ~/dotfiles"
alias odots="vim ~/dotfiles"
alias fixdb="rake db:drop db:create db:migrate db:seed"
alias fore="foreman start -f Procfile.dev"
alias git-delete-merged-branches='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; git remote prune origin; git fetch -p; done'
alias gPo="git push origin "
alias gc="git commit -m "
alias gca="git commit -am "
alias gpo="git pull origin "
alias hosts="sudo vim /etc/hosts"
alias vim="nvim"
alias mv="mv -v"
alias obash="vim ~/.bash_profile"
alias ogit="vim ~/.gitconfig"
alias okit="vim ~/.config/kitty/kitty.conf"
alias omux="vim ~/.tmux.conf"
alias opry="vim ~/.pryrc"
alias overview="open 'https://github.com/awortham?tab=overview&from="$(date '+%Y-%m-%d')"'"
alias ovim="vim ~/.config/nvim/init.vim"
alias ozsh="vim ~/.zshrc"
alias rc="rails c"
alias rebash="source ~/.bash_profile && echo 'Your bash profile has been reloaded'"
alias rm="rm -v"
alias rn-ios="react-native run-ios"
alias rr="bundle exec rake routes"
alias rs="rails s"
alias server="tail -f log/development.log"
alias usezsh="chsh -s /bin/zsh"
alias usebash="chsh -s /bin/bash"
alias shell="echo $SHELL"
alias quix="~/quix-scheduler"

#tmux aliases
alias kts='tmux ls | awk '\''{print $1}'\'' | sed '\''s/://g'\'' | xargs -I{} tmux kill-session -t {}'
alias muxl='tmux list-sessions'
alias remux="tmux source-file ~/.tmux.conf && echo 'Your tmux config has been reloaded'"

#tmux attach alias/function
muxa() {
  if [[ $# > 0 ]]; then
    tmux attach -t $@
  else
    echo "You must pass in which tmux session to attach to"
  fi
}

symlinkDotfiles() {
  ln -sv dotfiles/$1 $1
}

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

build() {
  if [[ -z "$(git diff --shortstat 2> /dev/null)" ]]; then
    CURRENT_BRANCH=`git rev-parse --abbrev-ref HEAD`
    CURRENT_PATH=`git rev-parse --show-toplevel`
    REPO_NAME=`basename $CURRENT_PATH`
    echo "Building & deploying '$CURRENT_BRANCH'..."
    git push && \
    git checkout staging && \
    git fetch origin && \
    git reset --hard origin/staging && \
    git merge --no-edit - && \
    git push
    if [[ "$(git branch | grep \*)" == "* staging" ]] ; then
      git checkout -
    fi
    # open "https://github.com/ministrycentered/$REPO_NAME/compare/$CURRENT_BRANCH?expand=1"
  else
    echo "Index is dirty."
  fi
}

bake() {
  if [[ $# > 0 ]]; then
    bundle exec rake $@
  else
    bundle exec rake
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

### list all pull requests regradless of repo
function lpr() {
  open "https://github.com/pulls"
}

### list pull requests by repo
function lcpr() {
  # USER=$(cat .git/config | grep github | sed -E 's/^.*(github\.com):(.*)\/(.*)\.git?/\2/')
  # open "https://github.com/pulls?utf8=%E2%9C%93&q=is%3Aopen+is%3Apr+user%3A$USER"
  open "https://github.com/detaso/connect/pulls/awortham"
}

function lwpr() {
  open "https://github.com/detaso/web/pulls/awortham"
}

### list all my branches by repo
function lcb() {
  open "https://github.com/detaso/connect/branches/yours"
}

function ocov() {
  open "file:///Users/aaronwortham/detaso/web/coverage/index.html#_AllFiles"
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
}

list_colors() {
  for i in {0..255}; do
    printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
  done
}

export RBENV_ROOT=$HOME/.rbenv
export MYSQL_PORT_3306_TCP_ADDR=127.0.0.1
export MYSQL_SLAVE_PORT_3306_TCP_ADDR=127.0.0.1
export MYSQL_SLAVE_PORT_3306_TCP_PORT=3307
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
export BAT_THEME="Tomorrow-Night"

export PATH="/usr/local/sbin:$PATH"

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

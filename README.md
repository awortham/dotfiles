# dotfiles

Side Note: 
When setting up bash-completion with brew. The instructions are very straight forward unless you are using a g() function
combined with git aliases. Then you must manually add a line to the /usr/local/etc/bash_completion.d/git-completion.bash file:

Taken from: http://stackoverflow.com/questions/342969/how-do-i-get-bash-completion-to-work-with-aliases


I have aliased g='git', and combined with my git aliases I type things like

$ g co <branchname>
The simpler fix for my specific use case was to add a single line to git-completion.

Right below this line:

__git_complete git _git
I added this line to handle my single 'g' alias:

__git_complete g _git

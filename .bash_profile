set -o vi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

update_terminal_cwd

function gitbash() {
  export PS1='\u@\h:\w$(__git_ps1 " (%s)") \$ '
}

function nogitbash() {
  export PS1='\u@\h:\w \$ '
}
gitbash

export CLICOLOR=1
export EDITOR=vi

#INFINITE APPENDING HISTORY
export HISTSIZE="INFINITE"
shopt -s histappend
PROMPT_COMMAND="history -a;$(echo $PROMPT_COMMAND | sed 's/update_terminal_cwd//')"

source ~/.profile

set -o vi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

update_terminal_cwd

if [ -f /usr/local/etc/bash_completion ]; then
  source /usr/local/etc/bash_completion
  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='[\u@mbp \w$(__git_ps1)]\$ '
fi


export CLICOLOR=1
export EDITOR=vi

#INFINITE APPENDING HISTORY
export HISTSIZE="INFINITE"
shopt -s histappend
PROMPT_COMMAND="history -a;$(echo $PROMPT_COMMAND | sed 's/update_terminal_cwd//')"

if [ -f ~/.profile ]; then
  source ~/.profile
fi

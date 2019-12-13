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
# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
shopt -s histappend
PROMPT_COMMAND="history -a;$(echo $PROMPT_COMMAND | sed 's/update_terminal_cwd//')"

if [ -f ~/.profile ]; then
  source ~/.profile
fi



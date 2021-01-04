set -o vi
export CLICOLOR=1
export EDITOR=vi

# PREVENT ACCIDENTAL LOGOUTS
function exit() { for i in [1 2 3]; do echo "Ah ah ah! You didn't say the magic word!"; sleep 2; done;}
export IGNOREEOF=42

# BASH COMPLETION
update_terminal_cwd

if [[ -f "/usr/local/etc/profile.d/bash_completion.sh" ]]; then
  . "/usr/local/etc/profile.d/bash_completion.sh"
  GIT_PS1_SHOWDIRTYSTATE=true
  export PS1='[\u@\h \w$(__git_ps1)]\$ '
fi



#INFINITE APPENDING HISTORY
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTCONTROL=erasedups
export HISTFILE=~/.bash_eternal_history
shopt -s histappend
PROMPT_COMMAND="history -a;$(echo $PROMPT_COMMAND | sed 's/update_terminal_cwd//')"

# allow go get to get from git
export GIT_TERMINAL_PROMPT=1

if [ -f ~/.profile ]; then
  source ~/.profile
fi

### PYTHON
eval "$(pyenv init -)"



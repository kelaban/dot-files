[[ -s $HOME/.git-prompt.sh ]] && source ~/.git-prompt.sh


RESET="\e[0m"
GREEN="\e[32m"
RED="\e[31m"
BLUE="\e[34m"
MAGENTA="\e[35m"
ORANGE="\e[30m"
BG_ORANGE="\e[35m"
CYAN="\e[36m"
YELLOW="\e[33m"
WHITE="\e[97m"
LIGHT_GREY="\e[37m"
BASE1="\e[38;5;245m"

function _update_ps1() {
  #PS1=$(powerline-shell $?)
  rc=$?
  [ $rc -eq 0 ] && rccolor=${GREEN} || rccolor=${RED}
  pipe="${RESET}|"
  PS1="\n"
  PS1+="${RESET}${BLUE}\t \d" #date and time
  PS1+="${RESET} [${MAGENTA}\j" #number of jobs
  PS1+="${RESET}${pipe}${LIGHT_GREY}\u${pipe}${YELLOW}\h${RESET}]" #{user} @ {host}
  PS1+="${RESET}${BASE1} \w" #working directory
  PS1+="${RESET}${GREEN}$(__git_ps1)" #git branch
  PS1+="${RESET}\n${rccolor}$([ $rc -eq 0 ] && echo '✔\$' || echo '✘\$')"
  PS1+="${RESET} " #reset and command line
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
  PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#export PS1=${PS1}

export LSCOLORS=gxfxcxdxbxegedabagacad
#export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

alias ls='ls -F --color=always'
alias ll='ls -l'
alias lla='ls -lfa'
alias less='less -R' # Less with colors
alias lless='ls -la | less'
alias cls='clear; ls'
alias vi='vim'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias sftpdev='sftp  -P 2222 klaban1@10.122.132.165'
alias j='jobs'

#verify history commands when using !(),!!, !? commands
shopt -s histverify

set -o vi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[[ -s $HOME/.bashrc.local ]] && source $HOME/.bashrc.local

[[ -s $HOME/.dir_colors ]] && eval `dircolors ~/.dir_colors`

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.kube/completion.bash.inc" ]] && source "$HOME/.kube/completion.bash.inc"

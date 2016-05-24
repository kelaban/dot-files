source ~/.git-prompt.sh

PS1="\n"
PS1+="\[\033[1;3\$(if [ $? -eq 0 ]; then echo '2'; else echo '1'; fi)m\]*" #red or green star for last output
PS1+="\[\033[m\] \[\033[36m\]\t \d" #date and time
PS1+="\[\033[m\] [\[\033[35m\]\j" #number of jobs
PS1+="\[\033[m\]\[\033[38;5;208m\]|\[\033[m\]\u\[\033[38;5;208m\]|\[\033[33m\]\h" #{user} @ {host}
PS1+="\[\033[m\]] \[\033[1;34m\]\w" #working directory
PS1+="\[\033[m\]\[\033[32m\]\$(__git_ps1)" #git branch
PS1+="\[\033[m\] \[\033[32m\]\n$"
PS1+="\[\033[m\] " #reset and command line
export PS1=${PS1}

export LSCOLORS=gxfxcxdxbxegedabagacad
export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

alias ls='ls -F --color=always'
alias ll='ls -l'
alias lla='ls -lfa'
alias less='less -R' # Less with colors
alias lless='ls -la | less'
alias cls='clear; ls'
alias vi='vim'
alias grep='grep --colour=always'
alias egrep='egrep --colour=always'
alias sftpdev='sftp  -P 2222 klaban1@10.122.132.165'
alias j='jobs'
alias ip='ifconfig | grep inet | grep -v inet6 | grep -v 127.0.0.1 | cut -d " " -f 2'
alias h='history'

#verify history commands when using !(),!!, !? commands
shopt -s histverify

set -o emacs

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

[[ -s $HOME/.bashrc.local ]] && source $HOME/.bashrc.local

[[ -s $HOME/.dir_colors ]] && eval `dircolors ~/.dir_colors`

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


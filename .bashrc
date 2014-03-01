# http://www.ibm.com/developerworks/library/l-tip-prompt/
PS1='\n\[\e[32;1m\]\u\e[0m -> \[\e[31;1m\]\w\e[0m\n\$ '

alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias ls='ls -F'
alias cls='clear;ls'
alias j='jobs'
alias grep='grep --colour'
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export PATH=/bin:/usr/sbin:/sbin:/usr/bin:/usr/X11/bin:/usr/local/bin:/usr/local/share/npm/bin/

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

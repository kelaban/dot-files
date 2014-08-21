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

. ~/.bash_colors
PS1="${Green}*"
PS1+=" ${Cyan}\t \d ${White}[${Green}\j${White}|${Purple}\u${White}|${Green}\h${White}]"
PS1+=" ${Color_Off}\w"
PS1+="\n${Yellow}$ ${Color_Off}"

export PS1=$PS1

[[ -s $HOME/.bashrc.local ]] && source $HOME/.bashrc.local

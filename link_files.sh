#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function answer_is_true {
    read -p "$1 [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        return 1
    else
        return 0
    fi
}

link () {
  fname=$1
  new_name=${2:-$fname}
  new_file=$DIR/$fname
  home_file=~/.$new_name

  if [ -e $home_file ]; then
    if answer_is_true "$home_file is already installed, backup and link $new_file now?"; then
      mv $home_file "${home_file}.bak"
      ln -s $new_file $home_file
    fi
  else
    ln -s $new_file $home_file
  fi
}


link vimrc
link vim
link dircolors-solarized/dircolors.256dark dir_colors
link bashrc
link bash_profile
link ackrc
link tmux
link tmux.conf

link git-completion.bash
link git-prompt.sh

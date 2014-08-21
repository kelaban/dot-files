#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

link () {
  fname=$1
  ln -s $DIR/$fname ~/.$fname
}

link vimrc
link vim
link bashrc
link bash_profile
link ackrc

link git-completion.bash
link git-prompt.sh

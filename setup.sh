#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function ask_user_to_continue {
    read -p "$1 [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
}


function answer_is_true {
    read -p "$1 [y/N] " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        return 1
    else
        return 0
    fi
}


function cannot_find {
    if type -P $1 >/dev/null 2>&1; then
        echo "checking if $1 installed... OK!"
        return 1
    else
        echo "checking if $1 installed..."
        return 0
    fi
}


if answer_is_true "initialize git submodules?"; then
  git submodule init
fi


if answer_is_true "update git submodules now?"; then
  git submodule update
else
  echo "to update later run: git submodule update"
fi


if cannot_find ruby; then
  echo "ruby must be installed to continue, this is fucked"
  exit 1
fi




if cannot_find brew; then
  if answer_is_true "brew was not found in any of your PATH ($PATH), is it already installed?"; then
    echo "update PATH and try again";
    exit 1;
  else
    ask_user_to_continue "would you like to install it now?"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    ask_user_to_continue "did all of the brew install instructions complete properly?"
  fi
fi




if cannot_find python; then
  if answer_is_true "install python now?"; then
    brew install python
  fi
fi




if cannot_find ack; then
  if answer_is_true "install ack now?"; then
    brew install ack
  fi
fi



if answer_is_true "would you like to link the dot files of this repo?"; then
  bash $DIR/link_files.sh
fi


echo "DONE!"

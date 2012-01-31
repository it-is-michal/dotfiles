#!/bin/bash

base="$(echo $PWD | sed -e's#'$HOME/'##' -e's#$#/#')"
cd
ln -s --backup --suffix=.backup $base.bashrc .bashrc
ln -s --backup --suffix=.backup $base.vimrc .vimrc
ln -s --backup --suffix=.backup $base.vim .vim
ln -s --backup --suffix=.backup $base.gitconfig .gitconfig


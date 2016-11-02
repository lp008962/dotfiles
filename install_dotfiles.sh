#!/bin/bash
path=$HOME/dotfiles
dotfiles=('.vimrc' '.zshrc' '.tmux.conf')

chdir /tmp
wget https://github.com/lp008962/dotfiles/archive/master.tar.gz
tar zxvf master.tar.gz
mv dotfiles-master $path

for f in ${dotfiles[@]}; do
  ln -s $path/$f $HOME/$f
done

git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/Vundle.vim



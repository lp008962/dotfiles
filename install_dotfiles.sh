#!/bin/bash
sudo yum install -y wget curl git tmux zsh source-highlight perl cpanm
chsh

path=$HOME/dotfiles
dotfiles=('.vimrc' '.zshrc' '.tmux.conf')

#### Using wget if git cannot install
#chdir /tmp
#wget https://github.com/lp008962/dotfiles/archive/master.tar.gz
#tar zxvf master.tar.gz
#mv dotfiles-master $path

cd $path
git clone https://github.com/lp008962/dotfiles

for f in ${dotfiles[@]}; do
  ln -s $path/$f $HOME/$f
done


### Installing vim-Vundle
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/Vundle.vim


### Instaling peco
cd /tmp
URL='https://github.com/peco/peco/releases'
PECO='peco_linux_amd64'
VER=`curl -sI ${URL}/latest | awk -F'/' '/^Location:/{print $NF}' | tr -d ""`
wget - ${URL}/download/${VER}/${PECO}.tar.gz
tar -zxf $PECO.tar.gz

if [ -e $HOME/bin ]; then
    cp $PECO/peco $HOME/bin/
else
    mkdir $HOME/bin
    cp $PECO/peco $HOME/bin/
fi

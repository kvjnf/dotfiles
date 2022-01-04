#!/bin/sh
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git \
        ~/.vim/dein/repos/github.com/Shougo/dein.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/vim/ftplugin ~/.vim
ln -sf ~/dotfiles/vim/filetype.vim ~/.vim/filetype.vim
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/ssh-change-profile.sh ~/ssh-change-profile.sh

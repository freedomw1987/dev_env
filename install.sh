#!/bin/bash

brew install fzf bat ripgrep the_silver_searcher perl universal-ctags tmux vim git
sudo npm install -g lessc swagger-ui-watcher

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p ~/.vim/pack/vendor/start

# Install Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Color-theme
git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8

ln -s ./.vimrc ~/.vimrc

ln -s ./coc-settings.json ~/.vim/coc-settings.json

ln -s ./.tmux.conf ~/.tmux.conf

tmux source ~/.tmux.conf

exit 0

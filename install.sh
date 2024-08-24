#!/bin/bash

brew install fzf bat ripgrep the_silver_searcher perl universal-ctags
npm install -g lessc swagger-ui-watcher

mkdir -p ~/.vim/pack/vendor/start

# Install Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Color-theme
git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8

ln -s ./.vimrc ~/.vimrc

ln -s ./coc-settings.json ~/.vim/coc-settings.json


exit 0

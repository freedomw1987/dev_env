#!/bin/bash

brew install fzf bat ripgrep the_silver_searcher perl universal-ctags tmux vim git koekeishiya/formulae/yabai koekeishiya/formulae/skhd
sudo npm install -g lessc swagger-ui-watcher

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p ~/.vim/pack/vendor/start

# Install Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Color-theme
git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8

ln -s `pwd`/.vimrc ~/.vimrc

ln -s `pwd`/coc-settings.json ~/.vim/coc-settings.json

ln -s `pwd`/.tmux.conf ~/.tmux.conf

ln -s `pwd`/yabai/yabairc ~/.yabairc

ln -s `pwd`/skhd/skhdrc ~/.skhdrc

tmux source ~/.tmux.conf

exit 0

#!/bin/bash

brew install fzf bat ripgrep the_silver_searcher perl universal-ctags tmux vim neovim git koekeishiya/formulae/yabai koekeishiya/formulae/skhd
brew install clang-format js-beautify shfmt yamlfmt stylelint prettier htmlq
sudo npm install -g lessc swagger-ui-watcher @olrtg/emmet-language-server

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir -p ~/.vim/pack/vendor/start

# Install Vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle &&
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install vim-sensible
cd ~/.vim/bundle &&
  git clone https://github.com/tpope/vim-sensible.git

# Install vim-syntastic
cd ~/.vim/bundle &&
  git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

# Install Color-theme
git clone https://github.com/lifepillar/vim-solarized8.git ~/.vim/pack/themes/opt/solarized8

ln -s $(pwd)/.vimrc ~/.vimrc

ln -s $(pwd)/coc-settings.json ~/.vim/coc-settings.json

ln -s $(pwd)/.tmux.conf ~/.tmux.conf

ln -s $(pwd)/yabai/yabairc ~/.yabairc

ln -s $(pwd)/skhd/skhdrc ~/.skhdrc

if [ ! -f ~/.config]; then
  mkdir -p ~/.config
  ln -s ~/.vim ~/.config/nvim
fi
if [ ! -f ~/.config/nvim ]; then
  ln -s $(pwd)/nvim/init.lua ~/.config/nvim/init.lua
fi

tmux source ~/.tmux.conf

exit 0

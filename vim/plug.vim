" VIM Plug
call plug#begin()
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'joshdick/onedark.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/NERDTree'
Plug 'jremmen/vim-ripgrep'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'andrewradev/tagalong.vim'
Plug 'tpope/vim-commentary'
Plug 'pseewald/vim-anyfold'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yggdroot/indentline'
Plug 'haya14busa/incsearch.vim'
Plug 'Exafunction/codeium.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'dense-analysis/ale'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Language Syntax
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'styled-components/vim-styled-components', { 'branch': 'main'  }
Plug 'jparise/vim-graphql' " GraphQL syntax
Plug 'peitalin/vim-jsx-typescript' " JSX and TS syntax
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': ['markdown', 'vim-plug'] }
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'StanAngeloff/php.vim'
Plug 'mattn/emmet-vim' " HTML, CSS, and JavaScript Emmet support
Plug 'mattn/webapi-vim'
Plug 'prisma/vim-prisma' " Prisma support
Plug 'uarun/vim-protobuf' " Protobuf support
Plug 'dart-lang/dart-vim-plugin' " Dart support
Plug 'thosakwe/vim-flutter' " Flutter support

call plug#end()

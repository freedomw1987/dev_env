syntax on
set hidden
set encoding=UTF-8
set noswapfile
set number
set relativenumber
set termguicolors
set background=dark
colorscheme solarized8

" VIM Plug
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/NERDTree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mkitt/tabline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'

call plug#end()

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:tablineclosebutton=1
let NERDTreeMinimalUI=1

" Keymap
let g:mapleader=" "

nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>to :tabnew<CR>
nmap <tab> :tabnext<CR>
nmap <S-tab> :tabprevious<CR>
nmap <leader>1 :tabn 1<CR>
nmap <leader>2 :tabn 2<CR>
nmap <leader>3 :tabn 3<CR>
nmap <leader>4 :tabn 4<CR>
nmap <leader>5 :tabn 5<CR>
nmap <leader>6 :tabn 6<CR>
nmap <leader>7 :tabn 7<CR>
nmap <leader>8 :tabn 8<CR>
nmap <leader>9 :tabn 9<CR>
nmap <leader>0 :tabn 10<CR>
nmap <leader>x :tabclose<CR>
nmap <C-s> :w<CR>




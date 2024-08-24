filetype plugin indent on " required"
syntax on

set hidden
set encoding=UTF-8
set noswapfile
set number
set relativenumber
set termguicolors
set background=dark
set mouse=a
set shiftwidth=2
set nocompatible
set backspace=indent,eol,start
set foldlevel=99 " Open all folds"
set autoread


" VIM Plug
call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/NERDTree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'chun-yang/auto-pairs'
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
" Language Syntax
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'sheerun/vim-polyglot'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': ['markdown', 'vim-plug'] }


call plug#end()

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:tablineclosebutton=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let NERDTreeMinimalUI=1
let g:coc_global_extensions = ["coc-prettier","coc-tsserver","@yaegassy/coc-tailwindcss3","coc-highlight"]

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
nmap <leader>gg :FloatermNew --height=1.0 --width=1.0 --floaterm_title='LazyGit' lazygit<CR>
nmap <C-s> :w<CR>
nmap <leader>ff :GFiles<CR>
nmap <leader>fw :Ag<CR>
" Coc mapping
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() 
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Search Highlight
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

colorscheme onedark

" activate for all filetypes
autocmd Filetype * AnyFoldActivate               
autocmd VimEnter * NERDTree
" Less compile
autocmd FileWritePost,BufWritePost *.less :call LessCSSCompress()
function! LessCSSCompress()
  let cwd = expand('<afile>:p:h')
  let name = expand('<afile>:t:r')
  if (executable('lessc'))
    cal system('lessc '.cwd.'/'.name.'.less > '.cwd.'/'.name.'.css &')
  endif
endfunction

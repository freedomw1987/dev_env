execute pathogen#infect()
filetype plugin indent on "required
syntax on
set redrawtime=10000
syntax sync minlines=10000
syntax sync fromstart

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
set foldlevel=99 "Open all folds
set autoread
set cursorline
set synmaxcol=0
set laststatus=3
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" set clipboard+=unnamedplus


" VIM Plug

call plug#begin()
source ~/.vim/plug.vim
Plug 'sheerun/vim-polyglot'
call plug#end()

" Enable Glaive to support Codefmt
" call glaive#Install()
" Glaive codefmt plugin[mappings]

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
let &t_SI="\e[6 q"
let &t_EI="\e[2 q"
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#tab_nr_type=1
let g:tablineclosebutton=1
let g:airline#extensions#tabline#formatter='unique_tail'
let NERDTreeMinimalUI=1
let g:NERDTreeWinPos="left"
let g:coc_global_extensions= [
                  \"coc-tsserver",
                  \"@yaegassy/coc-tailwindcss3",
                  \"coc-highlight",
                  \"coc-ci",
                  \"coc-syntax",
                  \"coc-html", 
                  \"coc-snippets", 
                  \"coc-prisma",
                  \"coc-docker",
                  \"coc-flutter",
                  \]
let g:codeium_disable_bindings=1
" let g:fzf_action = { 'enter': 'tab split'  }
let php_htmlInStrings = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:ale_completion_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_fixers = {
  \ 'html': ['prettier'],
  \ 'css': ['stylelint'],
  \ }
let g:ale_linters = {
  \ 'html': ['htmlhint'],
  \ 'css': ['stylelint'],
  \ }


" Keymap
let g:mapleader=" "
let g:user_emmet_leader_key=','
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/www/dev_env/.snippets.json')), "\n"))

" NERDTree
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader><Left>  :vertical resize +2<CR>
nmap <leader><Right> :vertical resize -2<CR>

" Vsplit
nmap <leader>vs :vsplit<CR>
nmap <leader>hs :split<CR>
nmap <leader>x :close<CR>
" Tabs
nmap <leader>to :tabnew<CR>
nmap <tab> :tabnext<CR>
nmap <S-tab> :tabprevicus<CR>
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
" Floaterm for git
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
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Search
nmap <leader>rg :Rg<CR>

" Search Highlight
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" Codeium
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <script><silent><nowait><expr> <C-h> codeium#AcceptNextWord()
imap <script><silent><nowait><expr> <C-j> codeium#AcceptNextLine()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>
"Move lines
nmap K <Cmd>m .-2<CR>==
nmap J <Cmd>m .+1<CR>==
vmap K :m '<-2<CR>gv=gv
vmap J :m '>+1<CR>gv=gv
inoremap jk <Esc>
" copy and paste to clipboard
vnoremap <C-c> "+y
map <C-p> "+p

" Easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

colorscheme catppuccin_mocha

" activate for all filetypes
autocmd Filetype * AnyFoldActivate               
" autocmd VimEnter * NERDTree
autocmd BufEnter * :syntax sync fromstart
augroup autoformat_settings
  autocmd FileType c,cpp,proto,java AutoFormatBuffer clang-format
  autocmd FileType javascriptreact,typescriptreact,yaml,lua AutoFormatBuffer prettier
  autocmd FileType css,less,scss AutoFormatBuffer js-beautify 
  autocmd FileType sh AutoFormatBuffer shfmt
augroup END
" Less compile
autocmd FileWritePost,BufWritePost *.less :call LessCSSCompress()
function! LessCSSCompress()
  let cwd = expand('<afile>:p:h')
  let name = expand('<afile>:t:r')
  if (executable('lessc'))
    cal system('lessc '.cwd.'/'.name.'.less > '.cwd.'/'.name.'.css &')
  endif
endfunction


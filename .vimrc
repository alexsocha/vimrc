let g:onedark_termcolors=256

call plug#begin('~/vim/plugged')

Plug '/opt/homebrew/bin/fzf'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'christoomey/vim-tmux-navigator'
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end()

syntax on
filetype plugin on

" === Plugin Config ===

let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

let NERDTreeWinPos='right'
let NERDTreeIgnore=['\.DS_Store']

set noshowmode
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'left': [['mode', 'paste'],
  \            ['gitbranch', 'readonly', 'filename', 'modified']]
  \ },
  \ 'component': {
  \     'filename': '%n:%t'
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
  \ }

let g:onedark_terminal_italics=1
colorscheme onedark

let g:vimtex_view_method = 'skim'

let g:mkdp_auto_close = 0

autocmd BufEnter *.tsx set filetype=typescript
autocmd BufReadPost *.kt setlocal filetype=kotlin


" === Standard Config ===

" line numbers
set number

" no search highlight
set nohls

" font
set guifont=Operator\ Mono\ Book:h15

" cursors
let &t_SI="\e[5 q"
let &t_SR="\e[1 q"
let &t_EI="\e[1 q"

" italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" scrolling
set scrolloff=5

" key timeouts
set timeoutlen=1000
set ttimeoutlen=0

" text width
set formatoptions-=t " do not automatically wrap text when typing
set textwidth=100
autocmd FileType typescript set textwidth=100
autocmd FileType python set textwidth=88

" indentation
set autoindent
set shiftwidth=4 tabstop=8 softtabstop=0 expandtab smarttab
" autocmd BufRead,BufNewFile *.json setlocal shiftwidth=2

set undodir=~/.vim/undo
set undofile

set backupdir=~/.vim/backup
set directory=~/.vim/swp

" === Mappings ===

let mapleader = " "

" file navigation
nnoremap <leader>f :call fzf#run(fzf#wrap({'source': 'ag -g ""'}))<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>a :NERDTreeToggle<CR>
nnoremap <leader><esc> <C-^>

" coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_disable_startup_warning = 1
nmap <silent> ge <Plug>(coc-diagnostic-next)
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>n <Plug>(coc-references)
nmap <silent> <leader>r <Plug>(coc-rename)
nmap <silent> <leader>h :call CocActionAsync('doHover')<CR>

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><s-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" auto import
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" jumps
nmap <silent> <leader>e <C-o>
nmap <silent> <C-m> <C-o>

" split and resize
nnoremap <Tab>o :vsplit<CR>
nnoremap <Tab>op :split<CR>

nnoremap <Tab>n :vertical resize +10<CR>
nnoremap <Tab>. :vertical resize -10<CR>
nnoremap <Tab>m :resize +10<CR>
nnoremap <Tab>, :resize -10<CR>

" change windows and
nnoremap <tab> <c-w>
nnoremap <tab><tab> <c-w><c-w>

" select pasted
nnoremap <expr> gc '`[' . strpart(getregtype(), 0, 1) . '`]'

" stay in visual mode after indenting
vnoremap > >gv
vnoremap < <gv

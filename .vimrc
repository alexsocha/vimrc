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

Plug 'davidhalter/jedi-vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

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

let g:jedi#popup_on_dot=0
let g:jedi#show_call_signatures=2
let g:jedi#smart_auto_mappings=0

let g:tsuquyomi_disable_default_mappings=1
autocmd BufEnter *.tsx set filetype=typescript

let g:vimtex_view_method = 'skim'

let g:mkdp_auto_close = 0

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
autocmd BufRead,BufNewFile *.json setlocal shiftwidth=2

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

" tab autocomplete
function! Tab_Or_Complete()
  if col('.')>1 && strpart(getline('.'), col('.')-2, 1) =~ '\w\|\.'
    return "\<C-x>\<C-o>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

" typescipt
autocmd FileType typescript nmap <buffer> <leader>d :TsuDefinition<CR>
autocmd FileType typescript nmap <buffer> <leader>b :TsuGoBack<CR>
autocmd FileType typescript nmap <buffer> <leader>h :echo tsuquyomi#hint()<CR>
autocmd FileType typescript nmap <buffer> <leader>r :TsuRenameSymbol<CR>
autocmd FileType typescript nmap <buffer> <leader>m :TsuImport<CR>
autocmd FileType typescript inoremap <buffer> <C-p> <C-x><C-o>

" python
autocmd FileType python nmap <buffer> <leader>b <C-t>
let g:jedi#documentation_command = "<leader>i"

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

syntax on
filetype plugin indent on

"        _             _
"  _ __ | |_   _  __ _(_)_ __  ___
" | '_ \| | | | |/ _` | | '_ \/ __|
" | |_) | | |_| | (_| | | | | \__ \
" | .__/|_|\__,_|\__, |_|_| |_|___/
" |_|            |___/
" ---------------------------------
" All the cool kids are using these.


call plug#begin('~/.vim/plugged')                                   " Vim Plug

Plug 'morhetz/gruvbox'                                              " Retro groove color scheme for Vim (Goodness)
Plug 'vim-airline/vim-airline'                                      " Lean & mean status and tabline
" General
Plug 'preservim/nerdtree'                                           " Plugin for intensely nerdy commenting powers
Plug 'preservim/nerdcommenter'                                      " code commenting
Plug 'tpope/vim-fugitive'                                           " Premier vim plugin for Git
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                 " Command-line fuzzy finder
Plug 'junegunn/fzf.vim'                                             " Wrapper over fzf that provides useful commands and mappings
" Language specific
Plug 'neoclide/coc.nvim', {'branch': 'release'}                     " Senses for your vim, using language servers
Plug 'kevinoid/vim-jsonc'                                           " Syntax support for JSON with C-style comments
Plug 'pangloss/vim-javascript'                                      " Syntax support for Javascript and better highlighting
Plug 'maxmellon/vim-jsx-pretty'                                     " Syntax support for JSX and TSX
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }     " Syntax support for golang

call plug#end()                                                     "

colorscheme gruvbox                                                 " Goodness

"                     _ _     _
"  ___  ___ _ __  ___(_) |__ | | ___
" / __|/ _ \ '_ \/ __| | '_ \| |/ _ \
" \__ \  __/ | | \__ \ | |_) | |  __/
" |___/\___|_| |_|___/_|_.__/|_|\___|
" -----------------------------------
" These are the set of sane defaults that people can agree upon.

" Appearance & feels
set background=dark                     " Notify the nvim that background color of terminal is dark
set title                               " Change the terminal's title
set relativenumber                      " Show the line number relative to the current line
set number                              " Precede each line with its line number
set nowrap                              " Wrap the lines when they are longer then the width of the window
set ruler                               " Show the line and column number of cursor position
set scrolloff=8                         " Minimal number of screen lines to keep above and below the the cursor
set cmdheight=1                         " Make sure the cmd height is always one
set cursorline
set guicursor=
set laststatus=2                        " Set the statusbar to always on
set showtabline=1                       " Specifies that show the tabline if at least two tab pages are open
set display+=lastline
set hidden                              " Hide buffer instead of abandoning it when it is unloaded
set history=1000                        " Remember more commands in exec and search history
set undofile                            " Maintain undo history between sessions
set undolevels=1000                     " Maximum number of changes that can be undone
set undodir=~/.vim/undodir              " Override the default undo directory to ~/.vim/undodir
set noerrorbells
" Spaces & Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set autoindent
set expandtab
set smarttab

set nohlsearch
set noswapfile
set nobackup
set nowritebackup
set noshowmode
set signcolumn=yes
set colorcolumn=80
set splitbelow
set splitright
set updatetime=50
set shortmess+=c
set pyxversion=3
set foldmethod=marker
set autoread
set backspace=indent,eol,start
set complete-=i
set shiftround
set timeout
set timeoutlen=300
set showcmd
set ignorecase
set smartcase
set incsearch

"  _ __ ___ _ __ ___   __ _ _ __  ___
" | '__/ _ \ '_ ` _ \ / _` | '_ \/ __|
" | | |  __/ | | | | | (_| | |_) \__ \
" |_|  \___|_| |_| |_|\__,_| .__/|___/
"                          |_|
" ------------------------------------
" This is where

let mapleader=" " " Space is the leader key that I prefer

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

" For faster mode changing ESC is mapped to jk
inoremap jk <ESC>

" Windows management
nnoremap <leader>w :wa<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :sp<CR>
nnoremap <leader>v :vsp<CR>
nnoremap <leader>+ :vertical resize +15<CR>
nnoremap <leader>- :vertical resize -15<CR>

" Movements remaps
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>r :wincmd r<CR>

" FZF configurations
let g:fzf_buffers_jump = 1
" lets test how useful they are
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Word completion in insert mode
imap <c-x><c-k> <plug>(fzf-complete-word)
" Path completion in insert mode
imap <c-x><c-f> <plug>(fzf-complete-path)
" remaps
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <leader>ps :FZF<CR>
nnoremap <silent> <leader>bs :FZF ~/<CR>

command! -bang CodeFiles call fzf#vim#files('~/code', <bang>0)


" NERDTree configurations
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
let g:NERDTreeIgnore = ['.git', 'node_modules', '__pycache__']

" C++ Helpers for building
nnoremap <leader>b :w <BAR> :!g++ -std=c++17 -o ~/.hades/build %:p<CR>

nmap <F8> :TagbarToggle<CR>


function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction

" command for using coc prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Formatting command remaps for coc prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup KALKAYAN
  autocmd!
  autocmd VimEnter * NERDTree " open nerdtree when vim starts
  autocmd VimEnter * wincmd p " switch back the focus to the previous window
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close the nerdtree window if nothing else is open

  " File formatting related
  autocmd BufWritePre * :call TrimWhitespace()

  "let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1	" Support cursor change in neovim via vitality plugin
  ":autocmd InsertEnter * set cul
  ":autocmd InsertLeave * set nocul
  "set guicursor=a:blinkon1		" Blink cursor
augroup END
let g:javascript_plugin_jsdoc = 1

source $HOME/.config/nvim/lsp.vim

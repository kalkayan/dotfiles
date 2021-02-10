syntax on

" *----+----+----+----+----+----+----+----+----+----+----+----+----+----+---* "
" *                            /~\ Plugins /~\                              * "
" *----+----+----+----+----+----+----+----+----+----+----+----+----+----+---* "
" *    This sections is for adding default plugins for the editor           * "
" *----+----+----+----+----+----+----+----+----+----+----+----+----+----+---* "
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug '~/.fzf'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

filetype plugin on
colorscheme gruvbox " Goodness

" *----+----+----+----+----+----+----+----+----+----+----+----+----+----+---* "
" *                               /~\ Sets /~\                              * "
" *----+----+----+----+----+----+----+----+----+----+----+----+----+----+---* "
" *    These are the sane defaults that the vim editior should have.        * "
" *----+----+----+----+----+----+----+----+----+----+----+----+----+----+---* "
set relativenumber
set nu
set hidden
set guicursor=
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set nohlsearch
set smartindent
set nowrap
set noswapfile
set nobackup
set nowritebackup
set incsearch
set scrolloff=8
set noshowmode
set signcolumn=yes
set colorcolumn=80
set cmdheight=1
set splitbelow
set splitright
set updatetime=50
set shortmess+=c
set pyxversion=3
set background=dark

" *----+----+----+----+----+----+----+----+----+----+----+----+----+----+---* "
" *                            /~\ Remaps /~\                               * "
" *----+----+----+----+----+----+----+----+----+----+----+----+----+----+---* "
" *    This sections is for remapping keys for the faster editing           * "
" *----+----+----+----+----+----+----+----+----+----+----+----+----+----+---* "

let mapleader=" " " Space is the leader key that I prefer

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
nnoremap <silent> <leader>ps :FZF<CR>
nnoremap <silent> <leader>bs :FZF ~/<CR>

" NERDTree configurations
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
let g:NERDTreeIgnore = ['.git', 'node_modules', '__pycache__']

" C++ Helpers for building
nnoremap <leader>b :w <BAR> :!g++ -std=c++17 -o ~/.hades/build %:p<CR>

function! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfunction

augroup KALKAYAN
  " taken from the fav ThePrimeagen
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END

source $HOME/.config/nvim/lsp.vim

" Copyright 2021 Manish Sahani (kalkayan)
" 
" Licensed under the Apache License, Version 2.0 (the "License");
" you may not use this file except in compliance with the License.
" You may obtain a copy of the License at
" 
"     http://www.apache.org/licenses/LICENSE-2.0
" 
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.
" 
" Author:           Manish Sahani <rec.manish.sahani@gmail.com>
" URL:              https://zsh.kalkayan.io (original project)
" Description:      This vimrc is the part of kalkayan's development distribution
"                   created and maintained by "Manish Sahani". To get started with
"                   this distribution, Please use the the following resources:
" Last Modified:    22 Jan, 2022


syntax on 
filetype plugin indent on

" /////////////////////////////////////////////////////////////////////////////
"        _             _
"  _ __ | |_   _  __ _(_)_ __  ___
" | '_ \| | | | |/ _` | | '_ \/ __|
" | |_) | | |_| | (_| | | | | \__ \
" | .__/|_|\__,_|\__, |_|_| |_|___/
" |_|            |___/
" /////////////////////////////////////////////////////////////////////////////
" // All the cool kids are using these.
" /////////////////////////////////////////////////////////////////////////////

                                                                  " ╭─────────────────╮╭───────────────────────────────────────────────────────╮
call plug#begin('~/.vim/plugged')                                 " │ Pluggin         ││ Description                                           │
                                                                  " │─────────────────││───────────────────────────────────────────────────────│
" Appearance                                                      " │                 ││                                                       │
Plug 'gruvbox-community/gruvbox'                                  " │ Gruvbox         ││ Retro groove color scheme for Vim    --> colorscheme  │
Plug 'vim-airline/vim-airline'                                    " │ Airline         ││ Lean & mean status and tabline                        │
                                                                  " │                 ││                                                       │
" Accessibility                                                   " │                 ││                                                       │
Plug 'preservim/nerdtree'                                         " │ NERDTree        ││ Tree Explorer for vim                                 │
Plug 'preservim/nerdcommenter'                                    " │ NERDCommenter   ││ For nerdy commenting powers                           │
" Plug 'tpope/vim-fugitive'                                         " │ Fugitive        ││ Premier vim plugin for Git                            │
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }               " │ Fzf             ││ Command line fuzzy finder for searching               │
Plug 'junegunn/fzf.vim'                                           " │ Fzf             ││ Pre-defined fzf commands and configs                  │
"Plug 'mbbill/undotree'
"
Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " │ Coc.nvim        ││ Senses for your vim, using language servers           │


call plug#end()

colorscheme gruvbox                                                 " Goodness

"     _       __             _ _
"  __| | ___ / _| __ _ _   _| | |_ ___
" / _` |/ _ \ |_ / _` | | | | | __/ __|
"| (_| |  __/  _| (_| | |_| | | |_\__ \
" \__,_|\___|_|  \__,_|\__,_|_|\__|___/
" -----------------------------------
" These are the set of "sane defaults" that people on the internet have agreed
" upon.

" Sanity
set splitbelow                          " │ Horizontal split will put the new window below the current                    │
set splitright                          " │ Vertical split will put the new window to the right                           │
set noerrorbells                        " │ Don't like any ring and dangling in my earball                                │
set autoread                            " │ Autoread the file when the file is externally modified                        │


" Appearance & feels                      ╭───────────────────────────────────────────────────────────────────────────────╮
set background=dark                     " │ Notify the nvim that background color of terminal is dark                     │
set title                               " │ Set the title of the window to titlestring                                    │
set relativenumber                      " │ Show the line number relative to the current line                             │
set number                              " │ Precede each line with its line number                                        │
set nowrap                              " │ Wrap the lines when they are longer then the width of the window              │
set ruler                               " │ Show the line and column number of cursor position                            │
set noshowmode                          " │ For echodoc to hide -- INSERT -- in command line                              │
set scrolloff=8                         " │ Minimal number of screen lines to keep above and below the the cursor         │
" set cursorline                          " │ Highlight the current line where the cursor is                                │
set guicursor=                          " │ Set the cursor to the block (for insert mode)                                 │
set cmdheight=1                         " │ Make sure the cmd height is always one                                        │
set laststatus=2                        " │ Keep the statusbar always on                                                  │
set showtabline=1                       " │ Show the tabline if at least two tab pages are open                           │
set display+=lastline                   " │ Display as much as possible of the last line                                  │
set signcolumn=yes                      " │ Show the column left to the number line for showing error signs               │
set colorcolumn=80                      " │ Highlight column after 80 width (following the legacy)                        │
set showcmd                             " │ Show command in the last line of the screen                                   │
" set updatetime=100                      " │ Having longer updatetime (default 4s) leads to noticeable delays              │
" set shortmess+=c                        " │ Don't pass messages to ins-complete-menu (example XXX completion YYY)         │
"set timeout                            " │ Nvim will wait for timeoutlen ms for follow up then it will timeout           │
"set timeoutlen=300                     " │ Time in ms to wait for a mapped sequence to complete                          │
" set pyxversion=3                        " │ Specifies the python version for pyx functions (3=python3)                    │
" set foldmethod=marker                   " │ The kind of folding used for the current window                               │
" set backspace=indent,eol,start          " │ Go to earlier line where the cursor is positioned at eol, sol and indent      │
" set complete-=i                         " │ Scan current and included files while performing autocomplete                 │
" set shiftround                          " │ Round indent to multiple of shiftwidth (CTRL-T and CTRL-D)                    │
set lazyredraw                          " │                                                                               │
" set nostartofline                       " │ Keep the cursor on the same column                                            │
"set termguicolors
                                        " ╰───────────────────────────────────────────────────────────────────────────────╯

" Backup & history                      " ╭───────────────────────────────────────────────────────────────────────────────╮
" set hidden                              " │ Hide buffer instead of abandoning it when it is unloaded                      │
" set history=1000                        " │ Remember more commands in exec and search history                             │
" set undofile                            " │ Maintain undo history between sessions                                        │
" set undolevels=10000                    " │ Maximum number of changes that can be undone                                  │
" set undodir=~/.vim/undodir              " │ Override the default undo directory to ~/.vim/undodir                         │
" set nobackup                            " │ Don't keep backup files after the file is written                             │
" set nowritebackup                       " │ Don't create any backup if the file is overwritten                            │
" set noswapfile                          " │ No swapfiles when new buffers are loade                                       │
                                        " ╰───────────────────────────────────────────────────────────────────────────────╯

" Spaces, Tabs & Indent                 " ╭───────────────────────────────────────────────────────────────────────────────╮
set tabstop=4                           " │ Number of visual <Space> per <Tab>                                            │
set softtabstop=4                       " │ Number of spaces per tab wwhile performing editing operations                 │
set shiftwidth=4                        " │ Number of spaces to use for each step of indent                               │
" set smartindent                         " │ When staring a new line do smart autoindent (Good for C-like programs)        │
set autoindent                          " │ Copy indent from current line when staring a new line                         │
set expandtab                           " │ Use the appropriate number of spaces to insert a Tab                          │
set smarttab                            " │ Insert blanks according to shiftwidth, or tabstop in front of lines           │
"                                         " ╰───────────────────────────────────────────────────────────────────────────────╯

" Search                                " ╭───────────────────────────────────────────────────────────────────────────────╮
" set incsearch                           " │ While searching, show where the pattern, as it was typed so far, matches.     │
" set nohlsearch                          " │ Stop the highlighting after the search is completed                           │
" set ignorecase                          " │ Ignore case in search patterns                                                │
" set smartcase                           " │ Override ignorecase option if the pattern contains any uppercase letters      │
                                        " ╰───────────────────────────────────────────────────────────────────────────────╯

" set viminfo^=%                          " Remember info about open buffers on close


"  _ __ ___ _ __ ___   __ _ _ __  ___
" | '__/ _ \ '_ ` _ \ / _` | '_ \/ __|
" | | |  __/ | | | | | (_| | |_) \__ \
" |_|  \___|_| |_| |_|\__,_| .__/|___/
"                          |_|
" ------------------------------------
" As Obi-Wan said "Your eyes can deceive you. Don't trust them". Keep
" these remaps only if you feel they are useful to you in terms of
" boosting your productivity and making your life easier. They may look
" really cool and still have absolute zero impact on your productivity,
" and if this is the case then its just someone else's flex.

" PLUGIN: Fzf
let $FZF_DEFAULT_OPTS = '--margin=0 --padding=0'
let g:fzf_buffers_jump = 1                                          " Jump to the existing window if possible
let g:fzf_preview_window = ['right:50%,border-left', 'ctrl-/']                  " Preview buffer on the right side of the window with 60% width
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8, 'highlight': 'Normal'} }    " Fzf window layout configs for default search

let g:fzf_colors = {
            \ 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'], 
            \ 'hl':      ['fg', 'Comment'], 
            \ 'fg+':     ['fg', 'IncSearch', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'Normal'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Normal'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" Space is the leader key now, some people use comma(,) but I prefer <Space> as
" it's accessible by both hands and doesn't conflict with other commands.
let mapleader=" "

" ESC is mapped to jk for faster mode changing. (<ESC> == <CTRL-[> == jk)
inoremap jk <ESC>

" "Window Navigation", Use <leader> + {j, k, l, h} to move around the available
" windows.
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>h :wincmd h<CR>

" "Tabs Navigation", Use <CTRL> + {j, k} to move backward and forward and CTRL-H
" to go at the first tab and CTRL-L to go at the last tab
map <C-J> :tabprevious<CR>
map <C-K> :tabnext<CR>
map <C-L> :tablast<CR>
map <C-H> :tabfirst<CR>

" Text Indentation, Don't exit from the visual mode when shifting text
xmap > >gv
xmap < <gv

" Window Resizing, change the width of windows using {+, -}
nnoremap + :vertical resize +2<CR>
nnoremap - :vertical resize -2<CR>

" Window Spliting
nnoremap <leader>s :sp<CR>
nnoremap <leader>v :vsp<CR>

" Buffer Save and Exit, Use these when you just want to save or quit.  When you
" want to save and quit simultaneously use ZZ or quit without saving use ZQ.
nnoremap <leader>w :w!<CR>
nnoremap <leader>W :wa!<CR>
nnoremap <leader>q :q<CR>
nnoremap Q :qa!<CR>
nnoremap WQ :wqa<CR>

" PLUGIN:FZF (Remaps)
nnoremap <leader>fb :Buffer       <CR>
nnoremap <leader>ff :Files        <CR>
nnoremap <leader>fd :Dotfiles     <CR>
nnoremap <leader>fg :Rg           <CR>
nnoremap <leader>fc :Colors       <CR>
nnoremap <leader>fm :Marks        <CR>
nnoremap <leader>fw :Windows      <CR>
nnoremap <leader>fh :History      <CR>
nnoremap <leader>ch :lua require'telescope.builtin'.command_history(require('telescope.themes').get_dropdown({})) <CR>

" NERDTree configurations
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>

nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>es :tabnew $HOME/setup<CR>

highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

augroup KALKAYAN
    autocmd!
    
    autocmd FileType markdown setlocal wrap
augroup END

source $HOME/.config/nvim_old/lsp.vim

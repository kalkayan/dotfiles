" Copyright (c) 2021 Manish Sahani
"
" MIT License
"
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be
" included in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"
" Author:      Manish Sahani <rec.manish.sahani@gmail.com>
" URL:         https://development.kalkayan.io (original project)
"
" Description: This vimrc is the part of kalkayan's development distribution
"              created and maintained by "Manish Sahani". To get started with
"              this distribution, Please use the the following resources:
"
"              [1] Original project - "https://development.kalkayan.io"
"              [2] kalkayan's dotfiles - "https://github.com/kalkayan/dotfiles"
"              [3] ...
"
"              For extensive availability of documentation and tricks, Please,
"              append your url to the list.


syntax on
filetype plugin indent on

"        _             _
"  _ __ | |_   _  __ _(_)_ __  ___
" | '_ \| | | | |/ _` | | '_ \/ __|
" | |_) | | |_| | (_| | | | | \__ \
" | .__/|_|\__,_|\__, |_|_| |_|___/
" |_|            |___/
" ---------------------------------
" All the "cool kids" are using these.
"
                                                                  " ╭─────────────────╮╭───────────────────────────────────────────────────────╮
call plug#begin('~/.vim/plugged')                                 " │ Pluggin         ││ Description                                           │
                                                                  " │─────────────────││───────────────────────────────────────────────────────│
" Appearance                                                      " │                 ││                                                       │
Plug 'gruvbox-community/gruvbox'                                  " │ Gruvbox         ││ Retro groove color scheme for Vim    --> colorscheme  │
Plug 'vim-airline/vim-airline'                                    " │ Airline         ││ Lean & mean status and tabline                        │
Plug 'vim-airline/vim-airline-themes'
                                                                  " │                 ││                                                       │
" Accessibility                                                   " │                 ││                                                       │
Plug 'preservim/nerdtree'                                         " │ NERDTree        ││ Tree Explorer for vim                                 │
Plug 'preservim/nerdcommenter'                                    " │ NERDCommenter   ││ For nerdy commenting powers                           │
Plug 'tpope/vim-fugitive'                                         " │ Fugitive        ││ Premier vim plugin for Git                            │
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }               " │ Fzf             ││ Command line fuzzy finder for searching               │
Plug 'junegunn/fzf.vim'                                           " │ Fzf             ││ Pre-defined fzf commands and configs                  │
Plug 'mbbill/undotree'
                                                                  " │                 ││                                                       │
" Language specific                                               " │                 ││                                                       │
Plug 'neoclide/coc.nvim', {'branch': 'release'}                   " │ Coc.nvim        ││ Senses for your vim, using language servers           │
Plug 'kevinoid/vim-jsonc'                                         " │                 ││ Syntax support for JSON with C-style comments         │
Plug 'pangloss/vim-javascript'                                    " │                 ││ Syntax support for Javascript and better highlighting │
Plug 'maxmellon/vim-jsx-pretty'                                   " │                 ││ Syntax support for JSX and TSX                        │
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }   " │                 ││ Syntax support for golang                             │
                                                                  " ╰─────────────────╯╰───────────────────────────────────────────────────────╯

" /////////////////////////////////////////////////////////////////////////////
" // Experimental Plugins
" /////////////////////////////////////////////////////////////////////////////

" [Telescope]
Plug 'nvim-lua/popup.nvim'                                          " Required by nvim-telescope
Plug 'nvim-lua/plenary.nvim'                                        " Required by nvim-telescope
Plug 'nvim-telescope/telescope.nvim'                                " Fuzzy finding, filtering, preview and pick (this turned out to be slow)
"Plug 'nvim-telescope/telescope-fzf-writer.nvim'
"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

"Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'

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

" Appearance & feels                      ╭───────────────────────────────────────────────────────────────────────────────╮
set background=dark                     " │ Notify the nvim that background color of terminal is dark                     │
set title                               " │ Set the title of the window to titlestring                                    │
set relativenumber                      " │ Show the line number relative to the current line                             │
set number                              " │ Precede each line with its line number                                        │
set nowrap                              " │ Wrap the lines when they are longer then the width of the window              │
set ruler                               " │ Show the line and column number of cursor position                            │
set noshowmode                          " │ For echodoc to hide -- INSERT -- in command line                              │
set scrolloff=8                         " │ Minimal number of screen lines to keep above and below the the cursor         │
set cursorline                          " │ Highlight the current line where the cursor is                                │
set guicursor=                          " │ Set the cursor to the block (for insert mode)                                 │
set cmdheight=1                         " │ Make sure the cmd height is always one                                        │
set laststatus=2                        " │ Keep the statusbar always on                                                  │
set showtabline=1                       " │ Show the tabline if at least two tab pages are open                           │
set display+=lastline                   " │ Display as much as possible of the last line                                  │
set noerrorbells                        " │ Don't like any ring and dangling in my earball                                │
set signcolumn=yes                      " │ Show the column left to the number line for showing error signs               │
set colorcolumn=80                      " │ Highlight column after 80 width (following the legacy)                        │
set splitbelow                          " │ Horizontal split will put the new window below the current                    │
set splitright                          " │ Vertical split will put the new window to the right                           │
set showcmd                             " │ Show command in the last line of the screen                                   │
set updatetime=100                      " │ Having longer updatetime (default 4s) leads to noticeable delays              │
set shortmess+=c                        " │ Don't pass messages to ins-complete-menu (example XXX completion YYY)         │
"set timeout                            " │ Nvim will wait for timeoutlen ms for follow up then it will timeout           │
"set timeoutlen=300                     " │ Time in ms to wait for a mapped sequence to complete                          │
set pyxversion=3                        " │ Specifies the python version for pyx functions (3=python3)                    │
set foldmethod=marker                   " │ The kind of folding used for the current window                               │
set autoread                            " │ Autoread the file when the file is externally modified                        │
set backspace=indent,eol,start          " │ Go to earlier line where the cursor is positioned at eol, sol and indent      │
set complete-=i                         " │ Scan current and included files while performing autocomplete                 │
set shiftround                          " │ Round indent to multiple of shiftwidth (CTRL-T and CTRL-D)                    │
set lazyredraw                          " │                                                                               │
set nostartofline                       " │ Keep the cursor on the same column                                            │
"set termguicolors
                                        " ╰───────────────────────────────────────────────────────────────────────────────╯

" Backup & history                      " ╭───────────────────────────────────────────────────────────────────────────────╮
set hidden                              " │ Hide buffer instead of abandoning it when it is unloaded                      │
set history=1000                        " │ Remember more commands in exec and search history                             │
set undofile                            " │ Maintain undo history between sessions                                        │
set undolevels=10000                    " │ Maximum number of changes that can be undone                                  │
set undodir=~/.vim/undodir              " │ Override the default undo directory to ~/.vim/undodir                         │
set nobackup                            " │ Don't keep backup files after the file is written                             │
set nowritebackup                       " │ Don't create any backup if the file is overwritten                            │
set noswapfile                          " │ No swapfiles when new buffers are loade                                       │
                                        " ╰───────────────────────────────────────────────────────────────────────────────╯

" Spaces, Tabs & Indent                 " ╭───────────────────────────────────────────────────────────────────────────────╮
set tabstop=4                           " │ Number of visual <Space> per <Tab>                                            │
set softtabstop=4                       " │ Number of spaces per tab wwhile performing editing operations                 │
set shiftwidth=4                        " │ Number of spaces to use for each step of indent                               │
set smartindent                         " │ When staring a new line do smart autoindent (Good for C-like programs)        │
set autoindent                          " │ Copy indent from current line when staring a new line                         │
set expandtab                           " │ Use the appropriate number of spaces to insert a Tab                          │
set smarttab                            " │ Insert blanks according to shiftwidth, or tabstop in front of lines           │
                                        " ╰───────────────────────────────────────────────────────────────────────────────╯

" Search                                " ╭───────────────────────────────────────────────────────────────────────────────╮
set incsearch                           " │ While searching, show where the pattern, as it was typed so far, matches.     │
set nohlsearch                          " │ Stop the highlighting after the search is completed                           │
set ignorecase                          " │ Ignore case in search patterns                                                │
set smartcase                           " │ Override ignorecase option if the pattern contains any uppercase letters      │
                                        " ╰───────────────────────────────────────────────────────────────────────────────╯

set viminfo^=%                          " Remember info about open buffers on close

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

" Space is the leader key now, some people use comma(,) but I prefer <Space> as
" it's accessible by both hands and doesn't conflict with other commands.
let mapleader=" "

" PLUGIN: Gruvbox
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_transparent_bg=1                                      " Make the themes terminal transparent (not working in iterm)

" PLUGIN: Airline - Tabline & statusbar configurations
let g:airline#extensions#tabline#enabled = 1                        " Enables the airline based tabline (set this to 0 if you don't use tabs)
let g:airline#extensions#tabline#show_buffers = 0                   " Disables showing buffers with a single tab (didn't required this yet)
let g:airline#extensions#tabline#left_sep = ' '                     " Leaving this empty to get straight tabs (I prefer these over >)
let g:airline#extensions#tabline#left_alt_sep = '|'                 " This character represents how the tabs are separatad - | tab 1 | tab 2
let g:airline#extensions#tabline#tab_min_count = 2                  " Don't show the tabline when there is only one window present
let g:airline#extensions#tabline#buffer_min_count = 2               " Don't show buffer info if only one window is open
let g:airline_detect_modified = 1
let g:airline#extensions#fzf#enabled = 1

" PLUGIN: NERDTree - Tree Explorer
let g:NERDTreeShowHidden = 1                                        " Toggle this setting by pressing I in NERDTree window
let g:NERDTreeAutoDeleteBuffer = 1                                  " Delete the NERDTree buffer when tree is closed
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['.git', 'node_modules', '__pycache__']      " Things to hide in Explorer

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

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Close the current buffer
nmap <Del> :bd<cr>
nmap <s-Del> :bw<cr>

"vnoremap <leader>p "_dP

" NERDTree configurations
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>

nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>es :tabnew $HOME/setup<CR>

nnoremap <F8>   :w <BAR> :!g++ -std=c++11 -lm -O2 -o %:p:h/build %:p<CR>
nnoremap <F9>   :!timeout 3 %:p:h/build < %:p:h/in.txt > %:p:h/out.txt<CR>

let dotfiles = 'git --git-dir=$HOME/.dotfiles --work-tree=$HOME ls-tree --full-tree --name-only -r HEAD | sed "s,^,$HOME/,"'

command! -bang -nargs=0                 Dotfiles             call fzf#run( fzf#wrap({ 'source': dotfiles , 'window': {'height': 0.3, 'width': 0.4 }}))

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

" command for using coc prettier
"command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Formatting command remaps for coc prettier
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"              _                           _     
"             | |                         | |    
"   __ _ _   _| |_ ___   ___ _ __ ___   __| |___ 
"  / _` | | | | __/ _ \ / __| '_ ` _ \ / _` / __|
" | (_| | |_| | || (_) | (__| | | | | | (_| \__ \
"  \__,_|\__,_|\__\___/ \___|_| |_| |_|\__,_|___/
" -----------------------------------------------
" The power of 
                                                

augroup KALKAYAN
    autocmd!
    "autocmd VimEnter *.{c,cpp,go,py,js,ts} NERDTree " open nerdtree when vim starts
    "autocmd VimEnter *.{c,cpp,go,py,js,ts} wincmd p " switch back the focus to the previous window
    "autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close the nerdtree window if nothing else is open
    "autocmd FileType nerdtree setlocal conceallevel=3
                "\ | setlocal nocursorline
                "\ | syntax match NERDTreeHideCWD #^[</].*$# conceal
                "\ | setlocal concealcursor=n

    " File formatting related
    "autocmd BufWritePre * :call TrimWhitespace()

    "let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1	" Support cursor change in neovim via vitality plugin
    ":autocmd InsertEnter * set cul
    ":autocmd InsertLeave * set nocul
    "set guicursor=a:blinkon1		" Blink cursor

    " Workaround for not working of gruvbox_transparent_bg in iterm
    "autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
            "\ |    highlight LineNr     ctermbg=NONE guibg=NONE
            "\ |    highlight SignColumn ctermbg=NONE guibg=NONE

augroup END


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

highlight LineNr ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

let g:javascript_plugin_jsdoc = 1

" Ignore files
set wildignore+=**/.git/*
set wildignore+=*.pyc
set wildignore+=**/build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*

source $HOME/.config/nvim/lsp.vim

" Credits
" https://github.com/blayz3r/dotfiles/blob/master/_vimrc (return to last position)

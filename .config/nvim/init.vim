" Author: Manish Sahani <rec.manish.sahani@gmail.com>
" Description: Vimrc of Manish Sahani

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

call plug#begin('~/.vim/plugged')                                   " Vim Plug

Plug 'morhetz/gruvbox'                                              " Retro groove color scheme for Vim (Goodness)
Plug 'vim-airline/vim-airline'                                      " Lean & mean status and tabline
" General
Plug 'preservim/nerdtree'                                           " Tree Explorer plugin for vim
Plug 'preservim/nerdcommenter'                                      " Plugin for intensely nerdy commenting powers
Plug 'tpope/vim-fugitive'                                           " Premier vim plugin for Git
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                 " Command-line fuzzy finder         { Will replace this with telescope soon }
Plug 'junegunn/fzf.vim'                                             " Useful fzf commands and mappings  {
"  Language specific
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
" These are the set of "sane defaults" that people on the internet have agreed
" upon.

" Appearance & feels
set background=dark                     " Notify the nvim that background color of terminal is dark
set title                               " Set the title of the window to titlestring
set relativenumber                      " Show the line number relative to the current line
set number                              " Precede each line with its line number
set nowrap                              " Wrap the lines when they are longer then the width of the window
set ruler                               " Show the line and column number of cursor position
set noshowmode                          " For echodoc to hide -- INSERT -- in command line
set scrolloff=8                         " Minimal number of screen lines to keep above and below the the cursor
set cursorline                          " Highlight the current line where the cursor is
set guicursor=                          " Set the cursor to the block (for insert mode)
set cmdheight=1                         " Make sure the cmd height is always one
set laststatus=2                        " Keep the statusbar always on
set showtabline=1                       " Show the tabline if at least two tab pages are open
set display+=lastline                   " Display as much as possible of the last line
set noerrorbells                        " Don't like any ring and dangling in my earball
set signcolumn=yes                      " Show the column left to the number line for showing error signs
set colorcolumn=80                      " Highlight column after 80 width (following the legacy)
set splitbelow                          " Horizontal split will put the new window below the current
set splitright                          " Vertical split will put the new window to the right
set showcmd                             " Show command in the last line of the screen
set updatetime=300                      " Having longer updatetime (default 4s) leads to noticeable delays
set shortmess+=c                        " Don't pass messages to ins-complete-menu (example XXX completion YYY)
"set timeout                             " Nvim will wait for timeoutlen ms for follow up then it will timeout
"set timeoutlen=300                      " Time in ms to wait for a mapped sequence to complete
set pyxversion=3                        " Specifies the python version for pyx functions (3=python3)
set foldmethod=marker                   " The kind of folding used for the current window
set autoread                            " Autoread the file when the file is externally modified
set backspace=indent,eol,start          " Go to earlier line where the cursor is positioned at eol, sol and indent
set complete-=i                         " Scan current and included files while performing autocomplete
set shiftround                          " Round indent to multiple of shiftwidth (CTRL-T and CTRL-D)
set lazyredraw

" Backup & history
set hidden                             " Hide buffer instead of abandoning it when it is unloaded
set history=1000                        " Remember more commands in exec and search history
set undofile                            " Maintain undo history between sessions
set undolevels=1000                     " Maximum number of changes that can be undone
set undodir=~/.vim/undodir              " Override the default undo directory to ~/.vim/undodir
set nobackup                            " Don't keep backup files after the file is written
set nowritebackup                       " Don't create any backup if the file is overwritten
set noswapfile                          " No swapfiles when new buffers are loade

" Spaces, Tabs & Indent
set tabstop=4                           " Number of visual <Space> per <Tab>
set softtabstop=4                       " Number of spaces per tab wwhile performing editing operations
set shiftwidth=4                        " Number of spaces to use for each step of indent
set smartindent                         " When staring a new line do smart autoindent (Good for C-like programs)
set autoindent                          " Copy indent from current line when staring a new line
set expandtab                           " Use the appropriate number of spaces to insert a Tab
set smarttab                            " Insert blanks according to shiftwidth, or tabstop in front of lines

" Search
set incsearch                           " While searching, show where the pattern, as it was typed so far, matches.
set nohlsearch                          " Stop the highlighting after the search is completed
set ignorecase                          " Ignore case in search patterns
set smartcase                           " Override ignorecase option if the pattern contains any uppercase letters

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

" [PLUGIN::Airline] - Tabline & statusbar configurations (:h airline-tabline)
let g:airline#extensions#tabline#enabled = 1                        " Enables the airline based tabline (set this to 0 if you don't use tabs)
let g:airline#extensions#tabline#show_buffers = 0                   " Disables showing buffers with a single tab (didn't required this yet)
let g:airline#extensions#tabline#left_sep = ' '                     " Leaving this empty to get straight tabs (I prefer these over >)
let g:airline#extensions#tabline#left_alt_sep = '|'                 " This character represents how the tabs are separatad - | tab 1 | tab 2
let g:airline#extensions#tabline#tab_min_count = 2                  " Don't show the tabline when there is only one window present
let g:airline#extensions#tabline#buffer_min_count = 2               " Don't show buffer info if only one window is open
let g:airline_detect_modified=1

" ESC is mapped to jk for faster exiting from insert mode. <ESC> is also
" aliased to <CTRL-[>
inoremap jk <ESC>

" Window navigation, Use <leader> + {j, k, l, h} to move around the available
" windows. (<C-W> & :wincmd are aliased)
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>h :wincmd h<CR>

" Tabs Navigation, Use <CTRL> + {j, k} to move backward and forward and CTRL-H
" to go at the first tab and <CTRL-L> to go at the last tab
map <C-J> :tabprevious<CR>
map <C-K> :tabnext<CR>
map <C-L> :tablast<CR>
map <C-H> :tabfirst<CR>

" Text Indentation, Don't exit from the visual mode when shifting text
vnoremap <TAB> >gv
vnoremap <S-Tab> <gv

" Window Resizing, change the width of windows using {+, -}
nnoremap + :vertical resize +2<CR>
nnoremap - :vertical resize -2<CR>

" Window Spliting
nnoremap <leader>s :sp<CR>
nnoremap <leader>v :vsp<CR>

" Buffer Save and Exit, Use these when you just want to save or quit.  When you
" want to save and quit simultaneously use ZZ or quit without saving use ZQ.
nnoremap <leader>w :wa<CR>
nnoremap <leader>q :q<CR>

" Fzf remappings
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <leader>ps :FZF<CR>
nnoremap <silent> <leader>bs :FZF ~/<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" Buffer navigation
" ---------------------------------------------------------------------------------------
function! s:buffernavigation(cmd)
    let buf = bufnr()
    execute a:cmd
    while ( &buftype == 'terminal'
                \ || &filetype == 'qf'
                \ || &filetype == 'fugitive'
                \ || &filetype == 'netrw'
                \ || &filetype == 'dirvish')
                \ && bufnr() != buf
        execute a:cmd
    endwhile
endfunction

" buffer previous
nnoremap [b :<c-u>call <SID>buffernavigation('bprevious')<CR>
" buffer next
nnoremap ]b :<c-u>call <SID>buffernavigation('bnext')<CR>
" new empty buffer
nnoremap <C-b> :enew<CR>
" conform changes (Yes, No, Cancel) instead of error
" set confirm
" close buffer
nnoremap <leader>bx :bp <BAR> bd #<CR>

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

command! -bang CodeFiles call fzf#vim#files('~/code', <bang>0)


" NERDTree configurations
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
let g:NERDTreeIgnore = ['.git', 'node_modules', '__pycache__']

" C++ Helpers for building
"nnoremap <leader>b :w <BAR> :!g++ -std=c++17 -o ~/.hades/build %:p<CR>

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

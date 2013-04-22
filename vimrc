"==============================================================================="
"   Common settings 
"==============================================================================="

" First of all, configure pathogen
filetype off
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" Vi-compatibility clearly makes Vim not optimal
set nocompatible

" Tab setting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Make Vim behave better
set encoding=utf-8
set scrolloff=3
set autoindent
set copyindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set wildignore=*.swp,*.bak,*.class,*.pyc
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set listchars=tab:↔\ ,eol:▼,trail:▪
set wrap

" Just please, don't clutter my filesystem
set nobackup
set noswapfile
"so vim dont create any .un~ file
"set noundofile "get commented
set nowritebackup

" vim backup cannot get ridden, move to a folder instead
set undodir=~/.vim/undodir
set undofile
set undolevels = 1000
set undoreload = 10000

" Set search setting
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" Turn syntax on 
if &t_Co > 2 || has("gui_running")
    syntax on
endif

" Disable toolbar and menubar for screen real estate
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
endif

" Disable comment auto completion.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


"==============================================================================="
"   Various keyboard setting
"==============================================================================="

" Set the Leader key
let mapleader=","

" Binding for visualization
"nnoremap <Leader>vh :nohlsearch<CR>
nmap \q :nohlsearch<CR>
nnoremap <Leader>vl :set list!<CR>

" Find couple with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" Switch between tabs
noremap <C-l> :tabn<CR>
noremap <C-h> :tabp<CR>
noremap <C-n> :tabn<CR>
noremap <C-Tab> : tabn<CR>

" Enable more natural movement
nnoremap j gj
nnoremap k gk
nnoremap h <C-h>
nnoremap l <Space>
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <Left> <C-h>
nnoremap <Right> <Space>

" Make inserting lines easier on normal mode
nnoremap <S-CR> O<Esc>
nnoremap <CR> o<Esc>

" Make it easy to type command
nnoremap ; :
vnoremap ; :

" Window management configuration
noremap <A-h> <C-w><
noremap <A-j> <C-W>-
noremap <A-k> <C-W>+
noremap <A-l> <C-w>>

" Buffer movement configuration
noremap <C-Left> :bprevious<CR>
noremap <C-Right> :bnext<CR>
noremap <C-h> :bprevious<CR>
noremap <C-l> :bnext<CR>

" Make indenting easier in visual mode
vnoremap > >gv
vnoremap < <gv

" Get rid of F1
nnoremap <F1> <Esc>
inoremap <F1> <Esc>
vnoremap <F1> <Esc>


" Combo to Esc key
map! ;; <Esc>


"==============================================================================="
"   Plugin-specific settings
"==============================================================================="

" NERDTree
noremap <F2> :NERDTreeToggle<CR>

" Tlist
noremap <F4> :TlistToggle<CR>

" Unimpaired
nnoremap <S-Up> [e
nnoremap <S-Down> ]e
vnoremap <S-Up> [egv
vnoremap <S-Down> ]egv

" Ctags
noremap <F8> :!ctags --recurse --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" MiniBufExplorer
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1


"==============================================================================="
" OS-specific settings
"==============================================================================="

if has("unix")
    " Convenient command if I forgot to use sudo
    cmap w!! w !sudo tee % > /dev/null

    " Ensure display is 256 colors
    if $DISPLAY != ''
        set t_Co=256
    endif

    " My font choice for my linux laptop
    if has("gui_running")
       set guifont=Envy\ Code\ R\ 10 
    endif

elseif has("win32")
    " My font choice for my workstation
    if has("gui_running")
        set guifont=Envy_Code_R:h10:cANSI
    endif
endif


"==============================================================================="
" The holy mighty Colorscheme
"==============================================================================="

if &t_Co >= 256 || has("gui_running")
    colorscheme up
endif


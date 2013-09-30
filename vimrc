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

" Better copy & paste
set pastetoggle=<F3>
set clipboard=unnamed

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" Tab setting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Make Vim behave better
set encoding=utf-8
set scrolloff=3
"set autoindent
"set copyindent
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
set undolevels=1000
set undoreload=10000

" Set search setting
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

" Change dir
set autochdir

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

" Adding go support
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on


"==============================================================================="
"   Various keyboard setting
"==============================================================================="

" Set the Leader key
let mapleader="\\"

" Binding for visualization
"nnoremap <Leader>vh :nohlsearch<CR>
nmap <Leader>q :nohlsearch<CR>
nnoremap <Leader>vl :set list!<CR>

" Find couple with Tab
nnoremap <Tab> %
vnoremap <Tab> %

" Switch between tabs
"commented out due to conflict with switch buffer
"noremap <C-l> :tabn<CR>
"noremap <C-h> :tabp<CR>
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

"More natural way spliting
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

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

" Combo Esc alternative
map! jk <Esc>


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

"Highlight column after 80
execute "set colorcolumn=" . join(range(81,335), ',')
hi ColorColumn ctermbg=235

" Showing line numbers and length
"" set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#related_names_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
"" set completeopt=longest,menuone
"" function! OmniPopup(action)
""     if pumvisible()
""         if a:action == 'j'
""             return "\<C-N>"
""         elseif a:action == 'k'
""             return "\<C-P>"
""         endif
""     endif
""     return a:action
"" endfunction

"" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
"" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable"
"
"
"

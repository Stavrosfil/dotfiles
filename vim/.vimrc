" Make clipboard global.
set clipboard+=unnamedplus

" Set how many lines of history to remember.
set history=10

" Enable filetype plugins.
filetype plugin on
filetype indent on

" Auto read when a file is changed externally.
set autoread

" Set # lines below cursor to scroll.
set so=7

" Save file (when encountering permission-denied).
command W w !sudo tee % > /dev/null

" Turn on the Wild menu.
set wildmenu
set wildmode=longest:full,full

" Command line height.
set cmdheight=2

" Use relative number lines.
set relativenumber

" Always show current position.
set ruler

" Make a buffer hidden when abandoned.
set hid

" Highlight search results.
set hlsearch

" Be smart about cases when searching.
set smartcase

" Cool searching functionalities.
set incsearch

" Don't redraw while executing macros.
set lazyredraw

" Enable regexp support.
set magic

" Show matching brackets when text indicator is over them.
set showmatch
" Tenths of a second to blink when matching brackets.
set mat=3

" Disable sound on errors.
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add extra margin to the left side.
set foldcolumn=1

" Enable syntax highlighting.
syntax enable

" Set utf8 as standard encoding.
set encoding=utf8
" Set Unix as standard file type.
set ffs=unix

" Turn swap/backup off.
set nobackup
set nowb
set noswapfile

" Be smart about tabs.
set smarttab

" tab = 4 spaces.
set shiftwidth=4
set tabstop=4

" Be smart about indent.
set si

" Wrap lines.
set wrap
" Search for current selection.

vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Return to last edit position when opening files.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Highlight characters past 79.
:au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>78v.\+', -1)

" Move between windows.
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map 0 ^
map <space> @@
map <c-space> /

" you can find the supported files in
" ls /usr/share/vim/vim81/ftplugin/
" .cls files are LaTeX.
autocmd BufRead,BufNewFile   *.cls setlocal syntax=tex

"	---------PLUGINS---------	"

" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins.
" Initialize plug.
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'dracula/vim'
Plug 'dense-analysis/ale'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf'
Plug 'ntk148v/vim-horizon'

" Initialize plug system.
call plug#end()

" Enable true colors
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

colorscheme 	horizon
"colorscheme 	halfdark

" Use Control + n to toggle the directories.
map <C-n> :NERDTreeToggle<CR>

" If there is no file opened, NerdTree will open automatically.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

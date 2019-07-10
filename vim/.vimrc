" Enable true colors

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"	---------PLUGINS---------	"

" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'sonph/onehalf'

call plug#end()

syntax 		on
colorscheme 	onedark
"colorscheme 	halfdark

set		number
set 		relativenumber
set 		cursorline

" Use Control + n to toggle the directories.
map <C-n> :NERDTreeToggle<CR>

" If there is no file opened, NerdTree will open automatically.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

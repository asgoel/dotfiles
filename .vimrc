let mapleader=","
set nocompatible
filetype off
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set showmatch
set ruler
set number
set backspace=indent,eol,start
set mouse=a
set rtp+=~/.vim/bundle/Vundle.vim
set lazyredraw
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'git://github.com/scrooloose/syntastic.git'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'groenewege/vim-less'
Plugin 'sjl/gundo.vim'
Plugin 'rking/ag.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'larrylv/ycm-elixir'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

set listchars=nbsp:¬,tab:»·,trail:·
set incsearch
nnoremap <leader><space> :nohlsearch<CR>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" open ag.vim
nnoremap <leader>a :Ag
set hlsearch
map <C-n> :NERDTreeToggle<CR>
map <C-c><C-c> :CoffeeCompile<CR>
syntax enable
set t_Co=256
colo solarized
set background=dark
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%F'
set laststatus=2
let NERDTreeQuitOnOpen=1
set clipboard=unnamed
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_coffee_coffeelint_args = "--csv"
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_rust_rustc_exe = 'cargo check'
let g:syntastic_rust_rustc_fname = ''
let g:syntastic_rust_rustc_args = '--'
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_pylint_post_args = '--msg-template="{path}:{line}:{column}:{C}: [{symbol} {msg_id}] {msg}"'
" let g:syntastic_elixir_checkers = ['elixir']
" let g:syntastic_enable_elixir_checker = 1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoTo<CR>
let python_highlight_all=1
let g:ycm_server_python_interpreter='python'
let g:ycm_python_binary_path = 'python'
let g:go_autodetect_gopath = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['golint', 'govet']

" Open go doc in vertical window, horizontal, tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>t :tab <CR>:exe "GoDef" <CR>
au FileType go let $GOPATH = go#path#Detect()

"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(open(activate_this).read(), dict(__file__=activate_this))
EOF

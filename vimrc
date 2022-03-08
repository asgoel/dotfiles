" Required settings
set nocompatible
filetype off

" Use UTF-8 without BOM
set encoding=utf-8 nobomb
set t_Co=256
set term=xterm-256color
set termencoding=utf-8

" Enhance commandline completion
set wildmenu
" Change mapleader
let mapleader=","
" Smart tabs
set noet sts=0 sw=4 ts=4
set cindent
set cinoptions=(0,u0,U0

" If line is indented, next line should have the same indent level.
set autoindent
" Highlight matching braces/parens
set showmatch
" Show line length ruler
set colorcolumn=100
set ruler
" Enable line numbers
set number
" Allow backspace in insert mode
set backspace=indent,eol,start
" Enable mouse in all modes
set mouse=a
set listchars=nbsp:¬,tab:»·,trail:·
" Highlight dynamically as pattern is typed
set incsearch
" Use OS clipboard by default
set clipboard=unnamed
" Highlight all search pattern matches
set hlsearch
" Always show status line
set laststatus=2
" Show filename in title bar
set title
" Show the (partial) command as it's being typed
set showcmd
" Set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'editorconfig/editorconfig-vim'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'groenewege/vim-less'
Plugin 'sjl/gundo.vim'
Plugin 'rking/ag.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'plytophogy/vim-virtualenv'
Plugin 'w0rp/ale'
Plugin 'hashivim/vim-terraform.git'
Plugin 'vim-scripts/indentpython.vim'
" Plugin 'vim-syntastic/syntastic'
Plugin 'jvirtanen/vim-hcl.git'

call vundle#end()
filetype plugin indent on

" Python specific settings
au BufNewFile,BufRead *.py silent!
    \ set autoindent
    " store the file in UNIX format to avoid weird conersion issues.
    \ set fileformat=unix

" Enable the solarized theme
syntax enable
colorscheme solarized
let g:solarized_termtrans = 1

" Conduct a non-highlighted search
nnoremap <leader><space> :nohlsearch<CR>
" open ag.vim
nnoremap <leader>a :Ag

" NerdTree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1

" Airline settings
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_c = '%F'

"Ctrl-P settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.terragrunt-cache$'
  \ }

" ALE (linting) settings
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_highlights = 0
let g:ale_linters = {
\   'python': ['flake8'],
\   'go': ['golint'],
\   'proto': ['prototool-lint'],
\}
let g:ale_python_flake8_options = '--config /Users/ashu/Documents/api_backend/.flake8'
let g:ale_python_pylint_options = '--rcfile /Users/ashu/.pylintrc'
let g:ale_fixers = {'python': ['isort']}
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let python_highlight_all=1

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoTo<CR>
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" Auto activate virtualenv in vim
let g:virtualenv_auto_activate = 1

" Terraform-vim config
let g:terraform_align = 1
let g:terraform_fmt_on_save = 1

" isort vim config
let g:vim_isort_python_version = 'python3'

" Syntastic settings
" set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
autocmd BufNewFile,BufRead *.tf     set filetype=terraform
autocmd BufNewFile,BufRead *.tfvars set filetype=terraform

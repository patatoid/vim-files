" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set number

"for tabulation
set shiftwidth=2
set tabstop=2
set expandtab

autocmd BufWritePre * :%s/\s\+$//e

"highlight searches
noremap <F4> :set hlsearch! hlsearch?<CR>
set incsearch

"ruby development
map ;e :w<CR>:exe ":!ruby " . getreg("%") . "" <CR>

set autoindent
"autocompletion
inoremap <tab> <c-p>
highlight Pmenu ctermfg=white ctermbg=grey guibg=grey90
highlight PmenuSel ctermfg=green ctermbg=black guibg=grey90

autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
colorscheme desert

set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file."

set clipboard=unnamedplus

call pathogen#infect()
syntax enable
filetype plugin indent on

set path=.,**,

" Enable slim syntax highlight
autocmd FileType slim setlocal foldmethod=indent
autocmd BufNewFile,BufRead *.slim set filetype=slim

" folding
set foldmethod=syntax

" splits
set splitbelow
set splitright

" see formatoptions
"
" font
set guifont=Monaco

" syntaxtic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers = ['rubocop']

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Powerline
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion = 1

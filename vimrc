"Pathogen
execute pathogen#infect()

syntax on

set background=dark
colorscheme solarized
" Some reasonable defaults
set cursorline
set modelines=0
set hidden
set nocompatible
set shell=zsh
set noerrorbells
set visualbell t_vb=
set nobackup
set encoding=utf-8
set showmode
set showcmd
set ttyfast
set laststatus=2
set history=1000
set ignorecase
set smartcase
set incsearch
set gdefault
set lazyredraw
set splitbelow
set splitright
set title
set backspace=indent,eol,start
set number
set ruler
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set hlsearch
set gdefault
set scrolloff=3
set sidescroll=1
set sidescrolloff=10
set virtualedit=block,onemore
set wildmenu
set wildmode=longest,list:longest
set endofline

let mapleader=","

" Turn off help
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>

" Highlight current line
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" jk to esc
inoremap jj <Esc>
cnoremap jj <C-c>

" Fixing delay sometimes when using O
set noesckeys

" Trying to use completion
set complete=.,b,u,]
imap <Leader><Tab> <C-P>
inoremap <C-Tab> <C-X> <C-L>

" Ctrl-P plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.class$',
  \ }
let g:ctrlp_regexp = 1
let g:ctrlp_max_depth = 40
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']

" Handles lines that are too big for the screen
let &showbreak = '> '
set cpo=n

" Turn off swap files
set noswapfile
set nobackup
set nowb

if version >= 703
  set undofile
  set undoreload=10000
  set undodir=~/.vimtmp/tmp/undo//
endif

" When you type a # character as the first character of a line,
" it pushes that to the first column. This fixes that issue
inoremap # X<BS>#

" If any literal tabs make their way into your files, highlight them
syn match tab display "\t"
hi link tab Error

" Highlight lines over 80 characters
match ErrorMsg '\%>80v.\+'

" Highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Use :w!! to save with sudo
cmap w!! %!sudo tee > /dev/null %

" Center view on search results
map n nzz
map N Nzz

" Clear search patterns after hitting enter/space
nnoremap <CR> :noh<CR><CR>
nnoremap <space> :noh<CR><space>

" Clear search patterns when entering insert mode
nnoremap i :noh<CR>i
nnoremap I :noh<CR>I
nnoremap a :noh<CR>a
nnoremap A :noh<CR>A
nnoremap o :noh<CR>o
nnoremap O :noh<CR>O
nnoremap s :noh<CR>s
nnoremap S :noh<CR>S
nnoremap R :noh<CR>R

" When the window is resized, fix splits
au VimResized * exe "normal! \<c-w>="

" Improve scrolling when lines wrap around
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Swap ; and : outside of insert mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" Press w to word wrap a block
vnoremap w gq

" I hate when u lowercases text in visual mode
" Also I want to comment/uncomment blocks of code
vnoremap u ,ci

" Easier switching between splits
map <C-Down> <C-w>j
map <C-Up> <C-w>k
map <C-Right> <C-w>l
map <C-Left> <C-w>h

" Scroll up/down with C-j, C-k instead of C-u, C-d
noremap <C-j> <C-d>
noremap <C-k> <C-u>

" Splits the current line at current position
nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zp:noh<cr>

" Better MatchParen
:hi MatchParen cterm=bold ctermbg=none ctermfg=white

" Use gw to open webpages. Only works in OS X right now
function! Website ()
  let s:url = expand("<cWORD>")
  let s:protocol = matchstr(s:url, '[a-z]*:\/\/')
  if s:protocol == ""
    let s:url = 'http://' . s:url
  endif
  exec "!open \"" . s:url . "\""
endfunction
nnoremap gw :call Website()<CR><CR>

" When you create a new file, fills in some code for you
au BufNewFile *.cc 0r ~/.vim/skeletons/skeleton.cc
au BufNewFile *.h 0r ~/.vim/skeletons/skeleton.h
au BufNewFile *.py 0r ~/.vim/skeletons/skeleton.py
au BufNewFile *.scala 0r ~/.vim/skeletons/skeleton.scala
au BufNewFile *.tex 0r ~/.vim/skeletons/skeleton.tex

" When you write a file, make sure no lines end in whitespace
autocmd BufWritePre * :%s/\s\+$//e

" For writing text
au BufNewFile,BufRead *.txt setf txt
au FileType txt set tw=79

" Latex
au BufNewFile,BufRead *.tex setf tex
au FileType tex set tw=79

autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap <C-S-P> :Ack!<Space>
let g:ackhighlight = 1

filetype plugin on
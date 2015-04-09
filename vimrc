" Some reasonable defaults
execute pathogen#infect()
Helptags

syntax on


set background=dark
colorscheme solarized

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
set fileformat=unix

"if you use the homebrew version of vim this will add clipboard support
set clipboard=unnamed

"see :help statusline
set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P

" Turn off help
inoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <F1> <ESC>

" Highlight current line
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" jj to esc
inoremap jj <Esc>
cnoremap jj <C-c>

" Fixing delay sometimes when using O
set noesckeys

" Trying to use completion
set complete=.,b,u,]

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
":hi MatchParen cterm=bold ctermbg=none ctermfg=white

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


" For writing text
au BufNewFile,BufRead *.txt setf txt
au FileType txt set tw=79


" For opening markdown files in chrome"
autocmd BufEnter *.md exe 'noremap pp :!open -a "/Applications/Google\ Chrome.app" %:p <CR>'

" only open NERDTree if no file is specified
autocmd StdinReadPre * let s:std_in=0
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
noremap <C-n> :NERDTreeToggle<CR>

" Ack Keybinding
nnoremap <C-a><C-p> :Ack!<Space>
let g:ackhighlight = 1

function! AirlineInit()
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_left_sep = ''
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
  let g:airline_section_z = airline#section#create(['windowswap', '%3p%%', 'linenr', ':%3c', ':%3B'])
endfunction

autocmd VimEnter * call AirlineInit()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



"indentLine config
"let g:indentLine_leadingSpaceChar = '·'
"let g:indentLine_leadingSpaceEnabled = 1

let g:delimitMate_insert_eol_marker = 1
let g:delimitMate_eol_marker = ''
let g:delmitMate_expand_cr = 1


function! CustomHighlighting()
  " If any literal tabs make their way into your files, highlight them
  syn match tab display "\t"
  hi link tab ErrorMsg


  " Highlight lines over 80 characters
  "match ErrorMsg '\%>80v.\+'

  " Highlight conflict markers
  match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

  highlight ExtraWhiteSpace term=bold ctermfg=red guifg=red
  syntax match ExtraWhitespace /\s\+$/ containedin=ALL conceal cchar=.

endfunction

autocmd VimEnter * call CustomHighlighting()

" When you write a file, make sure no lines end in whitespace
"autocmd BufWritePre * :%s/\s\+$//e

"gvim settings
set guifont=Inconsolata-dz\ for\ Powerline:h14
"disable L R and Bottom scroll bars by default (Note scroll still works with mouse)
set guioptions=egm

" If any literal tabs make their way into your files, highlight them
syn match tab display "\t" containedin=ALL
hi link tab ErrorMsg

" Better MatchParen
":hi MatchParen cterm=bold ctermbg=none ctermfg=white

" Highlight lines over 80 characters
"match ErrorMsg '\%>80v.\+'

" Highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

highlight ExtraWhiteSpace term=bold ctermfg=red guifg=red
syn match ExtraWhitespace /\s\+$/ containedin=ALL conceal cchar=.

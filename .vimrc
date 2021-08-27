"-------------------------------------------------------------------------------------------------"
" :set all  ... list of available options that can be set
" :help group-name
" :help cterm-colors
"-------------------------------------------------------------------------------------------------"
" White         Black
" Yellow        LightYellow
" Brown         DarkYellow
" Gray          LightGray       DarkGray 
" Grey          LightGrey       DarkGrey
" Blue          LightBlue       DarkBlue
" Green         LightGreen      DarkGreen
" Cyan          LightCyan       DarkCyan
" Red           LightRed        DarkRed
" Magenta       LightMagenta    DarkMagenta
"-------------------------------------------------------------------------------------------------"
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

syntax on
autocmd BufRead *.cql set syntax=cql
highlight LineNr        ctermfg=Grey ctermbg=0
highlight Comment       ctermfg=Gray
highlight Constant      ctermfg=Cyan            "any constant
highlight String        ctermfg=Magenta         "a string constant
highlight Character     ctermfg=Red             "a character constant: 'c', '\n'
highlight Number        ctermfg=Red             "a number constant: 234, 0xff
highlight Boolean       ctermfg=Red             "a boolean constant: TRUE, false
highlight Float         ctermfg=Red             "a floating point constant: 2.3e10

highlight Identifier    ctermfg=Cyan            "any variable name
highlight Function      ctermfg=LightRed        "function name (also: methods for classes)

highlight Statement     ctermfg=Yellow          "any statement
highlight Conditional   ctermfg=Green           "if, then, else, endif, switch, etc.
highlight Repeat        ctermfg=Green           "for, do, while, etc.
highlight Label         ctermfg=Green           "case, default, etc.
highlight Operator      ctermfg=Green           "sizeof", "+", "*", etc.
highlight Keyword       ctermfg=LightRed
highlight Exception     ctermfg=Green           "try, catch, throw

highlight Type          ctermfg=Green           "int, long, char, etc.
highlight StorageClass  ctermfg=LightBlue       "static, register, volatile, etc.
highlight Structure     ctermfg=Green           "struct, union, enum, etc.
highlight Typedef       ctermfg=Green           "A typedef

map <silent><F3> :NEXTCOLOR<cr>
map <silent><F2> :PREVCOLOR<cr>
"-------------------------------------------------------------------------------------------------"
:fixdel
set backspace=2         " make backspace work like most other apps
"set bs=2                " allow backspacing over everything in insert mode
"set backspace=indent,eol,start

" set cursorline
set nocompatible        " Get all the VIM features
set wildmenu            " use a scrollable menu for filename completions
set wildmode=list:longest,full

set showfulltag         " Get function usage help automatically
set showcmd             " Show current vim command in status bar
set showmatch           " Show matching parentheses/brackets
set showmode            " Show current vim mode
set ruler               " show the cursor position all the time
set incsearch           " incremental (emacs-style) search
set vb t_vb=            " kill the beeps! (visible bell)
set textwidth=160       " Use the traditional textwidth
set laststatus=2
set nowrap
set noet ci pi sts=0 sw=2 ts=4
set shiftwidth=2        " > and < move block by 2 spaces in visual mode
set autoindent          " Always set autoindenting on
set expandtab           " Converting tabs to spaces
set number              " Numbering 
set hlsearch
" fixdel
"
"--- Toggle search highlighting when desired
map <C-H> :set invhlsearch hlsearch?^M
" Unmap H, since the same sort of idea is being used in $VCM_HOME/component/devel/vimrc
"unmap H

map ,todo  A#TODO: KevinLuzbetak^[0j
map ,ee  oopen(FILE, ">>/tmp/kluzbetak.txt");  print __FILE__ . ":" . (caller(0))[3] . ":" . __LINE__ . "\n"; close(FILE);<ESC>o<ESC>
map ,dd  o<C-W>use Data::Dumper;<CR>print STDERR __FILE__ . ":" . (caller(0))[3] . ":" . __LINE__ . "\n" . Dumper( $$ );<ESC>o<ESC>

map ,dd1 o<C-W>use Data::Dumper;<CR>open(FILE, ">>/tmp/kluzbetak.txt");<CR>print FILE __LINE__ . Dumper( $$ );<CR>close(FILE);<ESC>o<ESC>
map ,dd2 o<C-W>use Data::Dumper;<CR>print "Content-type:text/html\n\n<html><head></head><body><xmp>\n";<CR>print Dumper( $$ );<CR>print "</xmp></body></html>\n";<ESC>o<ESC>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"map <C-V> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"--- perltidy-----"
nnoremap <silent> ,pt :%!perltidy -l=120 -q<Enter>
vnoremap <silent> ,pt :!perltidy  -l=120 -q<Enter>

"-- Like perltidy, but for JSON (only tidies entire buffer) ------"
"nnoremap <silent> ,jt :%!json_xs -f json -t json-pretty<Enter>
"nnoremap <silent> ,jt :%!perl -MJSON::PP -e 'print JSON::PP->new->relaxed->allow_singlequote->allow_barekey->pretty->encode($_)'<Enter>


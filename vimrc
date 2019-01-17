" ~/.vimrc
"==============================================
"Pathogen-specific
call pathogen#infect()
call pathogen#helptags()
"---- Enable Vim-features ---------------------
set nocompatible
"---- Auto-change to working directory --------
set acd
"---- Show special characters -----------------
"set list
"---- Show chars when wanted -------------------
set listchars=trail:·
set listchars+=tab:\|_
set listchars+=eol:¶
set lcs+=extends:>,precedes:<
filetype on
filetype plugin on
filetype indent on
set keywordprg=man
set t_Co=256
set t_ut=
syntax on
highlight TrailingWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match TrailingWhitespace /\s\+$/
colorscheme desert256
set completeopt=menuone,longest,preview
"Pydoc-specific
let g:pydoc_open_cmd = 'vsplit'
let g:pydoc_highlight=0
let g:pydoc_use_drop=1
"Easymotion mapping: press SPACE and 2 characters of interest
map <space> <Plug>(easymotion-s2)
"--------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType go setlocal noexpandtab
" vim-go mappings
    autocmd FileType go nmap <leader>r <Plug>(go-run)
    autocmd BufRead,BufNewFile *.memo setlocal filetype=memo
    autocmd BufRead,BufNewFile *.csd setlocal filetype=csound
    autocmd BufRead,BufNewFile *.ly setlocal filetype=lilypond
    autocmd BufRead,BufNewFile .zaliases setlocal filetype=sh
    autocmd BufRead,BufNewFile *.html setlocal sw=2
    autocmd BufRead,BufNewFile *.tex setlocal sw=2
endif
"------
setlocal completefunc=javacomplete#CompleteParamsInfo
"--------------------------------------------
" vim-airline stuff
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" Statusline tweaks (shows when vim-airline gets deleted)
set noruler
set laststatus=2
set statusline=                              " clear the statusline for when vimrc is reloaded
set statusline+=%5*%-2.3n\                   " buffer number
set statusline+=%F\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
"--------------------------------------------
hi User1 ctermfg=15 ctermbg=0
hi User2 ctermfg=2* ctermbg=0
hi User3 ctermfg=10 ctermbg=0
hi User4 ctermfg=86 ctermbg=0
hi User5 ctermfg=11 ctermbg=0
"--------------------------------------------
" Set colours and map to find cursor location more easily
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap \c :set cursorline! <cr>
"--------------------------------------------
set magic
set nobackup
set nowritebackup
set noswapfile
set scrolloff=0
set noeb
set novb
set pastetoggle=<F5>
set nogdefault
set history=50
set textwidth=78
set comments+=s1:/*,mb:*,ex:*/
set hid
set lz
set report=0
set whichwrap+=<,>,h,l
set sm
set mat=5
autocmd FileType c,cpp,slang set cindent
set nu
set wrapmargin=0
set wrap
"set lbr
set ch=1
"set clipboard=unnamed
set mouse=a
set mousehide
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,.git
set ignorecase
set smartcase
set autoindent
"set smartindent
set expandtab
set softtabstop=4
set smarttab
set shiftwidth=4
set tabstop=4
set wmh=1
set showcmd
set incsearch
set nohlsearch
set fo=tcrqn " See Help (complex)
set foldenable " Turn on folding
set foldmethod=manual " Make folding indent sensitive
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen+=search " open folds when you search into them
set foldopen-=undo " don't open folds when you undo stuff
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
set cm=blowfish2
set printdevice=PDF
set printfont=Terminus
"========================================================================
"--- Mappings and abbreviations ----------------
let mapleader = ","
let g:mapleader = ","
noremap <leader>sc :SyntasticCheck<cr>
noremap <leader>sr :SyntasticReset<cr>
noremap <C-kPlus> <C-A>
nnoremap <F5> :set invpaste paste?<cr>
imap <F5> <C-O><F5>
nnoremap <leader>ws :%s/\s\+$//g<cr>
inoremap jk <esc>
nmap j gj
nmap k gk
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
map Y y$
map <C-n> :bn<cr>
map <C-p> :bp<cr>
nnoremap gb :ls<CR>:b<Space>
map <leader>jt <C-]>
noremap <leader>Re :e $MYVIMRC<cr>
noremap <leader>Rs :so $MYVIMRC<cr>
vnoremap "C <esc>`>a */<esc>`<i/* <esc>
vnoremap "L <esc>`>a --]]<esc>`<i--[[ <esc>
vnoremap "U <esc>`>3x<esc>`<3x<esc>
inoremap <leader>// /*  */<esc>2hi
nnoremap <leader>mm :!pandoc -o %:r.html %<cr>
nnoremap <leader>mh :!pandoc -o %.tmp % && iconv -f utf-8 -t iso-8859-1 %.tmp > %:r.html && rm %.tmp<cr>
inoremap <leader>oo {<cr>}<esc>ko
nnoremap <leader>T :TlistToggle<cr>
nnoremap <leader>E :Vexplore<cr>
nnoremap <leader>U :Utl<cr>
"Emacs-style navigation in Command mode
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
"cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>
iabb pyshe #!/usr/bin/env python<cr># -*- encoding: utf-8 -*-
iabb bashe #!/usr/bin/env bash
iabb peshe #!/usr/bin/env perl
iab xdate <c-r>=strftime("%d.%m.%y %H:%M:%S")<cr>
" Input en dash
"inoremap <leader>- <C-v>u2013
" Input em dash (rarely needed)
"inoremap <leader>-- <C-v>u2014


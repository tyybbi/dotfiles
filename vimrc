" ~/.vimrc
"==============================================
" 1. Use Vim's (>= 8) native package loading system
" mkdir -p ~/.vim/pack/plugins/start
" 2. Install few plugins:
" cd ~/.vim/pack/plugins/start && \
" git clone https://github.com/tpope/vim-surround.git && \
" git clone https://github.com/tpope/vim-fugitive.git && \
" git clone https://github.com/tpope/vim-vinegar.git && \
" git clone https://github.com/tpope/vim-speeddating.git && \
" git clone https://github.com/vim-scripts/taglist.vim.git && \
" git clone https://github.com/AndrewRadev/splitjoin.vim.git && \
" git clone https://github.com/jlanzarotta/bufexplorer.git && \
" git clone https://github.com/vim-airline/vim-airline.git && \
" git clone https://github.com/vim-scripts/pydoc.vim.git && \
" git clone https://github.com/fatih/vim-go.git && \
" git clone https://github.com/easymotion/vim-easymotion.git && \
" git clone https://github.com/vim-syntastic/syntastic.git && \
" git clone https://github.com/lifepillar/vim-solarized8.git && \
" git clone https://github.com/ctrlpvim/ctrlp.vim.git && \
" git clone https://github.com/tpope/vim-commentary.git && \
" git clone https://github.com/pearofducks/ansible-vim.git && \
" git clone https://github.com/takelley1/ansible-doc.vim.git && \
" git clone https://github.com/neoclide/coc.nvim.git
" Note! CoC needs node, yarn etc installed, also:
" :CocInstall @yaegassy/coc-ansible
" :CocInstall coc-go
" :CocInstall coc-pyright
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
set bg=dark
colorscheme solarized8
set completeopt=menuone,longest,preview
"Pydoc-specific
let g:pydoc_open_cmd = 'vsplit'
let g:pydoc_highlight=0
let g:pydoc_use_drop=1
"Easymotion mapping: press SPACE and 2 characters of interest
map <space> <Plug>(easymotion-s2)
"If fzf installed via Git to ~/.fzf
"set rtp+=~/.fzf
"--------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType go setlocal noexpandtab
" coc-ansible needs this
    autocmd FileType yaml,yml setlocal ft=yaml.ansible ai ts=2 sw=2 et
" vim-go mappings
    autocmd FileType go nmap <leader>r <Plug>(go-run)
    autocmd BufRead,BufNewFile *.memo setlocal filetype=memo
    autocmd BufRead,BufNewFile *.csd setlocal filetype=csound
    autocmd BufRead,BufNewFile *.ly setlocal filetype=lilypond
    autocmd BufRead,BufNewFile .zaliases setlocal filetype=sh
    autocmd BufRead,BufNewFile *.html setlocal sw=2 ts=2
    autocmd BufRead,BufNewFile *.tex setlocal sw=2 ts=2
endif
"------
setlocal completefunc=javacomplete#CompleteParamsInfo
"" vim-go specific
"let g:go_fmt_command = "goimports"
"let g:go_autodetect_gopath = 1
"let g:go_list_type = "quickfix"
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_generate_tags = 1
"augroup go
"  autocmd!
"  " Show by default 4 spaces for a tab
"  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
"  " :GoBuild and :GoTestCompile
"  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
"  " :GoTest
"  autocmd FileType go nmap <leader>t  <Plug>(go-test)
"  " :GoRun
"  autocmd FileType go nmap <leader>r  <Plug>(go-run)
"  " :GoDoc
"  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
"  " :GoCoverageToggle
"  autocmd FileType go nmap <Leader>C <Plug>(go-coverage-toggle)
"  " :GoInfo
"  autocmd FileType go nmap <Leader>i <Plug>(go-info)
"  " :GoMetaLinter
"  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
"  " :GoDef but opens in a vertical split
"  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
"  " :GoDef but opens in a horizontal split
"  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
"  " :GoAlternate  commands :A, :AV, :AS and :AT
"  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
"  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
"  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
"  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"augroup END
"" build_go_files is a custom function that builds or compiles the test file.
"" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
"function! s:build_go_files()
"  let l:file = expand('%')
"  if l:file =~# '^\f\+_test\.go$'
"    call go#test#Test(0, 1)
"  elseif l:file =~# '^\f\+\.go$'
"    call go#cmd#Build(0)
"  endif
"endfunction
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
let g:airline_symbols.readonly = 'RO'
let g:airline_symbols.whitespace = 'Ξ'
" coc-ansible needs this
"let g:coc_filetype_map = {
"  \ 'yaml.ansible': 'ansible',
"  \ }
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
nnoremap \C :set cursorcolumn! <cr>
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
" With -clipboard, have to mouse=r instead of mouse=a to enable copy/paste
set mouse=r
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
let g:ctrlp_map = "<leader>cp"
noremap <leader>sc :SyntasticCheck<cr>
noremap <leader>sr :SyntasticReset<cr>
" Needs ansible-doc
nnoremap <leader>ad :AnsibleDocSplit<cr><c-l>
nnoremap <leader>av :AnsibleDocVSplit<cr><c-l>
" coc wants this to complete with <cr>
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
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
nnoremap <leader>mh :!pandoc -o %:r.html %<cr>
"nnoremap <leader>mh :!pandoc -o %.tmp % && iconv -f utf-8 -t iso-8859-1 %.tmp > %:r.html && rm %.tmp<cr>
"nnoremap <leader>mp :!pandoc -H $HOME/path/to/deeplists.tex -o %:r.pdf %<cr>
inoremap <leader>oo {<cr>}<esc>ko
inoremap <leader>c ```
nnoremap <leader>c i```<esc>
nnoremap <leader>T :TlistToggle<cr>
nnoremap <leader>E :Vexplore<cr>
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
iabb pyshe #!/usr/bin/env python3
iabb bashe #!/usr/bin/env bash
iab xdate <c-r>=strftime("%d.%m.%y %H:%M:%S")<cr>]<esc>2Bi[<esc>$
iab xdays <c-r>=strftime("%d.%m.%y")<cr>]<esc>Bi[<esc>$
"nnoremap <leader>latex :set paste<cr>i---<cr>title:<cr>author:<cr>lang: en<cr>date: \today<cr>documentclass: article<cr>classoption: a4paper<cr>geometry: "left=1.2cm,right=1.2cm,top=2cm,bottom=2cm"<cr>fontfamily: fourier<cr>linkcolor: blue<cr>output:<cr>  pdf_document:<cr>    toc: true<cr>    toc_depth: 6<cr>---<cr><cr>\tableofcontents<cr><esc>:set nopaste<cr>
" Input en dash
"inoremap <leader>- <C-v>u2013
" Input em dash (rarely needed)
"inoremap <leader>-- <C-v>u2014
"nnoremap <leader>F :FZF!<cr>

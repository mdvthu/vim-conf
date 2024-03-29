set nocompatible
filetype off

" host environment control
set shell=/bin/bash
set shellcmdflag=-lc
let g:python3_host_prog='/usr/bin/python3'

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()            " required
        Plugin 'VundleVim/Vundle.vim'  " required
        " my plugins here

        " linting (syntax checking and semantic errors)
        Plugin 'dense-analysis/ale'

        " status/tabline
        Plugin 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'

        " A collection of language packs for vim
        Plugin 'sheerun/vim-polyglot'

        " end of plugins
call vundle#end()               " required

" interface settings
set number
syntax on
set background=dark
colorscheme PaperColor
" select status bar theme
" https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme='bubblegum'
set showcmd
" bash-like tab completions
set wildmode=longest,list
set cc=80
set mouse=a
set history=200

set smartcase
" convert tabs to spaces
set expandtab

let mapleader = " "
" Make editing config easy
nmap <leader>v :tabedit $MYVIMRC<CR>

if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif

  " Reload neovim config, after changes have been written
  autocmd BufWritePost init.vim source $MYVIMRC
endif

filetype plugin indent on " required

" Move these to separate filetypes files, when finished!
" Shortcut for reloading Kubernetes config
autocmd FileType yaml.kube nmap <leader>c :!kubectl apply -f .<CR>
" Nginx test/reload config
autocmd FileType nginx nmap <leader>t :!sudo nginx -t<CR>
autocmd FileType nginx nmap <leader>c :!sudo nginx -s reload<CR>

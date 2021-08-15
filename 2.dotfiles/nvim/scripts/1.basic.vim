"================================================
" baisc.vim
" Author: Chengtao Yao
" Email: chengtao.yao@outlook.com
" Last Modified: 2021-08-13
"================================================

"------------------------------------------------
" 0. Basic Configuration
"------------------------------------------------

" Forbidden vi compat
set nocompatible

" Show line number
set number

" Show relative line number
set relativenumber

" Highlight cursor line
set cursorline

" Highlight cursor column
set cursorcolumn

" Auto indent
set autoindent

" Open C/C++ languages indent optimizations
set cindent

" Close auto line wrap
set nowrap

" Show matched brackets
set showmatch

" Show matched brackets time
set matchtime=2

" Show last line
set display=lastline

" Show wild menu
set wildmenu

" Lazy draw
set lazyredraw

" Enable mouse
set mouse=a

" Show cursor location
set ruler

" Show mode
set showmode

" Show command
set showcmd

" Enable 256 color
set t_Co=256


"------------------------------------------------
" 1. Search Configuration
"------------------------------------------------

" Ignore case
set ignorecase

" Smart case
set smartcase

" Highlight searched content
set hlsearch

" Dynamically incrementally display search result
" when searching for input.
set incsearch


"------------------------------------------------
" 2. Encoding Scheme
"------------------------------------------------

" Inner encoding scheme
set encoding=utf-8

" Default file encoding scheme
set fileencoding=utf-8

" Other file encoding scheme
set fileencodings=ucs-bom,utf-8,gbk,gb18030,gb2312,cp936,big5,euc-jp,latin1

" Terminal encoding scheme
set termencoding=utf-8

"------------------------------------------------
" 3. Syntax Highlight
"------------------------------------------------

syntax on
syntax enable


"------------------------------------------------
" 4. File Type
"------------------------------------------------

" Open file type detection
filetype on

" Open file type plugin
filetype plugin on

" Open file type indent
filetype indent on

" Open file type plugin indent
filetype plugin indent on


"------------------------------------------------
" 5. Fold Settings
"------------------------------------------------

" Enable code folding
set foldenable

" Enable code folding indent
set fdm=indent

" Open all indent as default
set foldlevel=99


"------------------------------------------------
" 6. Tabs and Spaces Configuration
"------------------------------------------------

" Enable expandtab
set expandtab

" Auto indent width
set shiftwidth=4

" Number of Spaces equals to Tab
set tabstop=4


"------------------------------------------------
" 7. Ignorance
"------------------------------------------------

set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class

set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

" When started as "evim", evim.vim will already have done these settings.
"if v:progname =~? "evim"
"  finish
"endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

silent! call pathogen#runtime_append_all_bundles()

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest,list:full   " ex tab completion
set wildignore+=*.o,*.obj,.git,*.rbc

set ignorecase
set smartcase

set number                          " line numbers
set numberwidth=5
set ruler       " show the cursor position all the time

set incsearch                     " Highlight matches as you type.
set hlsearch

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup    " do not keep a backup file, use versions instead
set nowritebackup                 " And again.

set history=250  " keep 50 lines of command line history

set expandtab
set shiftwidth=2
set tabstop=2

set dir=~/.vim/tmp
set autoread

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

let mapleader=","

if version >= 703
  set undofile
  set undodir=~/.vim/tmp
endif

let g:CommandTMaxHeight=40
let g:yankring_history_dir = '$HOME/.vim/tmp'

" Don't use Ex mode, use Q for formatting
map Q gq
map <F2> :NERDTreeToggle<cr>

" My own often used keys
nnoremap <Leader>a :Ack<space>
nnoremap <Leader><space> :noh<cr>
nnoremap <Leader>n :cn<cr>

vmap <D-[> <gv
vmap <D-]> >gv

" Remap some keys for ex mode
cnoremap <C-A> <Home>
cnoremap <C-D> <Del>
cnoremap <M-B> <S-Left>
cnoremap <M-F> <S-Right>
cnoremap <M-BS> <C-W>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
endif

if &t_Co > 16 || has("gui_running")
  " colorscheme xoria256
  colorscheme molokai
" else
 " colorscheme molokai
endif

if has("gui_running")
  set lines=48 columns=85
  set guifont=Inconsolata:h14.00
  set transparency=5
  set toolbar=icons,text
  set guioptions-=T
endif

" Setup for multibyte
if has("multi_byte")
  set fileencodings=ucs-bom,utf-8
endif

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

autocmd BufNewFile,BufRead *_spec.rb compiler rspec

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

  " http://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
  augroup BWCCreateDir
    au!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p %:h" | redraw! | endif
  augroup END

else

  set autoindent    " always set autoindenting on

endif " has("autocmd")

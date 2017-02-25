" Use Vim settings, rather then Vi settings. This must be
" first, because it changes other options as a side effect.
set nocompatible

filetype on
filetype plugin on
filetype indent on

let mapleader = ' '

" General
set wildmode=longest,full " Use normal, bash-like tab completion for commands
set wildmenu              " Turn on WiLd menu
set showmatch             " Match parenthesis
set matchtime=5           " Match for 500ms *value in 1/10s*
set autoread              " Auto-update file when edited externally
set history=700           " Remember 700 lines of history
set noerrorbells
set novisualbell

" Enable mouse
set mouse=a

" Display related
syntax on             " Syntax highlighting
set t_Co=256          " Use 256 colors
set background=dark
au ColorScheme * hi ExtraWhitespace ctermbg=Red guibg=Red
colorscheme solarized
call togglebg#map("<F5>") " toggle bg color
set scrolloff=7           " Offset of cursor when scrolling
"   Line numbers
set number                " Show line numbers
set relativenumber        " Relative line numbering
set numberwidth=4         " Use four characters
"   Status/command bar
set laststatus=2          " Always have status bar
set cmdheight=1           " Height of command bar
set ruler                 " Display cursor position
set statusline=\ %{HasPaste()}%F%(\ [%M%R%H%W]%)\ \ Line:\ %l\.%v
hi statusline ctermbg=White ctermfg=DarkGreen guibg=#859900 guifg=White
au InsertEnter * hi statusline ctermbg=White ctermfg=Red guibg=#cb4b16 guifg=White
au InsertLeave * hi statusline ctermbg=White ctermfg=DarkGreen guibg=#859900 guifg=White
"   Fonts
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
  endif
endif
"   GUI Options
" :set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" Search
set hlsearch   " Highlight search results
set incsearch  " Search as you type
set ignorecase " Ignore case when searching
set smartcase  " Try to be smart about cases
map <leader><cr> :noh<cr> " Disable highlight when <leader><cr> is pressed

" Tabs
set expandtab    " Use spaces instead of tabs
set shiftwidth=2 " 1 tab == 2 spaces
set shiftround   " Round tabbing to shiftwidth
set tabstop=2    " Tab characters displayed as 2 spaces
set smarttab     " Smart tabbing
set autoindent
set smartindent  " I dunno the difference between this and smarttab

" Code folding
set foldmethod=indent
set foldlevel=99

" Key remapping
set backspace=eol,start,indent               " Fixes backspace in insert mode
" noremap j 3j                                 " Jump by 5 lines instead of 1
" noremap k 5k
noremap <leader>m :call ToggleMouse()<cr>    " Mouse toggle
noremap <leader>p :setlocal paste!<cr>       " Paste mode toggle
noremap <leader>n :set relativenumber!<cr>   " Relative line numbering toggle
noremap <leader>t :call ToggleTextWrap()<cr> " Text wrap toggle
noremap <leader>w :set wrap!<cr>             " Word wrap toggle
nnoremap <leader><leader> za                 " Enable code folding
nnoremap <c-j> <c-w>j                        " Navigate panes easier
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
vmap <leader>y "+y                           " Easy copy to system clipboard

" Vertical split help
command -nargs=* -complete=help Help vertical belowright help <args>
cnoremap help Help

" Miscellaneous
set whichwrap+=<,>,h,l,[,] " Cursor wraps to next line
" Linebreak on 500 characters
set lbr
set textwidth=79
set formatoptions-=o  " Dont continue comments when pushing o/O
set clipboard=unnamed " yank and paste with y and p from Vim

" Backups/swapfiles
set backupdir=~/.tmp
set dir=~/.tmp

" Match trailing whitespace as an error
au BufWinEnter * match ExtraWhitespace /\s\+$/

" Helper Functions
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

function! ToggleMouse()
  if &mouse == 'a'
    set mouse=
    echo "Mouse usage disabled"
  else
    set mouse=a
    echo "Mouse usage enabled"
  endif
endfunction

function! ToggleTextWrap()
  if &textwidth == 0
    set textwidth=79
    echo "Text wrap enabled"
  else
    set textwidth=0
    echo "Text wrap disabled"
  endif
endfunction


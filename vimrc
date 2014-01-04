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
set wrap              " Wrap lines
set scrolloff=7       " Offset of cursor when scrolling
  " Line numbers
set number            " Show line numbers
set numberwidth=4     " Use four characters
  " Status/command bar
set laststatus=2      " Always have status bar
set cmdheight=1       " Height of command bar
set ruler             " Display cursor position
set statusline=\ %{HasPaste()}%F%(\ [%M%R%H%W]%)\ \ Line:\ %l\.%v
hi statusline ctermbg=Black ctermfg=DarkGreen
au InsertEnter * hi statusline ctermbg=White ctermfg=Red
au InsertLeave * hi statusline ctermbg=Black ctermfg=DarkGreen

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

" Key remapping
set backspace=eol,start,indent            " Fixes backspace in insert mode
" noremap j 3j                              " Jump by 5 lines instead of 1
" noremap k 5k
set formatoptions-=o                      " Dont continue comments when pushing o/O
noremap <leader>p :setlocal paste!<cr>        " Paste mode toggle
noremap <leader>w :set wrap!<cr>          " Word wrap toggle
noremap <leader>m :call ToggleMouse()<cr> " Mouse toggle

" Vertical split help
command -nargs=* -complete=help Help vertical belowright help <args>
cnoremap help Help

" Miscellaneous
set whichwrap+=<,>,h,l,[,] " Cursor wraps to next line
  " Linebreak on 500 characters
set lbr
set tw=500

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




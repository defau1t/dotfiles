"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Package manager (Vundle)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-sleuth'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'vimwiki'
Plugin 'vis'
Plugin 'asmx86'
Plugin 'asmx86_64'
Plugin 'dylanaraps/wal.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'xuhdev/vim-latex-live-preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Turn backup off, since most stuff is in VCS
set nobackup
set nowb
set noswapfile

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hotkeys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file. Use "," instead of "\" as the leader
" key.
let mapleader = ","
let g:mapleader = ","

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Disable highlight when <leader>h is pressed
map <silent> <leader>h :noh<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Quick switching between windows with alt + arrow
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

inoremap jk <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LLP Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set zathura to our pdf viewer
let g:livepreview_previewer = 'zathura'

" LLPStartPreview starts the previewer

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu for filename completion. Work like bash
set wildmode=longest:full,full
set wildmenu

" Ignore compiled files in wild menu.
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
	set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" No word wrap
set nowrap

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" Set line numbers
set number relativenumber

" Allow the mouse to be used in the window. Hold shift to get normal mouse
" functionality
" set mouse=a

" Allow positioning cursor after end of line (where a character does not
" exist). Makes it easier to, say, delete from the end of a line to a previous
" mark (etc). Displaying trailing whitespace practically a necessity.
set virtualedit=onemore

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

try
	colorscheme wal
catch
endtry

set background=dark

" Show non printing characters (tabs and trailing spaces) appropriately
set list
set listchars=tab:>-,trail:·,extends:>,precedes:<
" Color now set in indent guide
"highlight SpecialKey ctermfg=235

" Show the ruler at 80 characters
set colorcolumn=81 " Up to this column is 80 (including and after is 81+)
highlight ColorColumn ctermbg=236

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Be smart when using tabs
set smarttab
set shiftwidth=2
set tabstop=2
set expandtab

set ai "Auto indent
set si "Smart indent

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" Remember info about open buffers on close
set viminfo^=%

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236 ctermfg=245
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=240 ctermfg=245

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editor panel, window, and buffer related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F2> :tabprevious<CR>
inoremap <F2> <ESC>:tabprevious<CR>
noremap <F3> :tabnext<CR>
inoremap <F3> <ESC>:tabnext<CR>
nnoremap <C-t> :tabnew<CR>

" Tab line uses airline
let g:airline#extensions#tabline#enabled = 1

" Don't display 'mixed' whitespace (often wrong)
let g:airline#extensions#whitespace#enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Symbols for airline
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => On save actions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save
func! DeleteTrailingWS()
	exe "normal mz"
	if &ft =~ 'markdown\|modula2'
		exe "normal 'z"
		return
	endif
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set tab sizes
func! Tab(var1)
	let size=a:var1
	let &l:tabstop=size
	let &l:shiftwidth=size
	let &l:softtabstop=size
	IndentGuidesEnable
endfunc
command! -nargs=1 T call Tab(<f-args>)

" Insert date
command! InsertDate :normal a<c-r>=strftime('%Y-%m-%d')<cr>

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_c_check_header = 1
let g:syntastic_c_include_dirs = ['./lib', '/www/docs/classes/332/t1/pthreads']

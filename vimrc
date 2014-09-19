" Required by Vundel
set nocompatible          " get out of horrible vi-compatible mode
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" Required! 
Plugin 'gmarik/vundle'

" My Bundles here:
" original repos on github
Plugin 'altercation/vim-colors-solarized'
Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'evidens/vim-twig'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
"
" " Github repos of the user 'vim-scripts'
" " => can omit the username part
" Plugin 'L9'
" Plugin 'FuzzyFinder'
"
" " non github repos
" Plugin 'git://git.wincent.com/command-t.git'
" ...

call vundle#end()           " required
filetype plugin indent on   " required (detect the type of file and load filetype plugins)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8        " always use UTF-8
set ffs=unix,dos,mac      " support all three, in this order
set history=1000          " How many lines of history to remember
set cf                    " enable error files and error jumping
set clipboard+=unnamed    " turns out I do like is sharing windows clipboard
set isk+=$,@,%,#,-        " none of these should be word dividers, so make them not be
set viminfo+=!            " make sure it can save viminfo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme, Colors & variables
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
syntax on                 " syntax highlighting on
set background=dark       " we use dark background
colo solarized

if !has("gui_running")
    set t_Co=256
endif

" Default netrw tree mode
let g:netrw_banner=0        " Hide ifo banner on startup
" let g:netrw_browse_split=4 " Open in previous window
" let g:netrw_hide=1        " Show not-hidden files
" let g:netrw_keepdir=0       " Keep the current directory the same as the browsing directory
let g:netrw_list_hide= netrw_gitignore#Hide() . '^\.svn\/$' " Hide gitignore & svn folders
let g:netrw_liststyle=3
let g:netrw_preview=1       " Make vertical splitting the default for previewing files
" let g:netrw_winsize=30    " Split size in %

" Powerline fancy symbols
let g:Powerline_symbols = 'fancy'

" let g:solarized_termcolors=256
let g:solarized_termtrans = 1

" CTRLp Exclude from search
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" Zencoding
let g:user_zen_leader_key = '<c-y>'

" Session management
let g:session_directory = '~/.vim/myfiles/sessions'    " all sessions lives here
let g:session_autoload = 'no'
let g:session_autosave = 'yes'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files/Backups
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup                          " make backup file
set backupdir=~/.vim/myfiles/backup " where to put backup file
set directory=~/.vim/myfiles/tmp    " directory is the directory for temp file
set viewdir=~/.vim/myfiles/view     " Save view files here
"set autochdir               " always switch to the current directory
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set lsp=1               " space it out a little more (easier to read)
set wildmode=list:longest "
set ruler               " Always show current positions along the bottom
set cmdheight=2         " the command bar is 2 high
set number              " turn on line numbers
set lz                  " do not redraw while running macros (much faster) (LazyRedraw)
set hid                 " you can change buffer without saving
"set backspace=2         " make backspace work normal
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
set mouse=n             " use mouse in normal mode
set shortmess=atI       " shortens messages to avoid 'press a key' prompt
set report=0            " tell us when anything is changed via :...
                        " make the splitters between windows be blank
"set fillchars=vert:\ ,stl:\ ,stlnc:\
set nosol               " leave my cursor where it was
set novisualbell
set noerrorbells
set diffopt=vertical    " Start diff mode in vertical splits
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Cues
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch           " show matching brackets
set mat=5               " how many tenths of a second to blink matching brackets for
set hlsearch            " highlight searched for phrases
set incsearch           " do highlight as you type you search phrase
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:¬ " what to show when I hit :set list
set so=2                " Keep 5 lines (top/bottom) for scope
" set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
" set statusline=%F%m%r%h%w\ [%{&ff}/%Y]\ [BN=%n]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2        " always show the status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wildmenu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("wildmenu")
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
    set wildmenu
    set wildmode=longest,list
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ai                    " autoindent (filetype indenting instead)
set si                    " smartindent (filetype indenting instead)
set expandtab
set tabstop=4             " real tabs should be 4, but they will show with set list on
set softtabstop=4         " unify
set shiftwidth=4          " unify
set shiftround            " when at 3 spaces, and I hit > ... go to 4, not 5
set copyindent            " but above all -- follow the conventions laid before us
" set preserveindent        " but above all -- follow the conventions laid before us
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set fo=tcrq               " See Help (complex)
set wrap                  " wrap lines
set ignorecase            " case insensitive by default
set smartcase             " if there are caps, go case-sensitive
"set completeopt=menu,longest,preview " improve the way autocomplete works
set completeopt=longest,menuone
set cursorcolumn          " show the current column
set cursorline            " show the current line
set mps+=<:>              " These are pairs in HTML
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding - enable folding, but by default make it act like folding is off
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldenable            " Turn on folding
"set foldmethod=manual     " Make folding indent sensitive
set foldlevel=100         " Don't autofold anything (but I can still fold manually)
set foldopen-=search      " don't open folds when you search into them
set foldopen-=undo        " don't open folds when you undo stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap hh =>
" imap uu _
" imap aa @

" Directory change mapings
let mapleader=','
map <leader>ew :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>es :sp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>ev :vsp <C-R>=expand("%:p:h") . "/" <CR>
map <leader>et :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" Fast saving
nmap <leader>s :w!<cr>
nmap <leader>a :wa<cr>

" Markdown to HTML
nmap <leader>md :%!~/bin/Markdown.pl --html4tags<CR>

" Tasklist
map <leader>tl <Plug>TaskList

" Switch buffers
map <down> <ESC>:bn<CR> " right arrow (normal mode) switches buffers  (excluding minibuf)
map <up> <ESC>:bp<CR>  " left arrow (normal mode) switches buffers (excluding minibuf)

" Toggle relative numbering
nnoremap <F3> :NumbersToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Experimental
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
" Dont use cindent for CSS
au BufEnter *.scss set nocindent
au BufLeave *.scss set cindent
au BufRead,BufNewFile *.haml,*.sass,*.scss setlocal softtabstop=2
au BufRead,BufNewFile *.haml,*.sass,*.scss setlocal  shiftwidth=2
" We use special settings for HAML SCSS and SASS fieles
au FileType sass,scss setlocal fdm=marker
au FileType haml setlocal foldmethod=indent
au FileType erb setlocal foldmethod=manual
au FileType python setlocal omnifunc=pythoncomplete#Complete
au FileType php setlocal omnifunc=phpcomplete#CompletePHP
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType html setlocal omnifunc=htmlcomplete#CompleteTags
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful abbrevs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

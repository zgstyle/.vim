set nocompatible          " get out of horrible vi-compatible mode
" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't arlready have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist  (Thanks @kapadiamush)
    execute 'mkdir -p ~/.vim/plugged'
    execute 'mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" COLORSCHEMES 
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/vim-colors-solarized'
Plug 'captbaritone/molokai'
Plug 'chriskempson/base16-vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'fxn/vim-monochrome'

" SYNTAX
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'evidens/vim-twig', { 'for': 'twig' }
Plug 'joshtronic/php.vim', { 'for': 'php' }

" COMPLETION
Plug 'mattn/emmet-vim'
Plug 'Shougo/neocomplete.vim'

" Make % match xml tags
Plug 'tmhedberg/matchit', { 'for': ['html', 'xml'] }

" INDENTATION
Plug 'godlygeek/tabular'

" STATUSLINE
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'henrik/vim-indexed-search'
Plug 'kien/ctrlp.vim'
Plug 'mephux/vim-jsfmt'
Plug 'mileszs/ack.vim'
Plug 'miyakogi/conoline.vim'
Plug 'myusuf3/numbers.vim'
Plug 'tmhedberg/matchit'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/TaskList.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

filetype plugin indent on   " required (detect the type of file and load filetype plugins)
call plug#end()

" Enable neocomplete at start
let g:neocomplete#enable_at_startup = 1

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
let g:netrw_list_hide= netrw_gitignore#Hide() . '^\.svn\/$, ^\.sass-cache\/$' " Hide gitignore & svn folders
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 0
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1
" let g:netrw_browse_split=4 " Open in previous window
" let g:netrw_hide=1        " Show not-hidden files
" let g:netrw_keepdir=0       " Keep the current directory the same as the browsing directory
" Does not work with older versions of netrw
" let g:netrw_list_hide= netrw_gitignore#Hide() " Hide gitignore & svn folders
" let g:netrw_preview=1       " Make vertical splitting the default for previewing files
" let g:netrw_winsize=30    " Split size in %

" Powerline fancy symbols
let g:airline_powerline_fonts = 1

" let g:solarized_termcolors=256
" let g:solarized_termtrans = 1

" CTRLp Exclude from search
let g:ctrlp_custom_ignore = 'node_modules\|\.git$\|\.hg$\|\.svn$\|\.sass-cache$\|app\/cache'

" Emmet trigger key
let g:user_emmet_leader_key = '<C-Y>'

" Session management
let g:session_directory = '~/.vim/myfiles/sessions'    " all sessions lives here
let g:session_autoload = 'no'
let g:session_autosave = 'no'

" Syntastic settings
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0     " Dont check on save or quit

" Auto enable cursor line plugin (conoline)
let g:conoline_auto_enable = 1
" Use colorscheme in both modes
let g:conoline_use_colorscheme_default_normal=1
let g:conoline_use_colorscheme_default_insert=1

" Neocomplete settings
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2

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
set lsp=1               " space it out a little more (easier to read)
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
set noerrorbells        " don't beep
set diffopt=vertical    " Start diff mode in vertical splits
set title               " change terminal's title

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
set laststatus=2        " always show the status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wildmenu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make the Enter key select set wildmenu completion entry instead of creating
" a new line
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" if has("wildmenu")
"     set wildignore+=*.a,*.o
"     set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
"     set wildignore+=.DS_Store,.git,.hg,.svn
"     set wildignore+=*~,*.swp,*.tmp
"     set wildignore+=templates/compiled/**
"     set wildmenu
"     set wildmode=longest,list
" endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ai             "  autoindent (filetype indenting instead)
set si             "  smartindent (filetype indenting instead)
set copyindent     " but above all -- follow the conventions laid before us
set preserveindent " but above all -- follow the conventions laid before us
set expandtab
set tabstop=4      " real tabs should be 4, but they will show with set list on
set softtabstop=4  " unify
set shiftwidth=4   " unify
set shiftround     " when at 3 spaces, and I hit > ... go to 4, not 5
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set fo=tcrq               " See Help (complex)
set wrap                  " wrap lines
set ignorecase            " case insensitive by default
set smartcase             " if there are caps, go case-sensitive
set complete=.,w,b,u,t,
"set completeopt=menu,longest,preview " improve the way autocomplete works
set completeopt=longest,menuone
set cursorcolumn          " show the current column
"set cursorline            " show the current line
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
map <up> <ESC>:bp<CR>   " left arrow (normal mode) switches buffers (excluding minibuf)

" Toggle relative numbering
nnoremap <F3> :NumbersToggle<CR>
" Toggle paste mode
set pastetoggle=<F2>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Experimental
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable the highlights when you enter insertmode and will turn them back on
" when you leave insertmode
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

au BufEnter * :syntax sync fromstart " ensure every file does syntax highlighting (full)
" Dont use cindent for CSS
" au BufEnter *.scss set nocindent
" au BufLeave *.scss set cindent
au BufRead,BufNewFile *.haml,*.sass,*.scss setlocal softtabstop=2
au BufRead,BufNewFile *.haml,*.sass,*.scss setlocal  shiftwidth=2
" We use special settings for HAML SCSS and SASS fieles
au FileType sass,scss setlocal fdm=marker
au FileType haml setlocal foldmethod=indent
au FileType erb setlocal foldmethod=manual
" Enable omnicomplete
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
au FileType html setlocal omnifunc=htmlcomplete#CompleteTags
" au FileType python setlocal omnifunc=pythoncomplete#Complete
" au FileType php setlocal omnifunc=phpcomplete#CompletePHP
" au FileType css setlocal omnifunc=csscomplete#CompleteCSS
" au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful abbrevs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

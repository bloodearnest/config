" ==========================================================
" General setup
" ==========================================================

set modelines=0 " disable security holes
set nocompatible " not compatiable with vi
set encoding=utf-8

" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Load pathogen with docs for all plugins
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ==========================================================
" Basic Settings
" ==========================================================
syntax on " syntax highlighing
filetype on " try to detect filetypes
filetype plugin indent on " enable loading indent file for filetype

""" appearence
colorscheme molokai
set background=dark " We are using dark background in vim
set title " show title in console title bar

""" completions
set wildmenu " Menu completion in command mode on <Tab>
set wildmode=full " <Tab> cycles between all matching choices.
set wildignore+=*.o,*.obj,.git,*.pyc

""" don't bell or blink
set noerrorbells
set vb t_vb=

""" Moving Around/Editing
"set cursorline " have a line indicate the cursor location
set nostartofline " Avoid moving cursor to BOL when jumping around
set virtualedit=block " Let cursor move past the last char in <C-v> mode
set scrolloff=5 " Keep context lines above and below the cursor
set backspace=2 " Allow backspacing over autoindent, EOL, and BOL

"""line numbers
set number " Display line numbers
set numberwidth=1 " using only 1 column (and 1 space) while possible
set relativenumber " relative line nos
set ruler " show the cursor position all the time

""" line endings/length
set textwidth=79
set formatoptions=tcroqn1
set colorcolumn=+1 "one beyond textwidth
"#highlight ColorColumn ctermbg=darkgrey guibg=darkgrey
set nowrap " don't wrap text
set linebreak " don't wrap textin the middle of a word
set ffs=unix,dos,mac " Try recognizing dos, unix, and mac line endings.

""" indentation
set autoindent " always set autoindenting on
set smartindent " use smart indent if there is no indent file
set tabstop=4 " <tab> inserts 4 spaces
set shiftwidth=4 " but an indent level is 2 spaces wide.
set softtabstop=4 " <BS> over an autoindent deletes both spaces.
set expandtab " Use spaces, not tabs, for autoindent/tab key.
set shiftround " rounds indent to a multiple of shiftwidth

""" brackets matching
set showmatch " Briefly jump to a paren once it's balanced
set matchpairs+=<:> " show matching <> (html mainly) as well

""" saving
set nobackup
set nowritebackup
set noswapfile
set noautowrite " Never write a file unless I request it.
set noautowriteall " NEVER.
set noautoread " Don't automatically re-read changed files.
" save on focus lost
au FocusLost * :wa 

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Messages, Info, Status
set ls=2 " allways show status line
set vb t_vb= " Disable all bells. I hate ringing/flashing.
set confirm " Y-N-C prompt if closing with unsaved changes.
set showcmd " Show incomplete normal mode commands as I type.
set report=0 " : commands always print changed line count.
set shortmess+=a " Use [+]/[RO]/[w] for modified/readonly/written.
set laststatus=2 " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:->,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
" sane regex
set ignorecase " Default to using case insensitive searches,
set smartcase " unless uppercase letters are used in the regex.
set gdefault " global by default
set smarttab " Handle tabs more intelligently
set hlsearch " Highlight searches by default.
set incsearch " Incrementally search while typing a /regex



" ===============
" Macros/commands
" ===============

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" sudo write this
cmap W! w !sudo tee % >/dev/null
cmap w!! w !sudo tee % >/dev/null

" window navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
imap <C-W> <C-O><C-W>

" Paste from clipboard
map <leader>p "+gP

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"




" ===========================================================
" auto/FileType specific changes
" ============================================================


" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

"Javascript
au BufRead *.js set makeprg=jslint\ %

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with



" ===========================================================
" Plugin config
" ============================================================

" PyFlakes
" Don't let pyflakes use the quickfix window
"let g:pyflakes_use_quickfix = 0

"pep8
let g:pep8_map='<leader>8'

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

" NerdTree
" Open NerdTree
map <leader>n :NERDTreeToggle<CR>


" Rope
" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>


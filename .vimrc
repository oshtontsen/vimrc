"
"██╗   ██╗██╗███╗   ███╗
"██║   ██║██║████╗ ████║
"██║   ██║██║██╔████╔██║
"╚██╗ ██╔╝██║██║╚██╔╝██║
" ╚████╔╝ ██║██║ ╚═╝ ██║
"  ╚═══╝  ╚═╝╚═╝     ╚═╝
"


" {{{ BASIC SETUP
" BASIC SETUP:

" enter the current millenium
set nocompatible
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set cindent cinkeys-=0#
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set laststatus=2
" Leaves 7 lines below/above the cursor when scrolling 
set so=7

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" Remap the leader key to space bar
let mapleader = "\<Space>" 



" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags




" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list




" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" Turn relative line numbers on
:set relativenumber
:set rnu


" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" Exit out of insert mode using jj rather than the <ESC> key
inoremap jj <ESC>

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)




" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back

" Add mapping to quickly insert a breakpoint 
let @d = 'iimport pdb; pdb.set_trace()'



" PLUG INS:
call plug#begin('~/.vim/plugged')

" Plug-in from https://github.com/itchyny/lightline.vim
" Adds a status bar displaying the current mode and file name
Plug 'itchyny/lightline.vim'


" Plug-in from https://github.com/morhetz/gruvbox
" New colorscheme 
Plug 'morhetz/gruvbox'    


" Plug-in from https://github.com/preservim/nerdtree
" Adds tree structure in file explorer
Plug 'preservim/nerdtree'


" Plug-in from https://github.com/dense-analysis/ale
" Asynchronously runs linters and fixers for debugging
Plug 'dense-analysis/ale'


" Plug-in from https://github.com/townk/vim-autoclose
" Adds a matching closing bracket or brace
Plug 'townk/vim-autoclose'


" Plug-in from https://github.com/junegunn/goyo.vim
" Adds new mode for distraction-free writing
Plug 'junegunn/goyo.vim'


" Plug-in from https://github.com/wikitopian/hardmode
" Adds new mode for avoiding certain inefficient vim keys 
Plug 'wikitopian/hardmode'


" Plug-in from https://github.com/junegunn/fzf.vim'
" Allows for fuzzy searches and works in conjunction with ripgrep
"
" Add the following for latest binary:
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } }
"
" Requires: https://github.com/BurntSushi/ripgrep
"
" To use ripgrep add the following into the .bashrc file
" export FZF_DEFAULT="rg --files --hidden --follow --glob '!.git'"
"
" To cycle through ripgrep search results use the following commands
" ctrl + j,k
"
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'


" Plug-in for git supported actions 
Plug 'tpope/vim-fugitive'



call plug#end()





" Fugitive configurations 
"
" To remap the git status command 
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>


" Lightline status bar configurations 
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


" Ale configurations
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'*': [], 'python': ['black', 'isort']}
let g:ale_fix_on_save = 1


" COLORSCHEME
colorscheme gruvbox
set background=dark

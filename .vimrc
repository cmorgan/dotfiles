set nocompatible  " be iMproved
filetype off  " required by vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'Shougo/vimproc'
Bundle 'flazz/vim-colorschemes'
Bundle 'klen/python-mode'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/rest.vim'
Bundle 'tpope/vim-commentary'
Bundle 'Lokaltog/vim-powerline'
Bundle 'insanum/vim-rst-tables'
Bundle 'sgeb/vim-matlab'
Bundle 'tmhedberg/SimpylFold'

if v:version >= 703
    Bundle 'dag/vim2hs'
    if has('patch584') && has('python')
        Bundle 'Valloric/YouCompleteMe'
    endif
endif

if executable('ghc-mod')
    Bundle 'eagletmt/ghcmod-vim'
endif

nnoremap <silent><C-x> :tabprevious<CR>
nnoremap <silent><C-c> :tabnext<CR>
nnoremap <silent><C-e> :tabnew<CR>
nnoremap <silent><C-r> :tabclose<CR>

source $VIMRUNTIME/macros/matchit.vim

filetype plugin indent on
syntax on

if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

set spelllang=en_gb
imap jj <ESC>

set history=1000
set undolevels=1000
set background=dark
set textwidth=79
set autoindent
" show the cursor position all the time
set ruler
" show commands
set showcmd
" do incremental searches (annoying but handy);
set incsearch
set wildignore=*.swp,*.bak,*.pyc,*.class
set nobackup
set noswapfile
set backspace=indent,eol,start
set encoding=utf-8
set noexpandtab
set hls
set incsearch
set laststatus=2
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set pastetoggle=<F2>
set shiftwidth=4
set softtabstop=4
set tabstop=4
set wildignore=*.o,*.bak,*.pyc,*.swp
set wildmenu
set wildmode=longest:full
set guioptions-=T
" always change paths to the current dir
set autochdir

let mapleader=","
let fortran_free_source=1
let g:haskell_conceal_enumerations=0
let g:hpaste_author = 'Chris Morgan'
let g:ycm_key_detailed_diagnostics = '<leader>q'
let g:pymode_folding=1
let g:pymode_motion=1
let g:pymode_rope=0
let g:pymode_utils_whitespaces=0
let g:pymode_virtualenv=0
let g:pymode_lint_write = 0
let g:pymode_lint_ignore = "E501, W404, E303"
let g:pymode_lint= 0
let g:pymode_lint_mccabe_complexity=9

if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

if has("autocmd")
    autocmd BufEnter * if &ft != 'help' | silent! cd %:p:h | endif
    autocmd BufNewFile,BufRead,BufEnter *.md set filetype=markdown
    autocmd BufNewFile,BufRead,BufEnter *.tmpl set filetype=html
    autocmd BufNewFile,BufRead,BufEnter *.go set filetype=go
endif

nnoremap <leader>t :tabnew 
nnoremap <leader>a :Ack "<C-R><C-W>"
nnoremap <leader>l :SyntasticCheck<CR>
nnoremap <leader>p oimport pdb; pdb.set_trace()
" folding
" toggle open fold
nnoremap f zA
" open all
nnoremap F zR
" clos all
nnoremap <C-f> zM

colorscheme solarized
set colorcolumn=80

" when indenting in visual mode keep the block highlighted
vnoremap < <gv
vnoremap > >gv

" Toggle line numbers and fold column for easy copying:
nnoremap <F3> :set number!<CR>:set foldcolumn=0<CR>
" odd issue with vim not matching values set for backspace and delete as produced by linux
"set t_kb=
"set t_kD=[3~

autocmd FileType matlab set commentstring=%%s
autocmd FileType rst set nofoldenable

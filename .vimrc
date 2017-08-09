set nocompatible  " be iMproved

nnoremap <silent><C-x> :tabprevious<CR>
nnoremap <silent><C-c> :tabnext<CR>
nnoremap <silent><C-e> :tabnew<CR>
nnoremap <silent><C-r> :tabclose<CR>

source $VIMRUNTIME/macros/matchit.vim

filetype plugin indent on
"syntax on

if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

set spelllang=en_gb
imap jj <ESC>

set history=1000
set undolevels=1000
set background=dark
"set textwidth=79
au FileType python set textwidth=79
au FileType rst set textwidth=79
set autoindent
" show the cursor position all the time
"
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

"colorscheme solarized
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

" Solarized rainbow_parentheses
let g:rbpt_colorpairs = [
  \ [ '13', '#6c71c4'],
  \ [ '5',  '#d33682'],
  \ [ '1',  '#dc322f'],
  \ [ '9',  '#cb4b16'],
  \ [ '3',  '#b58900'],
  \ [ '2',  '#859900'],
  \ [ '6',  '#2aa198'],
  \ [ '4',  '#268bd2'],
  \ ]

" Enable rainbow parentheses for all buffers
let g:slime_target = "tmux"
autocmd Syntax clojure RainbowParenthesesLoadRound
autocmd BufEnter *.clj RainbowParenthesesToggle
autocmd BufLeave *.clj RainbowParenthesesToggle
" augroup rainbow_parentheses
"   au!
"   au VimEnter *.clj RainbowParenthesesActivate
"   au BufEnter *.clj RainbowParenthesesLoadRound
"   au BufEnter *.clj RainbowParenthesesLoadSquare
"   au BufEnter *.clj RainbowParenthesesLoadBraces
" augroup END

" vim sessions shortcut
map <F4> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F5> :source ~/vim_session <cr>     " And load session with F3

" change the default behaviour of ctrl-p in order to make 'open in new-tab' the
" behaviour of Cr.
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

let g:slime_default_config = {"socket_name": "default", "target_pane": "1"}

" vertical line indentation
" let g:indentLine_color_term = 239
" let g:indentLine_color_gui = '#09AA08'
" let g:indentLine_char = '│'
let g:neocomplete#enable_at_startup = 1

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
syn region foldImports start=/\(^\s*\n^import\)\@<= .\+;/ end=+^\s*$+ transparent fold keepend

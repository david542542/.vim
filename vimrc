"Stylistic
syntax on
colorscheme TextMate
set background=dark
set number

"Mouse
set mouse=a

"Don't bother with .swp files and the like
set nobackup
set nowritebackup
set noswapfile

"Search-related items
set incsearch
set ignorecase

"Tab-related items
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

"Miscellaneous items
set backspace=indent,eol,start
set splitbelow
set splitright
set ve+=onemore "allows us to go one-past the last character, emulating ctrl-e in normal programs
set belloff=all
set showcmd
filetype plugin on
filetype on " detect type of file
set textwidth=0 "disable auto-wrap

"Allow backspace to act like it does in insert mode)
nnoremap <expr> <Backspace> col('.') == 1 ? 'kgJ' : 'X'

"Load plugins
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'alvan/vim-closetag'
call plug#end()

" Plugin related
let g:airline_theme='angr'
let g:fzf_layout = { 'down': '~30%' }
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+' "By default, don't show hidden files
noremap <silent> <Leader><Leader> :Files <C-R>=expand('%:h')<CR><CR>
noremap <silent> <Leader>] :Vex<CR>
let g:NERDSpaceDelims = 1

"backspace will delete a char when in cmd mode (the character to the left of the cursor)
cnoremap <c-a> <Home>

"Move selected blocks easily when in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<cr>gv=gv

"Indent and dedent, especially in visual mode
nnoremap <leader>( >>
nnoremap <leader>* <<
inoremap <leader>( <C-O>>>
inoremap <leader>* <C-O><<
vnoremap <leader>( >gv
vnoremap <leader>* <gv

"When in normal mode, treat an enter like insert
:nmap <leader>&  O
:nmap <CR> i<CR>

"
:imap <leader>c<space> <Esc><Leader>c<space>i
:imap <Esc> <Esc>`^
:inoremap ˙ <C-O>b
:nnoremap ˙ b
:inoremap ¬ <C-O>e<C-O>l
:nnoremap ¬ el
:inoremap ˚ <C-O>k<C-O>
:nnoremap ˚ k
:inoremap ∆ <C-O>j<C-O>
:nnoremap ∆ j

"Simulate ctrl-a, ctrl-e to go to start/end of line
:inoremap <C-a> <Esc>0i
:inoremap <C-e> <Esc>$li
:nnoremap <C-a> 0
:nnoremap <C-e> $l
:vnoremap <C-a> 0
:vnoremap <C-e> $l
":nnoremap <C-a><C-l> ^
"Command-Shift-T: open new window (on the right by default)
    "Done in iTerm2


" "Ctrl-jk to move up/down by a block -- '{' and '}' (will do hl as well to just move to the start/end of the line)
" -- h
:nmap <C-h> b
:imap <C-h> <C-O>h
:vmap <C-h> b

" -- J 
:nmap <C-j> }
:imap <C-j>  <C-O>j
:vmap <C-j> }

" -- K (currently not working??)
nmap <C-k> {
imap <C-k> <C-o>k
vmap <C-k> {

" -- L
:nmap <C-l> el
:imap <C-l> <C-O>l
:vmap <C-l> e

"Allow ctrl-d, ctrl-u to go down/up page in Insert mode
:imap <C-d> <C-O><C-d>
:imap <C-u> <C-O><C-u>
" -- J (why does this need to be recursive?)

" -- search (command-F sent as <leader>F), shift-command-f to get search history
:nmap <leader>f /
:imap <leader>f <C-O>/
:vmap <leader>f /
:nmap <leader>F q/
:imap <leader>F <C-O>q<C-O>/
:vmap <leader>F q/


"Set up the shell and allow toggling of the Karabiner CAPS key
"Should put this python script in the vim folder
set shell=bash\ -l
set timeoutlen=400 ttimeoutlen=10

"To encourage not using the arrow keys
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

"For the up-arrow we'll allow getting the last command (do the same for command-e)
nnoremap <Up> :<Up>
nnoremap <leader>- :
    
"And for command-shift-e we'll show the previous command history
nnoremap <leader>+ q:
inoremap <leader>+ <C-O>q <C-O>:
vnoremap <leader>+ q:


inoremap <leader>- <C-O>:
vnoremap<leader>- :



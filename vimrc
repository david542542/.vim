syntax on
colorscheme OceanicNext
set background=dark

set number

" Don't bother with .swp files and the like
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
            
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'
call plug#end()

filetype plugin on
let g:NERDSpaceDelims = 1
" let g:netrw_browse_split = 4


vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<cr>gv=gv


"theme-related items


" :vnoremap J j
" :vnoremap K k
:imap <leader>c<space> <Esc><Leader>c<space>i
:nnoremap <CR> i<CR>
:imap <Esc> <Esc>`^
:inoremap ˙ <C-O>b
:nnoremap ˙ b
:inoremap ¬ <C-O>e<C-O>l
:nnoremap ¬ el
:inoremap ˚ <C-O>k<C-O>
:nnoremap ˚ k
:inoremap ∆ <C-O>j<C-O>
:nnoremap ∆ j

:vnoremap ∆ j
:vnoremap ˚ k
:vnoremap ¬ el
:vnoremap ˙ b

"Simulate option-shift arrow keys to highlight chunks of text
:vnoremap Ó b
:vnoremap Ò el
:vnoremap Ô j
:vnoremap  k

:nnoremap Ó <Esc>vb
:nnoremap Ò <Esc>vel
:nnoremap Ô <Esc>vj
:nnoremap  <Esc>vk

:inoremap Ó <Esc>vbl
:inoremap Ò <Esc>vel
:inoremap Ô <Esc>vj
:inoremap  <Esc>vk

"Simulate ctrl-a, ctrl-e to go to start/end of line
:inoremap <C-a> <Esc>0i
:inoremap <C-e> <Esc>$li
:nnoremap <C-a> 0
:nnoremap <C-e> $l
:vnoremap <C-a> 0
:vnoremap <C-e> $l



"Command-hjkl to to start/end of line/file
" -- h
:nnoremap <leader>H 0
:inoremap <leader>H <C-O>0
:vnoremap <leader>H 0

" -- j
:nnoremap <leader>J G
:inoremap <leader>J <C-O>G
:vnoremap <leader>J G

" -- k
:nnoremap <leader>K gg
:inoremap <leader>K <C-O>gg
:vnoremap <leader>K gg

" -- l
:nnoremap <leader>L $l
:inoremap <leader>L <C-O>$ 
:vnoremap <leader>L $


"Shift-Command-hjkl to highlight to start/end of line/file
" -- H 
:nmap <leader>Y v0
:imap <leader>Y <C-O>v <C-O>0
:vmap <leader>Y 0

" -- L
:nmap <leader>O v$
:imap <leader>O <C-O>v <C-O>$ 
:vmap <leader>O $

" -- J
:nmap <leader>U vG
:imap <leader>U <C-O>v <C-O>G
:vmap <leader>U G

" -- K
:nmap <leader>I vgg
:imap <leader>I <C-O>v <C-O>g
:vmap <leader>I gg


"Command-Shift-T: open new window (on the right by default)
"Done in iTerm2

" "Ctrl-jk to move up/down by half a page (will do hl as well to just move to the start/end of the line)
" -- h
:nmap <leader>B 0
:imap <leader>B <C-O>0
:vmap <leader>B 0

" -- J (why does this need to be recursive?)
:nmap <leader>N <C-d>
:imap <leader>N <C-d>
:vmap <leader>N <C-d>

" -- K
:nmap <leader>M <C-u>
:imap <leader>M <C-u>
:vmap <leader>M <C-u>

" -- L
:nmap <leader>. $l
:imap <leader>. <C-O>$
:vmap <leader>. $

"Shift-Ctrl-jk to move up/down by half a page and highlight 
" -- H
:nmap <leader>AB v0
:imap <leader>AB <C-O>v <C-O>0
:vmap <leader>AB 0

" -- J (why does this need to be recursive?)
:nmap <leader>BB v<C-d>
:imap <leader>BB <C-O>v <C-d>
:vmap <leader>BB <C-d>

" -- K
:nmap <leader>CB v<C-u>
:imap <leader>CB <C-O>v <C-u>
:vmap <leader>CB <C-u>

" -- L
:nmap <leader>DB v$l
:imap <leader>DB <C-O>v<C-O>$
:vmap <leader>DB $


"Allow ctrl-d, ctrl-u to go down/up page in Insert mode
:imap <C-d> <C-O><C-d>
:imap <C-u> <C-O><C-u>
" -- J (why does this need to be recursive?)

" -- search (command-F sent as <leader>F)
:nmap <leader>F /
:imap <leader>F <C-O>/
:vmap <leader>F /


"Set up the shell and allow toggling of the Karabiner CAPS key
"Should put this python script in the vim folder
set shell=bash\ -l
set timeoutlen=10 ttimeoutlen=0

"To encourage not using the arrow keys
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

"Stylistic
syntax on
colorscheme TextMate "OceanicNext
set background=dark
set number
set cursorline
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"Ability to toggle between two themes, especially helpful for json,xml
nnoremap <expr><silent><leader>2 printf(':colorscheme %s<CR>',
    \ g:colors_name !=# 'OceanicNext' ? 'OceanicNext' : 'Textmate')

"Mouse
set mouse=a

"Don't bother with .swp files and the like
set nobackup
set nowritebackup
set noswapfile

"Search-related items
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <esc><esc> :noh<return>

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
set viminfo='1000,f1 "same markers

"Allow backspace to act like it does in insert mode)
nnoremap <expr> <Backspace> col('.') == 1 ? 'kgJ' : 'X'

"Load plugins
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'majutsushi/tagbar'
call plug#end()

" Plugin related
let g:airline_theme='term_light'
let g:fzf_layout = { 'down': '~30%' }
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+' "By default, don't show hidden files
let g:NERDSpaceDelims = 1

"Move easily when in visual mode (Cmd-j,k)
vnoremap <leader>k :m '<-2<cr>gv=gv
vnoremap <leader>j :m '>+1<CR>gv=gv


"Indent and dedent especially in visual mode (cmd-[,])
nnoremap <leader>( >>
nnoremap <leader>* <<
inoremap <leader>( <C-O>>>
inoremap <leader>* <C-O><<
vnoremap <leader>( >gv
vnoremap <leader>* <gv

"Simulate ctrl-a, ctrl-e to go to start/end of line
:inoremap <C-a> <Esc>0i
:inoremap <C-e> <Esc>$li
:nnoremap <C-a> 0
:nnoremap <C-e> $l
:vnoremap <C-a> 0
:vnoremap <C-e> $l
:cnoremap <c-a> <Home>

"ctrl-s to go to first letter
:inoremap <leader>s <Esc>^i
:vnoremap <leader>s ^
:nnoremap <leader>s ^

"When in normal mode, treat an Enter/Return like insert
:nmap <CR> i<CR>

"Tidy document by doing Shift-ctrl-h, like Textmate (note: this is passed by iTerm2, since vim cant do ctrl-shift-letter)
:noremap <leader>h  :Autoformat<CR>

"Ctrl-w,b in insert/command mode to go forward/back a word
:imap <C-b> <C-O>b
:imap <C-w> <C-O>w
:cmap <C-b> <S-Left>
:cmap <C-w> <S-Right>

" ctrl-h,j,k,l to go up/down by a block
:nmap <C-h> b
:imap <C-h> <C-O>h
:vmap <C-h> b
:cmap <C-h> <Left>

:nmap <C-j> }
:imap <C-j>  <C-O>}
:vmap <C-j> }

:nmap <C-k> {
:imap <C-k> <C-o>{
:vmap <C-k> {

:nmap <C-l> el
:imap <C-l> <C-O>l
:vmap <C-l> e
:cmap <C-l> <Right>

"Allow ctrl-d to delete the forward character when in insert/command mode
:imap <C-d> <Del>
:cmap <C-d> <Del>

" -- search (command-F sent as <leader>F)
:nmap <leader>f /
:imap <leader>f <C-O>/
:nmap <leader>g /<Up>
:imap <leader>g <C-O>/<Up>

"Set up the shell
set shell=bash\ -l
set timeoutlen=200 ttimeoutlen=1

" For the up-arrow we'll allow getting the last command (do the same for command-e)
nnoremap <Up> :<Up>

" When pressing escape don't creep backwards
:imap <Esc> <Esc>`^

" NerdCommenter -- comment/uncomment a line (iTerm2 mapping -- Cmd-/)
:nmap <leader>X <leader>c<space>
:imap <leader>X <Esc><leader>c<space>
:vmap <leader>X <leader>c<space>gv

" Toggle the line number for  copy/paste: https://stackoverflow.com/a/61952187/651174
function! MagicNumberToggle() abort
    if &nu + &rnu == 0
		set nopaste
        let &nu = g:old_nu
        let &rnu = g:old_rnu
		exe "normal! l\<esc>"
    else
		set paste
        let g:old_nu = &nu
        let g:old_rnu = &rnu
        let &nu = 0
        let &rnu =0
    endif
endfunction
:nmap <leader>Z :call MagicNumberToggle()<cr>


" Cmd-C (from iTerm2) will act as a yank when in visual mode (and go to end of previous visual selection)
:vnoremap <leader>5 "*y`]

"Tagbar
nmap <F8> :TagbarToggle<CR>



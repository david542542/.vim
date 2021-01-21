
" Style {{{1

" TextMate with `background=dark` is the closest I've found to emulating Mac's TextMate
colorscheme TextMate "OceanicNext
set background=dark

" Required for the colorscheme and theme to work
syntax on

" By default we will use absolute and relative numbers, we can also toggle this, for example for copy/pastes
set number
set rnu

" Highlight the line of the cursor. Makes it a bit easier to find where the cursor is with no mouse.
set cursorline

" Set how wide left column that contains the line numbers is
set numberwidth=4

" To allow setting of highlight-guifg and highlight-guibg for custom styling (of python)
" If setting this option does not work (produces a colorless UI) reading *xterm-true-color* might help.
" note: without the &t_8f and &t_8b, tmux produces an all-black output
set termguicolors
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Use bash as the default shell syntax, related to: https://vi.stackexchange.com/a/26450/28904
let g:is_bash = 1


" Folding {{{1

" For the vim/vimrc filetype, allow manual folding via {{{ ... }}}
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Save and restore manual folds when we exit a file
" note: this will also save mappings and abbreviations and such, be careful!
" augroup SaveManualFolds
" autocmd!
" au BufWrite,VimLeave,BufLeave,BufWinLeave       ?*  mkview
" au BufWinEnter,BufRead                          ?*  loadview
" augroup END

" Consistency for Manual folds (previously was different on Mac vs Linux)
" Default is '+-- XX lines: WORD '
" function ManualFoldText()
    " let line = trim(getline(v:foldstart))
    " let line = split(line, '{{')[0]->trim(' "')
    " return printf('+--%3s lines: %s ', v:foldend - v:foldstart, line)
" endfunction
" set foldtext=ManualFoldText()


" Search {{{1

" Search-as-I type. Note this option still requires pressing [enter] (why?) to execute the search
set incsearch

" This will perform a case insensitive search when search is all lowercase
" To force a case-sensitive search, do /\C<search>
set ignorecase

" When there is a capital letter, this will perform a case-sensitive search.
set smartcase

" Highlight search matches, using an `if` so it doesn't keep getting re-set if we re-source vimrc
" See: https://vi.stackexchange.com/a/8742/28904 for details
" Press esc twice to quickly turn off the highlighting search results
" Highlighted search disabled for now, getting too annoying
" if !&hlsearch | set hlsearch | endif
" nnoremap <esc><esc> :noh<return>

" Backups {{{1

" Never write backup or tmp files.
set nowritebackup
set noswapfile

" Spacing {{{1

" Copy indent from current line when starting a new line. Somtimes overriden by a particular filetype.
set autoindent

" Basically, never use tabs in insert mode. If a tab is entered, expand that with <tabstop> number of spaces.
set expandtab
set tabstop=4

" When indenting with '>>' or '<<', add in [shiftwidth] number of spaces (should be same as tabstop)
set shiftwidth=4

" When on a partial shiftwidth (2) go to the next full shiftwidth (4) instead of doing a full shiftwidth (6)
" This is behavior that emulates how TextMate works
set shiftround

" Text will be wrapped after this number of columns, can be annoying when writing long comments
set textwidth=120

" For very long lines such as a static mapping), do not wrap those lines:
set nowrap
" Miscellaneous {{{1

" The audio bell becomes quite annoying on save and such
set belloff=all

" The vimfile which gives us a few options on startup, for example to save markers or not, :h *'viminfo'*
" Note the viminfo file is saved when you quit Vim and read when you re-open it
" '100  --> Save markers from the last 100 files
" f1    --> Save file marks (such as A-Z, that can be accessed across files)
set viminfo='100,f1,n~/.vim/viminfo
" Will show what has been typed in before a command has finished, for example, 4d
set showcmd

" Split default on :vs will go on the right and on :sp will go below
set splitbelow
set splitright

" Allow the cursor to move one-past the last character,
" Similar to any other text-editor and helpful for ctrl-e. See `:h onemore`
set ve+=onemore

" Vim will try and detect the type of file being edited, which will trigger the FileType event,
" which can be used to set syntax highlighting, file-specific, options, etc. :h filetype
filetype on
filetype plugin on

" Allow the mouse to be used in all modes except command-line mode.
" Very useful for resizing split windows and such. :h mouse
set mouse=nvi

" The time that is waited for a mapped code to wait for the next keystroke,
" for example if ii is mapped, if `i` is pressed, wait 80ms before going into `insert` mode if `i` is not pressed again.
set timeoutlen=120 ttimeoutlen=20

" Do not auto-wrap comments and don't insert comments when pressing o/O. See: :h *fo-table* and :h *'formatoptions'*
" set formatoptions-=cro
autocmd Filetype * set formatoptions-=cro

" Allow backspace to actually delete things in insert mode (one of the strangest default behaviors otherwise). See :h *'backspace'
set backspace=indent,eol,start

" Allow very high level of Undo
set undolevels=5000


" }}}
" Plugins {{{1
call plug#begin('~/.vim/plugged')

" Easy-motion: https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

" Vim-airline: status-bar for vim: https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'tpope/vim-fugitive'

" Fuzzy-File Finder, cmd-G to easily open recent files: https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Autoformat xml, json, python files with shortcut key: https://github.com/Chiel92/vim-autoformat
Plug 'Chiel92/vim-autoformat'

"" Surround, helpful for html tags and quoting, especially: https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Commenter, for cmd-/ shortcut to comment/uncomment lines: https://github.com/preservim/nerdcommenter
Plug 'preservim/nerdcommenter'

" NerdTree, to simplify file nagivation: https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'

" TagBar -- show ctags (functions and classes) on the right: https://github.com/majutsushi/tagbar
" note: we may want to delete this plugin, as not sure how useful it really is in everyday usage
Plug 'majutsushi/tagbar'

" Python text objects: https://github.com/jeetsukumaran/vim-pythonsense
Plug 'jeetsukumaran/vim-pythonsense'


" Better matching parentheses and such: https://github.com/Raimondi/delimitMate 
Plug 'Raimondi/delimitMate'


" UtiliSnips to add code-snippets: https://github.com/SirVer/ultisnips
" For whatever reason, not working/compiling with python version 3.4
if has('python3') && (py3eval('sys.version_info')[2] >= 7)
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    let snips_installed = 1
else
    let snips_installed = 0
endif


call plug#end()
"}}}
" Plugin-Settings {{{1

" Easy-Motion: Enter in two chars and then a label to jump there.
" Also allow entering in a single char and pressing <Space> to search for that
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)
augroup EZMotion
   autocmd!
   autocmd VimEnter * EMCommandLineNoreMap <Space> <CR>
augroup END

" Fuzzy Files Finder folders to search. This is mapped with iTerm2 to Cmd-G.
" The `:Files` command executes $FZF_DEFAULT_COMMAND by default, see: https://github.com/junegunn/fzf#environment-variables
let home = isdirectory(expand('~/Desktop')) ? '~/Desktop' : '/home/ubuntu'
let ALL_FOLDERS     =   [home . '/Ingest', home . '/Avails', home . '/Eidr', '~/.vim', home, home. '/Metadataorder']
let VALID_FOLDERS   =   []

for folder in ALL_FOLDERS
    if isdirectory(expand(folder))
        call add(VALID_FOLDERS, folder)
    endif
endfor
let $FZF_DEFAULT_COMMAND = printf("find %s ! -path '*site-packages/*' ! -path '*.git/*' ! -name '*.pyc'
            \ -maxdepth 5 -type f", ' '.join(VALID_FOLDERS))
unlet home | unlet ALL_FOLDERS | unlet VALID_FOLDERS

" How much space FZF will take, this sets it to take up the bottom 1/3
let g:fzf_layout = {'down': '~30%'}

" UtiliSnips -- Open in a new tab when we do :UltiSnipsEdit
let g:UltiSnipsEditSplit="tabdo"

" Tab and shift-tab will go to next/prev placeholder
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Set the Status bar ('airline') theme
let g:airline_theme='term_light'

" NerdTree settings: see https://github.com/preservim/nerdcommenter#usage
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Override default assembly comments, from https://vi.stackexchange.com/a/26957/28904
let g:NERDCustomDelimiters = {
    \ 'asm': { 'left': '#', 'leftAlt': ';' }
    \ }

" ** Tagbar ** 
" <Enter>, p        - go to place in code (p stays in Tagbar)
" ctrl-n, ctrl-p    - go to next/previous top-level section
" o                 - toggle fold
" When opening tagbar, move cursor to it
let g:tagbar_autofocus = 1
" Sort by the order in the file (not alphabetically)
let g:tagbar_sort = 0
" Show line numbers (0 = none, 1 = absolute, 2 = relative)
" note: this doesn't work well and is often overwritten by rnu settings
let g:tagbar_show_linenumbers = 1
" Tagbar width
let g:tagbar_width = 40

" ** Nerdtree ** 
" o/O       -- Open/close a folder (Xo close-all recursively)
" u/U       -- Go up a folder
" m         -- Show menu (to add, delete, rename files or folders)
" C         -- Go into directory and make it the cd
let NERDTreeShowLineNumbers=1


"}}}
" Abbreviations/Snippets {{{1

" These are handled by UltiSnips, but included here for reference.
" [python]
"    - py --> expands to #!/usr/bin...# coding: utf-8
" [vim]
"   - log --> expands to call LogOutput(...)

" Consume character after abbreviation typed in can be done with *getchar*
" View the section on *abbreviations* (five have-pages down is 'func Eatchar()')
" A negative index always results in an empty string (for backward compatibility), see :h *expr-[]*
if !snips_installed
    augroup VimLogger
        autocmd!
        autocmd Filetype vim iabbrev <buffer> log call LogOutput(*, "DEBUG", {'line': expand('<sflnum>'), 'func': expand('<sfile>')[9:]})
                    \ <C-c>F*cl<C-R>=getchar(0)[-1]<CR>
    augroup END
endif

" Mappings {{{1

" Cmd-Shift-C to Copy (send to pbcopy) in visual mode
" note: this works on ENTIRE lines, not good for partial lines, see: https://stackoverflow.com/a/9449010/651174
nnoremap    <leader>C   <nop>
"vnoremap   <silent> <leader>C   :w! !pbcopy<CR><CR>
vnoremap    <silent> <leader>C   :w! !it2copy<CR><CR>'>0



" Cmd-R to run a C program
nnoremap <Leader>2R <C-w>wR<CR><C-w>w
inoremap <Leader>2R <C-o><C-w>wR<CR><C-w>w

" SHift-cmd-G to update git generically
nnoremap <Leader>2G    :w!<CR>:silent !cd %:p:h && git commit -am 'updates' && git push origin master && cd -<CR>:redraw!<CR>
inoremap <Leader>2G    <Esc>:w!<CR>:silent !cd %:p:h && git commit -am 'updates' && git push origin master && cd -<CR>:redraw!<CR>
" :!cd %:p:h && git add %:t && git commit -m 'message' && git push origin master && cd -
" t add %:t && git commit -m 'message' && git push origin master && cd -
" Ctrl-opt-cmd-F to fold a python function
" note: this uses vim-pythonsense: 'af' for 'a function', 'ac' for class
" ]m and [m to go to previous and next python function
nmap   <Leader>1F   Vafzf


" Ctrl-Delete to delete a full WORD backwards
inoremap    <Leader>1D <C-o>dB

" Opt-d to delete a full WORD forwards
inoremap    <Leader>1d <C-o>dW



" Up arrow to go to last command
" nnoremap    <Up>    :<C-p>

"

" Matching HTML tags
augroup MatchingTags
    autocmd!
    autocmd Filetype html,htmldjango,xml inoremap <  <><Left>
augroup END


" Matching quotes
" let FT_IGNORE_QUOTES = ['vim', 'markdown', 'help']
" autocmd Filetype * if index(FT_IGNORE_QUOTES, &filetype) == -1 | inoremap <buffer> '  ''<Left>| endif
" autocmd Filetype * if index(FT_IGNORE_QUOTES, &filetype) == -1 | inoremap <buffer> "  ""<Left>| endif

" syntax highlighting for log files
autocmd bufnewfile,bufread *.log set syntax=logtalk

" tail files with command :tail and shortcut Ctrl-t
function _Tail()
    set ut=250
    set autoread | au cursorhold * checktime | call feedkeys("G")
endfunction
command! Tail call _Tail()
cnoreabbrev tail Tail
nnoremap <C-t> :Tail<CR>

" function CheckIfBlank()
    " " Make sure we've properly indented if going up/down a line and that line is empty
    " if getline('.') =~ '^\s*$'
        " normal! S
    " endif
" endfunction
" ** Format as various filetypes **
" Ctrl-Opt-Cmd-X: Format as XML
noremap  <leader>2X <C-c>:set ft=xml<CR>:Autoformat<CR>
noremap! <leader>2X <C-c>:set ft=xml<CR>:Autoformat<CR>

" Ctrl-Opt-Cmd-T: Format as HTML (note: Ctrl-Opt-Cmd-H used for going to previous window)
" note: sometimes we also may way to format it first as XML then HTML for minified indenting
noremap  <leader>2T <C-c>:set ft=htmldjango<CR>:Autoformat<CR>
noremap! <leader>2T <C-c>:set ft=htmldjango<CR>:Autoformat<CR>

" Ctrl-Opt-Cmd-J: Format as JS/JSON
noremap   <expr><leader>2J (&ft== 'json') ?      ':set ft=javascript \| Autoformat<CR>'   : ':set ft=json \| Autoformat<CR>'
noremap!  <expr><leader>2J (&ft== 'json') ? '<C-c>:set ft=javascript \| Autoformat<CR>'   : '<C-c>:set ft=json \| Autoformat<CR>'

" Ctrl-Opt-Cmd-P: Format as Python
noremap  <leader>2P <C-c>:set ft=python<CR>:Autoformat<CR>
noremap! <leader>2P <C-c>:set ft=python<CR>:Autoformat<CR>



"Cmd-w to quit things
noremap  <leader>W      :q!<CR>
noremap! <leader>W <C-c>:q!<CR>


" Cmd-o to open a file
noremap  <leader>O      :e! <C-r>=getcwd()<CR>/
noremap! <leader>O <C-c>:e! <C-r>=getcwd()<CR>/


" S to go to the proper indent in normal mode
nnoremap <expr> S   (getline('.') =~ '\S') ? 'S' : '"_ddko'


" Shift-cmd-h to view :History of files
nnoremap <leader>2H     :History<CR>
inoremap <leader>2H     <C-o>:History<CR>

" Cmd-h,l to move between vim tabs
noremap  <leader>1H      gT
noremap! <leader>1H <C-c>gT
noremap  <leader>1L      gt
noremap! <leader>1L <C-c>gt


" Cmd-Z, Cmd-Shift-Z to undo/redo
nnoremap <leader>Z u
inoremap <leader>Z <C-o>u
nnoremap <leader>ZZ <C-r>
inoremap <leader>ZZ <C-o><C-r>


" Cmd-G to open FuzzyFilesFinder
noremap  <leader>G :Files<CR>
noremap! <leader>G <C-C>:Files<CR>


" Cmd-K to open URL in default browser
" Note that <C-R> allows us to add in things like <C-F> (filepath), <C-W> (word), <C-A> (WORD). See :h c_CTRL-R
nnoremap <leader>K :execute 'silent !open' fnameescape(expand('<cfile>')) \| redraw!<CR>


" Cmd-[,] to Ident/Dedent -- change the level of indent so consistent in each mode
inoremap <leader>]   <C-T>
inoremap <leader>[   <C-D>
nnoremap <leader>]   i<C-T><Esc>`[
nnoremap <leader>[   i<C-D><Esc>`[
vnoremap <leader>]   >gv
vnoremap <leader>[   <gv


" Cmd-/ to comment/uncomment with NERDCommenter
" todo: (line_has_comment) ? '<leader>csgv' : '<leader>cugv'
nmap  <leader>/ <Plug>NERDCommenterToggle
vmap  <leader>/ <Plug>NERDCommenterToggle gv
imap  <leader>/ <C-O><Plug>NERDCommenterToggle

" Tagbar
nnoremap <leader>M :TagbarToggle<CR>
inoremap <leader>M <C-o>:TagbarToggle<CR>
vnoremap <leader>M <Esc>:TagbarToggle<CR>gv

" NERDTree
noremap  <leader>1N      :NERDTreeToggle<CR>
noremap! <leader>1N <Esc>:NERDTreeToggle<CR>
" Open NERDTree and go to the directory of the existing file
noremap  <leader>1O      :NERDTreeFind<CR>zz
noremap! <leader>1O <Esc>:NERDTreeFind<CR>zz

" "-->`   Map linewise-mark ' to instead characterwise-mark `
nnoremap ' `


" Ctrl-a, e to go to start/end of line
" note: we can use *i_CTRL-@* to copy-in last insert text
inoremap <C-a> <C-O>0
noremap  <C-a> 0
cnoremap <C-a> <Home>
inoremap <C-e> <C-O>$
noremap  <C-e> $l


" Ctrl-s (iTerm2) to go to first letter on the line
" note: ctrl-s doesn't work on Mac (stop updating cmd?) so using leader instead
inoremap <leader>c-s <C-o>^
noremap  <leader>c-s ^


" [Enter] -- When in normal mode, treat an Enter/Return like insert
nnoremap <CR> i<CR>


" Ctrl-d to forward-delete when in insert or command mode
" note: we're also 're-mapping' the 0<C-d> to remove all indent in line
" TODO -- figure out how to get the help-suggestions with ctrl-d in command mode!!
noremap! <C-d> <Delete>
inoremap 0<c-d> 0<c-d>


" Ctrl-k to delete all text to right of cursor (dont care about digraphs)
" UPDATE: this is overridden by the ctrl-hjkl movement, so discard this
" inoremap <C-k> <C-o>"_D


" K to Allow reading help keywords between *some_word*, for example, *c_CTRL-R*
nnoremap <expr> K   count(expand('<cWORD>'), '*') == 2 ?
    \ printf(':h %s<CR>', matchstr(expand('<cWORD>'), '\*\zs[^*]\+\ze\*'))
    \ : 'K'


" Y so that it works like the C and D equivalents to yank text to the end of the line. See :h Y
" Note that we do allow this one (unlike all the others) to be recursive)
nnoremap Y y$`[

" Y,y in visual-line mode should also make the cursor jump to the bottom of selection
vnoremap <expr> Y (mode() ==# 'V') ? "y']" : "y"
vnoremap <expr> y (mode() ==# 'V') ? "y']" : "y"


" When pressing escape don't creep backwards -- because <Esc> on lhs, need to re-map arrows-prefix
inoremap <Esc>  <Esc>`^
inoremap <Esc>0 <Esc>0


" Cmd-F to enter into an empty search
" Cmd-Shift-F to enter into search with most recent search
noremap  <leader>F  <C-c>/
noremap! <leader>F  <C-c>/
noremap  <leader>FF <C-c>/<C-r>/
noremap! <leader>FF <C-c>/<C-r>/


" Cmd-E to enter into command mode
" Cmd-Shift-E to enter into command mode with most recent command
noremap  <leader>E  <C-c>:
noremap! <leader>E  <C-c>:
noremap  <leader>EE <C-c>:<Up>
noremap! <leader>EE <C-c>:<Up>


" Cmd-A to select all, sending A instead of a from iTerm (sending some odd escape)
noremap  <leader>A <esc>ggVG
inoremap <leader>A <esc>ggVG


" h,j,k,l to move in insert and command mode (ignore jk for command-line since one-line)
noremap! <C-h> <Left>
noremap! <C-l> <Right>

function CheckIfBlank()
    " Make sure we've properly indented if going up/down a line and that line is empty
    if getline('.') =~ '^\s*$'
        normal! S
    endif
endfunction
inoremap <C-j>  <Down><C-o>:call CheckIfBlank()<CR>
inoremap <C-k>  <Up><C-o>:call CheckIfBlank()<CR>


" Option-h,l to go forward/back a word (also allow it in normal mode -- override the H, L)
" Option-right,left also mapped to same thing, to go forward/back a word in command-mode
" note: command-line and insert-mode have different defaults for S-Right, so need to fix
noremap  <leader>H <S-Left>
noremap! <leader>H <S-Left>
noremap  <leader>L <S-Right>
cnoremap <leader>L <S-Right>
inoremap <leader>L <C-o>e<Right>


" Cmd-R or Cmd-Space to execute a command in command-line mode
cnoremap <leader>R <CR>


" Cmd-Opt-n to change the colorscheme
noremap  <expr> <leader>NN (g:colors_name ==? 'textmate') ? ':colorscheme OceanicNext<CR>' : ':colorscheme TextMate<CR>'
noremap! <expr> <leader>NN (g:colors_name ==? 'textmate') ? '<C-o>:colorscheme OceanicNext<CR>' : '<C-o>:colorscheme TextMate<CR>'


" Cmd-Opt-Ctrl-n to toggle the relative line numbers
noremap  <leader>N :set rnu!<CR>
noremap! <leader>N <C-c>:set rnu!<CR>


" Default filetype, color if unrecognized (like a text file to write notes)
function IsHelpFile()
    if getline('$') !~? 'vim'
        set filetype=markdown
        colorscheme OceanicNext
    endif
endfunction
augroup DefaultFiletype
    autocmd!
    autocmd BufEnter *.txt call IsHelpFile()
augroup END


" K for a vim help file to go to that topic, normally ctrl-]
augroup VimHelpFile
    autocmd!
    autocmd Filetype help noremap <buffer> K <C-]>
    autocmd Filetype help noremap <buffer> <CR> <C-]>
augroup END


" Ctrl-K to delete text to the end of the line in command-line mode
" see: *c_CTRL-\_e*, *getcmdline()*, and *getcmdpos()*
cnoremap <C-k> <c-\>egetcmdline()[:getcmdpos()-1]<CR>


" Option-space as &nbsp; in html
augroup HTML
    autocmd!
    autocmd FileType html,htmldjango inoremap <buffer> <leader><space> &nbsp;
augroup END


" Opt-Cmd-. to autocomplete tags, especially HTML, see *i_CTRL-X_CTRL-O*
function Autocomplete()
    " See :h *complete-functions* for how to use the omni-complete
    " note: the following function is geared towards HTML
    let idx = htmlcomplete#CompleteTags(1, '')
    let completion = htmlcomplete#CompleteTags(0, idx)[0]
    if completion != '>'
        execute ('normal!i' . completion)
    else
        normal! XX
    endif
endfunction
inoremap <leader>.  </<C-O>:call Autocomplete()<CR><Right>
nnoremap <leader>. i</<C-O>:call Autocomplete()<CR><Esc><Right><Right>


" Ctrl-w will do the usual 'window-mode' instead of deleting previous word in insert mode
inoremap <C-w> <C-o><C-w>



" Opt-` or Cmd-` are used to copy-paste text in, removing line numbers.
" This is primarily because on remote machines, iTerm2 needs to copy to local Machine with opt-select
" Alternately can use the below `pastetoggle`, as insert mode in paste mode will not map!
" imap <leader>` <nop>
" set pastetoggle=<leader>`
function ToggleCopyState()
    " We determine all by whether we have line-numbers or not
    " Number is always 1, it's only RelativeNumber that can be on or off
    let has_line_number = &number + &relativenumber > 0
    if has_line_number
        echom 'entering paste mode'
        let b:previous_rnu = &relativenumber
        set nonumber
        set norelativenumber
        set paste
    else
        set number
        let &rnu = b:previous_rnu
        echom 'exiting paste mode'
        set nopaste
    endif
endfunction
noremap <leader>`   :call ToggleCopyState()<CR>
" Cmd-Shift-V to paste via "*p to speed up large inserts in iTerm2 (only will work locally)
nnoremap <leader>V "*p
inoremap <leader>V <C-o>"*p


" Cmt-t to open a a new tab within vim
noremap  <leader>T :tabe<CR>
noremap! <leader>T <C-c>:tabe<CR>


" Cmd-s to save, if a new file, prompt for the name
function SaveFile() abort
    " If the filename doesn't exist, prompt the use to enter one
    if len(expand('%')) == 0
        execute 'w ' . input('Save File As: ')
    else
        " Note: cannot resource this vim file from within a function
        w
    endif
endfunction

nnoremap   <silent> <leader>S               :call SaveFile()<CR>
vnoremap   <silent> <leader>S          <C-c>:call SaveFile()<CR>gv
inoremap   <silent> <leader>S          <C-c>`^:call SaveFile()<CR>i
cnoremap   <silent> <leader>S          <C-c>:call SaveFile()<CR>


" Shift-Cmd-s to save and resouce a vim file
noremap  <silent> <expr> <leader>1S (&filetype ==? 'vim') ? ':w \| silent so %<CR>' : ''
noremap! <silent> <expr> <leader>1S (&filetype ==? 'vim') ? '<C-c>:w \| silent so %<CR>' : ''


" With relative numbering, see if ( or ) helps with efficiency?
nnoremap    <expr> (    (v:count == 0) ? '(' : 'k'
nnoremap    <expr> )    (v:count == 0) ? ')' : 'j'


" }}}
" Helpers {{{1

" Log autocmd events to our logFile
function ToggleEventLogger(events=[])
    " Three examples:
    "   ToggleEventLogger() --> will turn off event logging
    "   ToggleEventLogger(['BufEnter', 'BufLeave']) --> show log for those two events only
    "   ToggleEventLogger('*') --> log ALL events
    " NOTE: great answer to filter out particual dangerous events: https://vi.stackexchange.com/a/26241/28904
    let all_valid_events = getcompletion('', 'event')
    let events = []
    if type(a:events) == type([])
        for e in a:events
            " if item in list   --> index(list, item) != -1
            " list.append(item) --> add(list, item)
            if (all_valid_events->index(e) != -1)
                call add (events, e)
            endif
        endfor
    else
        let events = all_valid_events
    endif
    augroup EventLogger
        autocmd!
        for event in events
            exe printf('autocmd %s * silent call LogOutput("%s")', event, event)
        endfor
    augroup END
endfunction


" }}}

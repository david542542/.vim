
" Style {{{1

" TextMate with `background=dark` is the closest I've found to emulating Mac's TextMate
colorscheme TextMate "OceanicNext
set background=dark

" Required for the colorscheme and theme to work
syntax on

" By default we will use absolute numbers, we can also toggle this, for example for copy/pastes
set number

" Highlight the line of the cursor. Makes it a bit easier to find where the cursor is with no mouse.
set cursorline

" Set how wide left column that contains the line numbers is
set numberwidth=4

" To allow setting of highlight-guifg and highlight-guibg for custom styling (of python)
" If setting this option does not work (produces a colorless UI) reading *xterm-true-color* might help.
set termguicolors

" Folding {{{1

" For the vim/vimrc filetype, allow manual folding via {{{ ... }}}
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" Save and restore manual folds when we exit a file
augroup SaveManualFolds
    autocmd!
    au BufWinLeave, BufLeave ?* silent! mkview
    au BufWinEnter           ?* silent! loadview
augroup END


" Abbreviations/Snippets {{{1

" These are handled by UltiSnips, but included here for reference.
" [python]
"    - py --> expands to #!/usr/bin...# coding: utf-8
" [vim]
"   - log --> expands to call LogOutput(...)

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
if !&hlsearch | set hlsearch | endif

" Press esc twice to quickly turn off the highlighting search results
nnoremap <esc><esc> :noh<return>

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
set timeoutlen=200 ttimeoutlen=20

" Do not auto-wrap comments and don't insert comments when pressing o/O. See: :h *fo-table* and :h *'formatoptions'*
set formatoptions-=cro


" Allow backspace to actually delete things in insert mode (one of the strangest default behaviors otherwise). See :h *'backspace'
set backspace=indent,eol,start

" }}}
" Plugins {{{1
call plug#begin('~/.vim/plugged')

    " Easy-motion: https://github.com/easymotion/vim-easymotion
    Plug 'easymotion/vim-easymotion'

    " Vim-airline: status-bar for vim: https://github.com/vim-airline/vim-airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'tpope/vim-fugitive'

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
    
    " UtiliSnips to add code-snippets: https://github.com/SirVer/ultisnips
    " For whatever reason, not working/compiling with python version 3.4
    if has('python3')
        pyx vim.command('let python_version="%s"' % sys.version[:3])
        if python_version == '3.7'
            Plug 'SirVer/ultisnips'
            Plug 'honza/vim-snippets'
        endif
    endif

call plug#end()
"}}}
" Plugin-Settings {{{1

" Easy-Motion: Enter in two chars and then a label to jump there.
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-overwin-f2)

" Fuzzy Files Finder folders to search. This is mapped with iTerm2 to Cmd-G.
" The `:Files` command executes $FZF_DEFAULT_COMMAND by default, see: https://github.com/junegunn/fzf#environment-variables
let home = isdirectory(expand('~/Desktop')) ? '~/Desktop' : '/home/ubuntu'
let ALL_FOLDERS     =   [home . '/Ingest', home . '/Avails', home . '/Eidr', '~/.vim', home]
let VALID_FOLDERS   =   []

for folder in ALL_FOLDERS
    if isdirectory(expand(folder)) 
        call add(VALID_FOLDERS, folder)
    endif
endfor
let $FZF_DEFAULT_COMMAND = printf("find %s ! -path '*site-packages/*' ! -path '*.git/*' ! -name '*.pyc'
                                \ -maxdepth 4 -type f -exec ls -t {} +", ' '.join(VALID_FOLDERS))
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


"}}}
" Mappings {{{1

" Cmd-G to open FuzzyFilesFinder
noremap  <leader>g :Files<CR>
noremap! <leader>g <C-C>:Files<CR>


" Cmd-K to open URL in default browser 
" Note that <C-R> allows us to add in things like <C-F> (filepath), <C-W> (word), <C-A> (WORD). See :h c_CTRL-R
nnoremap <leader>k :execute 'silent !open' fnameescape(expand('<cfile>')) \| redraw!<CR>


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
imap <leader>/ <C-O><Plug>NERDCommenterToggle

" "-->`   Map linewise-mark ' to instead characterwise-mark `
nnoremap ' `

" Ctrl-a, e to go to start/end of line
inoremap <C-a> <C-O>0
noremap  <C-a> 0
cnoremap <C-a> <Home>
inoremap <C-e> <C-O>$
noremap  <C-e> $l


" Ctrl-s to go to first letter on the line
inoremap <leader>s <C-O>^
noremap  <leader>s ^


" [Enter] -- When in normal mode, treat an Enter/Return like insert
nnoremap <CR> i<CR>

" Ctrl-d to forward-delete when in insert or command mode
" note: we're also 're-mapping' the 0<C-d> to remove all indent in line
" TODO -- figure out how to get the help-suggestions with ctrl-d in command mode!!
noremap! <C-d> <Delete>
inoremap 0<c-d> 0<c-d>

" Ctrl-k to delete all text to right of cursor (dont care about digraphs)
inoremap <C-k> <C-o>"_D

" }}}

" TO FINISH {{{1

"  "Tagbar
"  nnoremap <leader>m :TagbarToggle<CR>
"  inoremap <leader>m <C-o>:TagbarToggle<CR>
"  vnoremap <leader>m <Esc>:TagbarToggle<CR>gv
"
" "Nerdtree
" "Go up a folder -- u or U (to keep old folder still open)
" "Open/close a folder -- o or O (to open all), Xo (to close all recursively if opened)
" let NERDTreeShowLineNumbers=1
" nnoremap <leader>M :NERDTreeToggle<CR>
" inoremap <leader>M <Esc>:NERDTreeToggle<CR>
" vnoremap <leader>M <Esc>:NERDTreeToggle<CR>
"
" nnoremap <leader>o :NERDTreeFind<CR>C<CR>
" inoremap <leader>o <Esc>:NERDTreeFind<CR>C<CR>
" vnoremap <leader>o <Esc>:NERDTreeFind<CR>C<CR>
"
"
"
" " nnoremap <expr> <Backspace> col('.') == 1 ? 'kgJ' : ''
" " Allow reading help keywords between *some_word*, for example, *c_CTRL-R*
" function MyFunc2() abort
"     let word = trim(expand("<cWORD>"))
"     if count(word, '*') == 2
"         let split_word = word->split('*')
"         let word = len(split_word) == 2 ? split_word[1] : split_word[0]
"         call execute(printf(':h *%s*', word))
"     else
"         normal! K
"     endif
" endfunction
" nnoremap K :call MyFunc2()<CR>
"

" Map Y so that it works like the C and D equivalents to yank text to the end of the line. See :h Y
" map Y y$

" Make it easier to delete from cursor position to the first character, the inverse of C
" TODO -- figure out the correct mapping -- nnoremap B d^i


" function IsNumber(str)
    " return match(a:str, '^\d\+$') != -1
" endfunction

" function FormatInput()

    " try
        " let example_line = getreg('*', 1, 1)[1]
    " catch
        " call LogOutput('Not enough lines -- exiting', "WARNING", {'line': expand('<sflnum>'), 'func': expand('<sfile>')[9:]})
        " return
    " endtry
    " call LogOutput('Example line: ' . example_line, "INFO", {'line': expand('<sflnum>'), 'func': expand('<sfile>')[9:]})

    " " See if its a number or not
    " let terms = split(example_line, '\t')
    " let num_terms = len(terms)
    " call LogOutput("Num terms parsed: " . num_terms, "INFO", {'line': expand('<sflnum>'), 'func': expand('<sfile>')[9:]})
    " if num_terms <= 2

        " normal! "*p
        " '[,']sort

		" " If just one term, convert it to a tuple
        " if num_terms == 1


            " " Whether we parse the item as a number (no quotes) or as a string
            " normal! '[V']J
            " if IsNumber(example_line)
                " s/ /,/g
                " execute "normal! i(\<c-o>$)\<esc>V\"*y"
                " call LogOutput("Parsing as num", "INFO", {'line': expand('<sflnum>'), 'func': expand('<sfile>')[9:]})
            " else
                " s/ /","/g
                " execute "normal! i(\"\<c-o>$\")\<esc>V\"*y"
                " call LogOutput("Parsing as string", "INFO", {'line': expand('<sflnum>'), 'func': expand('<sfile>')[9:]})
            " endif

        " " if two terms, parse it into a dict
        " " check if number for each term to see whether we need to quote it
        " else
            " call LogOutput("Parsing as dict", "INFO", {'line': expand('<sflnum>'), 'func': expand('<sfile>')[9:]})
            " let [q1, q2, q3, q4] = ['', '', '', '']
            " hello this is me if !IsNumber(terms[0]) | let [q1, q2] = ['"', '"'] | endif
            " if !IsNumber(terms[1]) | let [q3, q4] = ['"', '"'] | endif
            " let regex = "'[,']" . printf('s/\v([^\t]+)\t(.+)/%s\1%s:%s\2%s,/', q1, q2, q3, q4)
            " execute(regex)
            " '[,'] join
            " execute "normal! i{\<c-o>$}\<esc>V\"*y"
        " endif

    " else
        " call LogOutput("Only one or two terms currently supported.", "INFO", {'line': expand('<sflnum>'), 'func': expand('<sfile>')[9:]})
        " return
    " endif
" endfunc 
" nnoremap <silent> # :call FormatInput()<CR>




" "When in insert mode allow ctrl-w w to go to other window
" inoremap <C-w> <C-o><C-w>

" " ctrl-h,j,k,l to go up/down by a block
" inoremap <C-h> <C-O>h
" cnoremap <C-h> <Left>

" nnoremap <C-j> }
" inoremap <C-j>  <C-O>j

" nnoremap <C-k> {
" inoremap <C-k> <C-O>k

" inoremap <C-l> <C-O>l
" cnoremap <C-l> <Right>

" "Allow ctrl-d to delete the forward character when in insert/command mode
" inoremap <C-d> <Del>
" cnoremap <C-d> <Del>

" " in command mode, have option-arrow keys act like in Terminal
" cnoremap <leader>5 <S-Left>
" cnoremap <leader>6 <S-Right>


" " -- search (command-F sent as <leader>F)
" nnoremap <leader>f /
" inoremap <leader>f <C-O>/
 " When pressing escape don't creep backwards
" inoremap <Esc> <Esc>`^









" " Toggle the line number for  copy/paste: https://stackoverflow.com/a/61952187/651174
" " Vimscript file settings ---- 
" function! MagicNumberToggle() abort
    " if &nu + &rnu == 0
		" set nopaste
        " let &nu = g:old_nu
        " let &rnu = g:old_rnu
		" exe "normal! l\<esc>"
    " else
		" set paste
        " let g:old_nu = &nu
        " let g:old_rnu = &rnu
        " let &nu = 0
        " let &rnu =0
		" exe "normal! h"
    " endif
" endfunction
" nnoremap <leader>Z :call MagicNumberToggle()<cr>
" " 
" " Cmd-C (from iTerm2) will act as a yank when in visual mode (and go to end of previous visual selection)
" vnoremap <leader>5 "*y`]

" " Paste -- sort of a workaround to iTerm2's crappy/slow paste
" nnoremap <leader>p "*p
" inoremap <leader>p <C-o>"*p

" " HTML option-space add non-breaking space character
" " Note: to avoid conflicts should probably do as suggested here:
" " # https://vi.stackexchange.com/a/25815/28904
" " To reload an FileType autocommand need to (1) re-source; and (2) re-set ft=...
" autocmd FileType html,htmldjango inoremap <buffer> <leader>1 &nbsp;
" " autocmd FileType python set syn=OFF
" " autocmd BufNewFile,BufRead *.txt set filetype=markdown
" " autocmd BufNewFile,BufRead *.txt colorscheme OceanicNext
" " autocmd BufNewFile,BufRead ?^[^.]\+$ colorscheme OceanicNext


" nnoremap <leader>sv :source $MYVIMRC \| edit!<cr>
" }}}


 

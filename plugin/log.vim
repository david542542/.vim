" "g: --> Global vars, will appear in all files that source this!
let g:log_level_map     = {'DEBUG': 10, 'INFO': 20, 'WARNING': 30, 'ERROR': 40}
let g:log_level_min     = "DEBUG"
let g:log_level_default = "DEBUG"
let g:log_file          = "~/.vim/vim.log"

function LogOutput(msg, level=g:log_level_default, info={})
    " Log to an output file, can be called with something like:
    " :call LogOutput('some msg', 'INFO', {'line': expand('<sflnum>'), 'func': expand('<sfile>')[9:]})
    execute "redir >> " . g:log_file
    
    " Make sure its above the log_level
    if g:log_level_map[a:level] < g:log_level_map[g:log_level_min]
      " return 
    endif

    " _LogFormat: [TIME] LEVEL - FILE - FUNC - LINE: MSG
    " Note, these are all 'l:' variables since defined within a function
    let time = strftime('%c')
    let file = expand('%:p:t')
    let func = get(a:info, 'func', '')
    let line = get(a:info, 'line', '')

    " Sometimes the event will be on a file that has not yet been saved.
    if file == '' | let file = '[nofile]' | endif
    echom(printf("[%s] %5s - %-12s - %s - L%s: %s", time, a:level, file, func, line, a:msg))
    
    redir END

endfunction



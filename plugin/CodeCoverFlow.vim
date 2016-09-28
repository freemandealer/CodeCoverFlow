autocmd VimEnter * :highlight CoverFlow ctermbg=red guibg=red

function! CoverFlowForward(param)
    exec "only"
    
    call matchadd("CoverFlow", getline("."))
    exec "vertical stjump " a:param
    return 0
endfunction

function! CoverFlowBackward()
    try
        exec "close"
        exec "vertical rightb new"
        exec "1pop"
        call matchadd("CoverFlow", getline("."))
        exec "winc h"
        call clearmatches()
    catch
        echom "Reaching the end of stack"
        exec "close"
    endtry
    return 0
endfunction

nnoremap <silent><leader>g] :call CoverFlowForward("<C-R>=expand("<cword>")<CR>")<CR>
nnoremap <silent><leader><C-t> :call CoverFlowBackward()<CR>

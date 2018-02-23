" ==============================================================================
" File: expand_region.vim
" Author: Terry Ma
" Description: Incrementally select larger regions of text in visual mode by
" repeating the same key combination
" Last Modified: March 30, 2013
" ==============================================================================

let s:save_cpo = &cpo
set cpo&vim

" ==============================================================================
" Mappings
" ==============================================================================
nnoremap <silent> <Plug>(expand_region_expand)
      \ :<C-U>call expand_region#next('n', '+')<CR>
" Map keys differently depending on which mode is desired
if expand_region#use_select_mode()
  snoremap <silent> <Plug>(expand_region_expand)
        \ :<C-U>call expand_region#next('v', '+')<CR>
  snoremap <silent> <Plug>(expand_region_shrink)
        \ :<C-U>call expand_region#next('v', '-')<CR>
else
  xnoremap <silent> <Plug>(expand_region_expand)
        \ :<C-U>call expand_region#next('v', '+')<CR>
  xnoremap <silent> <Plug>(expand_region_shrink)
        \ :<C-U>call expand_region#next('v', '-')<CR>
endif

let &cpo = s:save_cpo
unlet s:save_cpo

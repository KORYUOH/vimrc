scriptencoding=utf-8
"===============================================================================
"	Brief	いろんな所からの移植ファイル
"	Author	KORYUOH
"	Create	2024/10/23
"	Update	2024/10/23
"	Version	1.01
"===============================================================================

"from kaoriya-vim plugin/cmdex.vim
" :Scratch
"   Open a scratch (no file) buffer.
" 2024/10/23 rename Scratch -> Junk modyfy KORYUOH
" :Junk
" command! -nargs=0 Scratch new | setlocal bt=nofile noswf | let b:cmdex_scratch = 1
command! -nargs=0 Junk new | setlocal bt=nofile noswf | let b:cmdex_scratch = 1
function! s:CheckScratchWritten()
  if &buftype ==# 'nofile' && expand('%').'x' !=# 'x' && exists('b:cmdex_scratch') && b:cmdex_scratch == 1
    setlocal buftype= swapfile
    unlet b:cmdex_scratch
  endif
endfunction
augroup CmdexScratch
autocmd!
autocmd BufWritePost * call <SID>CheckScratchWritten()
augroup END

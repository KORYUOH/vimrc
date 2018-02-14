"vim:set enc=utf-8:set bomb
scriptencoding=utf-8

if executable('ghkw')
command! -nargs=* GHSearch call s:Ghkw(<f-args>)

function! s:Ghkw(...)
	if 0 == a:0
		echo 'Need Argment'
		return
	endif
	let l:hasUnite = 0
	let l:sepaletor = ' '
	if exists(':Unite') == 2
		let l:sepaletor = ':'
		let l:hasUnite = 1
	endif

	let l:args = ''
	for itr in a:000
		let l:args = l:args . l:sepaletor . itr
	endfor

	echo l:args

	if l:hasUnite == 1
		execute ":Unite output/shellcmd:ghkw".l:args
	else
		echo system('ghkw '.l:args)
	endif

endfunction

endif

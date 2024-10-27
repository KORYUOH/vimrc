"vim:set enc=utf-8:set bomb
scriptencoding=utf-8
"===============================================================================
"	Brief	Unreal Engine private/public path Searcher
"	Author	KORYUOH
"	Create	2024/10/27
"	Update	2024/10/27
"	Version	1.00
"===============================================================================
let g:loaded_UE_path_find = 1
function! UE_path_find( path )
	let pathlist = split(a:path , "/")
	let nowpath=""
	let remainlist = pathlist->copy()
	for itr in pathlist
		if( !empty(remainlist) )
			let tmp = remainlist->remove(0)
		endif
		let nowpath = nowpath . itr ."/"
		for add_fold in [ "public" , "private" ]
			let checkpath = nowpath . add_fold
			if(isdirectory(checkpath))
				let suffix = ""
				for nextpath in remainlist
					let suffix = suffix."/".nextpath
				endfor
				let expath = checkpath."/".suffix
				if(filereadable( expath ))
					return expath
				endif
			endif
		endfor
	endfor
	return a:path 
endfunction

set includeexpr=UE_path_find(v:fname)
echo "UE_path_find activated"

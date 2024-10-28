"vim:set enc=utf-8:set bomb
scriptencoding=utf-8
"===============================================================================
"	Brief	Unreal Engine private/public path Searcher
"	Author	KORYUOH
"	Create	2024/10/27
"	Update	2024/10/29
"	Version	1.01
"===============================================================================
let g:loaded_UE_path_find = 1

function! s:GetUEPluginFolders()
	let l:folders = readdir(getcwd())
	let s:module_folders = []
	for itr in l:folders
		if (isdirectory(itr))
			call add(s:module_folders,itr)
		endif
	endfor
	return s:module_folders
endfunction

function! s:check_folder( prefix,path )
	let pathlist = split(a:path , "/")
	call insert(pathlist,a:prefix)
	let nowpath=""
	let remainlist = pathlist->copy()
	for itr in pathlist
		if( !empty(remainlist) )
			let tmp = remainlist->remove(0)
		endif
		if(!empty(itr))
			let nowpath = nowpath . itr ."/"
		endif
		for add_fold in [ "public" , "private" , "Private" , "Public"]
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

function! UE_path_find(path)
	let l:plugins = s:GetUEPluginFolders()
	call insert(l:plugins , "")
	for prefix in l:plugins
		let result = s:check_folder(prefix ,a:path)
		if( result != a:path )
			return result
		endif
	endfor
	return a:path
endfunction

set includeexpr=UE_path_find(v:fname)
echo "UE_path_find activated"

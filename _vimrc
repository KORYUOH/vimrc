scriptencoding=utf-8
"===============================================================================
"	Brief	個人Vim設定ファイル
"	Author	KORYUOH
"	Create	2014/10/02
"	Update	2018/02/26
"	Version	2.60
"	Encording	utf-8 bomb dos
"===============================================================================

colorscheme torte

"=== このファイルの場所.
let s:filedir = fnamemodify( expand('<sfile>') , ':h')
let s:filelist = []
let s:localfilelist = []

"=== 読み込みチェック関数
function! s:TryLoad()
	for fpath in s:filelist
		let s:path = substitute( s:filedir . '/' . fpath , '\' ,'/' , 'g' )
		if filereadable(s:path)
			execute "source " . s:path
		else
			echomsg 'Not Found File : ' . s:path
		endif
	endfor

	for fpath in s:localfilelist
		let s:path = substitute( s:filedir . '/' . fpath , '\' ,'/' , 'g' )
		if filereadable(s:path)
			echomsg "Local vimrc Found : " . s:path
			execute "source " . s:path
		endif
	endfor
endfunction

"=== 読み込み対象追加コマンド
command! -nargs=1 AddSrc  call s:addSrc( <args> , 0  )
command! -nargs=1 AddSrcLocal  call s:addSrc(<args> , 1 )
function! s:addSrc( sourcepath, local )
	if( a:local )
		call add( s:localfilelist , a:sourcepath )
	else
		call add( s:filelist , a:sourcepath )
	endif
endfunction

"================================================================================
" 読み込むロード対応ファイル
"================================================================================
AddSrc '_plugin' 
AddSrc '_basic'

" vimrcのUnreal Engine 4 プログラム用 適当スキーム類
" AddSrc '_vimrc_ue4'

"================================================================================
" ローカルにあったら読み込むリスト
"================================================================================
AddSrcLocal "local.vim"
AddSrcLocal "temp.vim"
AddSrcLocal "_local"
AddSrcLocal "_local_vimrc"
AddSrcLocal "_vimrc_local"
AddSrcLocal ".local"
AddSrcLocal ".local_vimrc"
AddSrcLocal ".vimrc_local"


"=== 読み込み対象追加コマンド の開放
delcommand AddSrc
delcommand AddSrcLocal
"================================================================================
"読み込みチェック
"================================================================================
call s:TryLoad()

" 名前 @ 日付を挿入
"nmap <F4> <ESC><ESC>a<C-R>=$username.'@'.strftime('%Y/%m/%d')<CR><ESC>


" jqが使えるときにjsonでパースをさせる
if executable('jq')
	command! -nargs=? Jq call s:Jq(<f-args>)

	function! s:Jq(...)
		let l:filetype = &filetype
		
		if 'json' != l:filetype
			echo "This File Is No Json File"
			return
		endif
		
		if 0 == a:0
			let l:arg = "."
		else
			let l:arg=a:1
		endif
		execute "%! jq \"" . l:arg . "\""
	endfunction

	"キーマッピング
	nmap <leader>jq :Jq<CR>
endif

if !exists('g:LoadTestSource')
	let g:LoadTestSource = 0
endif

" テスト用vimファイル
if g:LoadTestSource == 1
	" source ~/github/test/WriteYank.vim
endif

if !exists('g:unite_source_outline_info')
	let g:unite_source_outline_info = {}
endif

command! -nargs=1 RenameThisFile call s:RenameFileName(<f-args> );
function! s:RenameFileName( fileName )
	let l:fromname = expand('%')
	let l:toname = fnamemodify( expand('%') , ':h' ) . fileName 
	rename( l:fromname, l:toname )
endfunction

augroup PHP_IO
    autocmd!
	autocmd BufRead *.php set autoindent
	autocmd BufReadPost  *.php set noexpandtab
	autocmd BufReadPost  *.php %retab!
	autocmd BufWritePre  *.php set expandtab
	autocmd BufWritePre  *.php %retab!
	autocmd BufWritePost *.php set noexpandtab
	autocmd BufWritePost *.php %retab!
	autocmd BufWritePost *.php set nomod
augroup END


augroup BatFileFenc
	autocmd!
	autocmd Bufread,WinEnter,VimEnter *.bat set fileencoding=cp932
augroup END


"vim:set enc=utf-8:set bomb

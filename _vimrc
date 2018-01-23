scriptencoding=utf-8
"===============================================================================
"	Brief	個人Vim設定ファイル
"	Author	KORYUOH
"	Create	2014/10/02
"	Update	2018/01/20
"	Version	2.20UE
"	Encording	utf-8 bomb dos
"===============================================================================

colorscheme torte
source ~/github/_plugin
source ~/github/_basic

" vimrcのUnreal Engine 4 プログラム用 適当スキーム類
source ~/github/_vimrc_ue4

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

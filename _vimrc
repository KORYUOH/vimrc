scriptencoding=utf-8
"===============================================================================
"	Brief	個人Vim設定ファイル
"	Author	KORYUOH
"	Create	2014/10/02
"	Update	2016/05/13
"	Version	2.10UE
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


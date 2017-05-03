scriptencoding=utf-8
"===============================================================================
"	Brief	個人Vim設定ファイル
"	Author	KORYUOH
"	Create	2014/10/02
"	Update	2017/05/03
"	Version	2.11
"	Encording	utf-8 bomb dos
"===============================================================================

colorscheme torte
source ~/github/_plugin
source ~/github/_basic

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

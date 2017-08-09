scriptencoding=utf-8
"===============================================================================
"	Brief	個人Vim設定ファイル
"	Author	KORYUOH
"	Create	2014/10/02
"	Update	2017/08/09
"	Version	2.12
"	Encording	utf-8 bomb dos
"===============================================================================

colorscheme torte
source ~/github/_plugin
source ~/github/_basic

" vimrcのUnreal Engine 4 プログラム用 適当スキーム類
" source ~/github/_vimrc_ue4

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

"===============================================================================
"	Brief	個人Vim設定ファイル
"	Author	KORYUOH
"	Create	2014/10/02
"	Update	2015/03/07
"	Version	1.35
"===============================================================================

"エンコードの指定 UTF-8
"set encoding=UTF-8
"set fileencoding=UTF-8
"set termencoding=UTF-8

"エンコードの指定 Shift-JIS
set encoding=cp932
set fileencoding=cp932
set termencoding=cp932

"ほかのから拾ってみた
"set encoding=utf-8
"set termencoding=utf-8
"set fileencoding=utf-8
"set encoding=utf-8
"set fileencodings=euc-jp,cp932,utf-8

"スワップファイルはいらない
set noswapfile
"バックアップファイルもいらない
set nobackup
"undoファイルも作らない
"set noundofile

"分割されたのは下
set splitbelow

"分割されたのは右
set splitright

"タグファイルの指定
set tags=~/.tags

"表示タブ幅
set tabstop=4
"挿入タブ幅
set shiftwidth=4
"タブをスペースに展開しない
set noexpandtab
"行番号表示
set number
"長い行の折り返しをしない
set nowrap
"指定文字数を超えた場合、空白の跡で折り返さない
set textwidth=0
"カーソル行の色を変える
set cursorline

"ウィンドウの上下端でカーソル先の視界をいくつ確保するか
set scrolloff=8
"ウィンドウの左右端でカーソル先の司会をいくつ確保するか
set sidescrolloff=16
"左右端でスクロールが発生したときに何文字スクロールさせるか
set sidescroll=1

"インクリメント/デクリメントを0埋めされてても10進数として増減させる
set nf=

"日付の挿入
nmap <F5> <ESC>a<C-R>=strftime("%Y/%m/%d")<CR><ESC>

"時間の挿入
nmap <F6> <ESC>a<C-R>=strftime("%H:%M")<CR><ESC>

" ; <=> : 入れ替え
nmap ; :

" Ctrl + hで左のタブへ移動する
nmap <C-h> gT

" Ctrl + lで右のタブへ移動する
nmap <C-l> gt

" Ctrl + Enterで改行挿入
nmap <C-Enter> I<CR><ESC>

"_vimrcの再読み込み
command! ReloadVimrc source ~/github/_vimrc

command! OpenVimrc tabnew $HOME/github/_vimrc

command! OpenGVimrc tabnew $HOME/github/_gvimrc

"全角スペースの表示
function! WideSpace()
	highlight WideSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
	augroup WideSpace
		autocmd!
		autocmd ColorScheme * call WideSpace()
		"autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('WideSpace' , '　')
		autocmd VimEnter,WinEnter,BufRead * match WideSpace /　/
	augroup END
	call WideSpace()
endif

"===============================================================================
"NEOBUNDLEの設定
"===============================================================================
" vim起動時のみruntimepathにneobundle.vimを追加
if has('vim_starting')
	set nocompatible
 	set runtimepath+=~/.vim/neobundle/neobundle.vim
endif

" neobundle.vimの初期化 
call neobundle#begin(expand('~/.vim/neobundle'))
" NeoBundleを更新するための設定
NeoBundleFetch 'Shougo/neobundle.vim'
" neobundle.vimの初期化終了
call neobundle#end()

" 読み込むプラグインを記載
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'mattn/flappyvird-vim'

"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" プラグインのキーマッピング
"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

nmap <leader>f :Unite file<CR>
nmap <leader>mf :Unite file_mru<CR>




" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" インストールのチェック
NeoBundleCheck

"指定文字数を超えた場合、空白の跡で折り返さない
set textwidth=0

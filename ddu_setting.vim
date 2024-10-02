scriptencoding=utf-8
"===============================================================================
"	Brief	ddu設定ファイル
"	Author	KORYUOH
"	Create	2024/09/12
"	Update	2024/09/18
"	Version	1.02
"===============================================================================

let win_border = 'rounded'
let win_height = '&lines - 3'
let win_width = '&columns / 2 - 3'
let win_col = 1
let win_row = 0
let preview_row = 3
let preview_col = '&columns / 2'
call ddu#custom#patch_global({
	\"ui" : "ff",
	\'uiParams' : {
		\'_' : {
			\'split': 'horizontal',
			\'floatingBorder' : win_border,
			\'winHeight' : win_height,
			\'winWidth' : win_width,
			\'winRow' : win_row,
			\'winCol' : win_col,
			\'previewFloating' : v:true,
			\'previewFloatingBorder' : win_border,
			\'previewHeight' : win_height,
			\'previewWidth' : win_width,
			\'previewRow' : preview_row,
			\'previewCol' : preview_col,
		\},
		\'ff': {
			\'ignoreEmpty': v:true,
			\'split': 'horizontal',
			\'startAutoAction': v:true,
			\'autoAction': { 'name': 'preview', 'delay': 0, },
			\'prompt': '> ',
			\'startFilter': v:true,
			\'filterSplitDirection': 'floating',
			\'filterFloatingPosition': 'top',
			\'floatingBorder': win_border,
			\'winHeight': win_height,
			\'winWidth': win_width,
			\'winRow': win_row,
			\'winCol': win_col,
			\'previewFloating': v:true,
			\'previewFloatingBorder': win_border,
			\'previewHeight': win_height,
			\'previewWidth': win_width,
			\'previewRow': preview_row,
			\'previewCol': preview_col,
		\},
	\},
	\'sources': [
		\{
			\'name': 'file',
			\'params': {}
		\},
		\{
			\'name' : 'window',
			\'params' : { 'format' : 'tab\|%tn:%w:%wi' },
		\}
	\],
	\'sourceParams' : {
		\'mr' : 'mru',
	\},
	\'sourceOptions': {
		\'_': {
			\'matchers'  : ['matcher_kensaku'],
			\'converters' : ['converter_hl_dir'],
			\'ignoreCase': v:true,
		\},
		\'file' : {
			\'columns': ['filename'],
		\},
		\'line' : {
			\'sorters' : [],
		\},
	\},
	\'kindOptions': {
		\'tab':{
			\'defaultAction' : 'open',
		\},
		\'file': {
			\'defaultAction': 'open',
		\},
		\'word' : {
			\'defaultAction': 'append',
		\},
		\'url' : {
			\'defaultAction' : 'browse',
		\},
		\'action' : {
			\'defaultAction' : 'do',
		\},
		\'help' : {
			\'defaultAction' : 'vsplit',
		\},
		\'window' : {
			\'defaultAction': 'open',
		\},
	\},
	\'actionOptions' : {
		\'narrow' : {
			\'quit' : v:true,
		\},
	\},
	\'filterOptions' : {
		\'matcher_kensaku' : {
			\'higilightMatched' :'Search',
		\},
	\},
 \})

autocmd FileType ddu-filer call s:ddu_my_settings()
function! s:ddu_my_settings() abort
	nnoremap <buffer><silent><expr> <CR>
		\	ddu#ui#get_item()->get('isTree' , v:false) ? 
		\ "<Cmd>call ddu#ui#do_action('itemAction' , {'name' : 'narrow'})<CR>" : 
		\ "<Cmd>call ddu#ui#do_action('itemAction' )<CR>"
	nnoremap <buffer><silent> <Space>
		\ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
	nnoremap <buffer> o
		\ <Cmd>call ddu#ui#do_action('expandItem', {'mode': 'toggle'})<CR>
	 nnoremap <buffer><silent> q
		\ <Cmd>call ddu#ui#do_action('quit')<CR>
	nnoremap <buffer><silent> i	<Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
	nnoremap <buffer><silent> t	<Cmd>call ddu#ui#do_action('chooseAction')<CR>
endfunction
autocmd Filetype ddu-ff call s:ddu_ff_my_settings()
function! s:ddu_ff_my_settings() abort
	nnoremap <buffer><silent><expr> <CR>
	\	ddu#ui#get_item()->get('isTree' , v:false ) ? 
	\	"<Cmd>call ddu#ui#do_action('itemAction',{'name':'narrow' })<CR>" :
	\	"<Cmd>call ddu#ui#do_action('itemAction' )<CR>"
	nnoremap <buffer><silent><expr> <S-CR>
	\	ddu#ui#get_item()->get('isTree' , v:false) ? 
	\	"<Cmd> call ddu#ui#do_action('itemAction' , {'name' : 'narrow'})<CR>" :
	\	"<Cmd> call ddu#ui#do_action('itemAction' ,{'name' : 'tabopen'})<CR>"
	nnoremap <buffer> <space>
	\	<Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
	nnoremap <buffer> i	
	\	<Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
	nnoremap <buffer> q
		\ <Cmd>call ddu#ui#do_action('quit')<CR>
	nnoremap <buffer> t
	\ <Cmd>call ddu#ui#do_action('chooseAction')<CR>
	nnoremap <buffer><silent> ..
	\ <Cmd> call ddu#ui#do_action('itemAction',{'name':'narrow' , 'params' : { 'path' : '..' }})<CR>
endfunction
autocmd Filetype ddu-ff-filter call s:ddu_ff_filter_my_settings()
function! s:ddu_ff_filter_my_settings()abort
	inoremap <buffer><CR>
	\	<Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>
	nnoremap <buffer><CR>
	\	<Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>
endfunction

" tabで開く
function! s:ddu_tabnew(args)
	let items = a:args->get('items')
	let action = items[0]->get('action')
	let path = action->get('path') 
	execute 'tabedit '.path
endfunction

call ddu#custom#action('kind','file','tabopen', function('s:ddu_tabnew'))

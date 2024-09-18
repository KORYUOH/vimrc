scriptencoding=utf-8
"===============================================================================
"	Brief	ddc設定ファイル
"	Author	KORYUOH
"	Create	2024/09/18
"	Update	2024/09/18
"	Version	1.00
"===============================================================================

call ddc#custom#patch_global({
\	'ui': 'native',
\	'sources' :[
\		'vim-lsp',
\		'around',
\		'buffer',
\		'neosnippet',
\		'file',
\		'skkeleton'
\		],
\	'sourceOptions': {
\		'_': {
\			'matchers'  : ['matcher_fuzzy'],
\			'sorters'   : ['sorter_fuzzy'],
\			'converters': ['converter_fuzzy'],
\			'ignoreCase': v:true,
\		},
\		'around': {
\			'mark': '[Arround]',
\		},
\		'buffer': {
\			'mark': '[Buffer]',
\		},
\		'vim-lsp': {
\			'mark': '[LSP]',
\			'forceCompletionPattern': '\.\w*|:\w*|->\w*',
\		},
\		'neosnippet' : {
\			'mark' : '[NS]',
\		},
\		'skkeleton': {
\			'mark' : '[skkeleton]' ,
\			'matchers' : [],
\			'sorters' : [],
\			'converters' : [],
\			'isVolatile' : v:true,
\			'minAutoCompleteLength' : 1,
\			},
\		},
\	'sourceParams': {
\		'around': { 'maxSize': 500 },
\		'buffer': {
\			'limitBytes': 5000000,
\			'forceCollect': v:true,
\			'fromAltBuf': v:true,
\		},
\	 },
\})
call ddc#custom#patch_filetype(
\	 ['ps1','dosbatch','autohotkey','registry'], {
\		'sorceOptions' : {
\			'file' : {
\				'forceCompletionPattern' : '\S\\\\S*',
\				},
\			},
\		'sorceParams' : {
\
\		'file' : {
\				'mode' : 'win32',
\			},
\}})
call skkeleton#config(#{
\	completionRankFile: '~/.skkeleton/rank.json',
\	globalDictionaries: [ ['~\dict\SKK-JISYO.L','euc-jp'] ],
\})
" Skkeletonでカタカナ入力に変更する
call skkeleton#register_keymap('input', '<C-q>' , 'katakana')

" skkeletonの有効/無効を切りかえる
inoremap <C-t> <Plug>(skkeleton-toggle)

" Tab Complete
inoremap <expr> <TAB>
\ pumvisible() ? '<C-n>' : 
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ? 
\ '<TAB>' : ddc#map#manual_complete()

"Shift-Tab completion back
inoremap <expr> <S-TAB> pumvisible() ? '<C-p>' : '<C-h>'

call ddc#enable()


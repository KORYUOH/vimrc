﻿scriptencoding=utf-8
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

if !exists('g:unite_source_outline_info')
	let g:unite_source_outline_info = {}
endif

" uintとかのカラースキーム
augroup MSDNCPP
	autocmd!
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cppType float32
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cppType float64
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cppType int16
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cppType int32
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cppType int64
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cppType int8
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cppType uint16
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cppType uint32
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cppType uint64
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cppType uint8
augroup END

" UnrealEngine関係のマクロカラースキーム
augroup UECPP
	autocmd!
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cDefine UCLASS
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cDefine UENUM
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cDefine GENERATED_BODY
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cDefine GENERATED_STRUCT_BODY
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cDefine GENERATED_USTRUCT_BODY
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cDefine GENERATED_UCLASS_BODY
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cDefine DEFINE_LOG_CATEGORY_STATIC
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cDefine UFUNCTION
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cDefine UPROPERTY
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cDefine USTRUCT
	"autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn match cDefine "\<[A-Z]\+_API\>"
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cStatement Category
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cStatement Super
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword cSpecial Cast
augroup END

"UE4のクラスのなんちゃってカラースキーム 
augroup UE4CLASS
	autocmd!
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn match Identifier "\<A[A-Z]\w\+\>"
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn match Identifier "\<F[A-Z]\w\+\>"
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn match Identifier "\<U[A-Z]\w\+\>"
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn match Identifier "\<E[A-Z]\w\+\>"
augroup END

highlight UE4Assertions  guifg=Red
highlight UE4AssertionsEx  guifg=Red guibg=Yellow
highlight UE4AssertionsCheck  guifg=Yellow

" UE4のアサートのカラースキーム設定
augroup UE4Assert
	autocmd!
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword UE4Assertions unimplemented checkNoEntry checkNoReentry checkNoRecursion
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword UE4AssertionsEx ensure ensureMsg ensureMsgf
	autocmd VimEnter,WinEnter,BufRead *.{h,c,cpp,hpp} syn keyword UE4AssertionsCheck check verify checkf verifyf checkCode
augroup END

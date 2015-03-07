"===============================================================================
"	Brief	�lVim�ݒ�t�@�C��
"	Author	KORYUOH
"	Create	2014/10/02
"	Update	2015/03/07
"	Version	1.35
"===============================================================================

"�G���R�[�h�̎w�� UTF-8
"set encoding=UTF-8
"set fileencoding=UTF-8
"set termencoding=UTF-8

"�G���R�[�h�̎w�� Shift-JIS
set encoding=cp932
set fileencoding=cp932
set termencoding=cp932

"�ق��̂���E���Ă݂�
"set encoding=utf-8
"set termencoding=utf-8
"set fileencoding=utf-8
"set encoding=utf-8
"set fileencodings=euc-jp,cp932,utf-8

"�X���b�v�t�@�C���͂���Ȃ�
set noswapfile
"�o�b�N�A�b�v�t�@�C��������Ȃ�
set nobackup
"undo�t�@�C�������Ȃ�
"set noundofile

"�������ꂽ�͉̂�
set splitbelow

"�������ꂽ�͉̂E
set splitright

"�^�O�t�@�C���̎w��
set tags=~/.tags

"�\���^�u��
set tabstop=4
"�}���^�u��
set shiftwidth=4
"�^�u���X�y�[�X�ɓW�J���Ȃ�
set noexpandtab
"�s�ԍ��\��
set number
"�����s�̐܂�Ԃ������Ȃ�
set nowrap
"�w�蕶�����𒴂����ꍇ�A�󔒂̐ՂŐ܂�Ԃ��Ȃ�
set textwidth=0
"�J�[�\���s�̐F��ς���
set cursorline

"�E�B���h�E�̏㉺�[�ŃJ�[�\����̎��E�������m�ۂ��邩
set scrolloff=8
"�E�B���h�E�̍��E�[�ŃJ�[�\����̎i��������m�ۂ��邩
set sidescrolloff=16
"���E�[�ŃX�N���[�������������Ƃ��ɉ������X�N���[�������邩
set sidescroll=1

"�C���N�������g/�f�N�������g��0���߂���ĂĂ�10�i���Ƃ��đ���������
set nf=

"���t�̑}��
nmap <F5> <ESC>a<C-R>=strftime("%Y/%m/%d")<CR><ESC>

"���Ԃ̑}��
nmap <F6> <ESC>a<C-R>=strftime("%H:%M")<CR><ESC>

" ; <=> : ����ւ�
nmap ; :

" Ctrl + h�ō��̃^�u�ֈړ�����
nmap <C-h> gT

" Ctrl + l�ŉE�̃^�u�ֈړ�����
nmap <C-l> gt

" Ctrl + Enter�ŉ��s�}��
nmap <C-Enter> I<CR><ESC>

"_vimrc�̍ēǂݍ���
command! ReloadVimrc source ~/github/_vimrc

command! OpenVimrc tabnew $HOME/github/_vimrc

command! OpenGVimrc tabnew $HOME/github/_gvimrc

"�S�p�X�y�[�X�̕\��
function! WideSpace()
	highlight WideSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
	augroup WideSpace
		autocmd!
		autocmd ColorScheme * call WideSpace()
		"autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('WideSpace' , '�@')
		autocmd VimEnter,WinEnter,BufRead * match WideSpace /�@/
	augroup END
	call WideSpace()
endif

"===============================================================================
"NEOBUNDLE�̐ݒ�
"===============================================================================
" vim�N�����̂�runtimepath��neobundle.vim��ǉ�
if has('vim_starting')
	set nocompatible
 	set runtimepath+=~/.vim/neobundle/neobundle.vim
endif

" neobundle.vim�̏����� 
call neobundle#begin(expand('~/.vim/neobundle'))
" NeoBundle���X�V���邽�߂̐ݒ�
NeoBundleFetch 'Shougo/neobundle.vim'
" neobundle.vim�̏������I��
call neobundle#end()

" �ǂݍ��ރv���O�C�����L��
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'mattn/flappyvird-vim'

"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
" �v���O�C���̃L�[�}�b�s���O
"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

nmap <leader>f :Unite file<CR>
nmap <leader>mf :Unite file_mru<CR>




" �ǂݍ��񂾃v���O�C�����܂߁A�t�@�C���^�C�v�̌��o�A�t�@�C���^�C�v�ʃv���O�C��/�C���f���g��L��������
filetype plugin indent on

" �C���X�g�[���̃`�F�b�N
NeoBundleCheck

"�w�蕶�����𒴂����ꍇ�A�󔒂̐ՂŐ܂�Ԃ��Ȃ�
set textwidth=0

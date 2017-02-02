" ultima modificacao 14/05/2014 18:49

" faz o vim carregar tudo a partir da minha home e nao do
" /etc/share/vim/vimcurrent
" assim, podemos ficar compativel com o pc de casa
"let $VIMRUNTIME = "/home/bcc/bedulli/.vim"

" habilita a colocaracao de sintaxe
syntax enable
colorscheme elflord

" minhas palavra a serem destacadas
highlight PALAVRAS ctermbg=darkblue
syntax keyword PALAVRAS linux Nota nota

" Destaca espaços e tabs redundantes
highlight RedundantWhitespace ctermbg=gray guibg=gray
match RedundantWhitespace /\s\+$\| \+\ze\t/

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"          lets
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""

let _backupdir="~/.vim/backup//"
let _swapdir="~/.vim/swap//"
let _undodir="~/.vim/undo//"

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"          creating backup, swap, undo dirs
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent execute "!mkdir -p " _backupdir
silent execute "!mkdir -p " _swapdir
silent execute "!mkdir -p " _undodir

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"          sets
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set mouse=a
set ai sm js
set showcmd showmode
set nu					" numera linhas
set ts=4				" define a posicao onde o tab pa'ra
set sw=4				" define a endentacao
set st=4				" tamanho do tab em espacos
"set et					" troca os tabs por espacos
"retab					" substituis os tabs ja existentes por espacos
set ruler				" mostra a posicao do cursor
"set visualbell			" faz piscar o cu da tua mae
"set errorbells			" faz tocar barulho irritante ainda
set novisualbell		" vai piscar o cu da tua mae
set noerrorbells		" XIU, quieto!
set backup
execute "set backupdir="._backupdir
set swapfile
execute "set directory="._swapdir
set undofile
execute "set undodir="._undodir
"set nobackup			" nao grava o arquivo de backup
set title				" mostra o nome do arquivo na barra de titulo
"set textwidth=80		" quebra linha ao chegar na coluna 80
set undolevels=5000		" desfazer ateh 5000 acoes deve dar =p
set updatetime=6000		" salva na swap apos 6 segundo sem fazer nada
set updatecount=20		" salva na swap apos 20 caracteres
set nocompatible		" sem compatibilidade com o VI
"set colorcolumn=81

"set expandtab

"setar o terminal para bash
let &shell="bash"
set clipboard=autoselect

" O trecho abaixo formata a barra de status
" mostra o código ascii do caractere sob o cursor e outras coisas
set statusline=%F%m%r%h%w\ [FILE=%{&ff}]\ [TIPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [COL=%04v,LIN=%04l][%02p%%]\ [LINES=%L]\ [%{strftime(\"%d/%m/%y\ -\ %H:%M:%S\")}]
" sempre exibe a barra de status
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"          fim sets
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"          O M N I C O M P L E T E
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocp
filetype plugin on

map <F10> :!/home/bcc/bedulli/ctags_installed/bin/ctags -R .<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"          M A P E A M E N T O S
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F2> ggO#define _GNU_SOURCE<cr>
		\#include <stdio.h><cr>
		\#include <stdlib.h><cr>
		\#include <string.h><cr>
		\<cr>
		\<cr>
		\int main (int argc, char **argv)<cr>
		\{<cr>
		\<cr>
		\<cr>
		\<cr>
		\<cr>
		\return(EXIT_SUCCESS);<cr>
		\}

"/*--------------------------------------------------------------------------*/

"map <F6> :set spell spelllang=pt<cr>
imap <F6> /*????????????????????????????????????????????????????*/<cr>
		\/*????????????????????????????????????????????????????*/

"/*--------------------------------------------------------------------------*/

" mapeia a tecla F7 para imprimir debug
imap <F7> printf("oi\n");

"/*--------------------------------------------------------------------------*/

" mapeia a tecla F8 para imprimir um cabecalho bash
"map <F8> ggO#!/bin/bash
"         \<c-o>:r!echo %<cr># <c-o>o
"         \# Caio Renato Bedulli do Carmo<cr>


"/*--------------------------------------------------------------------------*/

" compila o source e volta para o vim
" map <F9> :!clear; EXECUTAVEL=$(echo % | sed -r 's/(.*)\.[^.]+$/\1/');
"           \gcc -o $EXECUTAVEL %<crinclude <strings.h> >;

"/*--------------------------------------------------------------------------*/

"map <F10> :!EXECUTAVEL=$(echo "%" | sed -r 's/(.*)\.[^.]+$/\1/'); ./$EXECUTAVEL<cr>

"/*--------------------------------------------------------------------------*/

" substitui o espacos e tabs no final das linhas
cmap <F3> % s/\ *\t*\ *\t*$//

"/*--------------------------------------------------------------------------*/

" Permite recarregar o vim para que modificações no
" próprio vimrc seja ativadas com o mesmo sendo editado
nmap <F12> :<C-u>source ~/.vimrc <BAR> echo "Vimrc reloaded!"<CR>
map ,u :source ~/.vimrc<CR>	" Para recarregar o .vimrc
map ,v :e ~\.vimrc<CR>		" para editar o .vimrc


"/*--------------------------------------------------------------------------*/

" faz os resultados da busca aparecerem no meio da tela
map n nzz
nmap N Nzz
"nmap * *zz
"nmap # #zz
"nmap g* g*zz
"nmap g# g#zz

"/*--------------------------------------------------------------------------*/

" Abreviacoes
"iab forc for (i= ; ; i++)
"iab whi  while ()

"/*--------------------------------------------------------------------------*/

"====== complementação de palavras ====
"usa o tab em modo insert para completar palavras
function! InsertTabWrapper(direction)
	let col = col('.') - 1
	if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	elseif "backward" == a:direction
		return "\<c-p>"
	else
		return "\<c-n>"
	endif
endfunction

"inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("forward")<cr>

"/*--------------------------------------------------------------------------*/

" Mapeamento para apagar com Backspace
map <BS> X

" Mapeamento para janelas
"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_
"set wmh=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"         FIM     M A P E A M E N T O S
"
"-----------------------------------------------------

" oculta o destaque das buscas, e exibe de novo com shift+F11
" tira as cores das ocorrências de busca e recoloca (booleano)
nno <S-F11> :set hls!<bar>set hls?<CR>


" Enable file type detection
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on


"/*--------------------------------------------------------------------------*/

" dá permissão para arquivos dos tipos descritos abaixo
au BufWritePost *.sh,*.py,*.pl,*.cgi :!chmod +x <afile>
" with #!/usr/bin/perl and #!/bin/sh
au BufWritePost * if getline(1) =~ "^#!/bin/[a-z]*sh" ||
				   \ getline(1) =~ "^#!/usr/bin/perl" | silent execute

"/*--------------------------------------------------------------------------*/

" Remove Ctrl+M do final de linhas do DOS
" ta funfando mto bem nao...
if has("user_commands")
	com! RemoveCtrlM :%s/^M/\r/g
	" change to directory of current file
	"com! CD cd %:p:h
endif

"/*--------------------------------------------------------------------------*/

" Ao editar um arquivo será aberto no ultimo ponto em
" que foi editado
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal g`\"" |
	\ endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"            FAZER O VIM VIRAR EDIROT HEXA
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Placing the following code in your vimrc will provide a :Hexmode ex command
" to toggle xxd hex mode on or off. It will keep track of what mode you are in,
" so you don't have to. This ex command is easy to map like this:

nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" Note that <C-H> is already a defined command, so override it with care
" (or use a different left hand side to the mapping). See :help CTRL-H,
" :help i_CTRL-H, :help v_CTRL-H. Also, you may need to use gvim to distinguish
" between <C-H> and <BS>.

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
	" hex mode should be considered a read-only operation
	" save values for modified and read-only for restoration later,
	" and clear the read-only flag for now
	let l:modified=&mod
	let l:oldreadonly=&readonly
	let &readonly=0
	let l:oldmodifiable=&modifiable
	let &modifiable=1
	if !exists("b:editHex") || !b:editHex
		" save old options
		let b:oldft=&ft
		let b:oldbin=&bin
		" set new options
		setlocal binary " make sure it overrides any textwidth, etc.
		let &ft="xxd"
		" set status
		let b:editHex=1
		" switch to hex editor
		" -g 16 modifica quantos bytes ficam agrupados
		%!xxd -g 16
	else
		" restore old options
		let &ft=b:oldft
		if !b:oldbin
			setlocal nobinary
		endif
		" set status
		let b:editHex=0
		" return to normal editing
		%!xxd -r
	endif
	" restore values for modified and read only state
	let &mod=l:modified
	let &readonly=l:oldreadonly
	let &modifiable=l:oldmodifiable
endfunction

" Below is some code for your vimrc that does all of this, making use of the
" command we define above:
" autocmds to automatically enter hex mode and handle file writes properly
if has("autocmd")
	" vim -b : edit binary using xxd-format!
	augroup Binary
	au!
	au BufReadPre *.bin,*.hex setlocal binary
	au BufReadPost *
		  \ if &binary | Hexmode | endif
	au BufWritePre *
		\ if exists("b:editHex") && b:editHex && &binary |
		\	 let oldro=&ro | let &ro=0 |
		\	 let oldma=&ma | let &ma=1 |
		\	 exe "%!xxd -r" |
		\	 let &ma=oldma | let &ro=oldro |
		\	 unlet oldma | unlet oldro |
		\ endif
	au BufWritePost *
		\ if exists("b:editHex") && b:editHex && &binary |
		\	let oldro=&ro | let &ro=0 |
		\	let oldma=&ma | let &ma=1 |
		\	exe "%!xxd" |
		\	exe "set nomod" |
		\	let &ma=oldma | let &ro=oldro |
		\	unlet oldma | unlet oldro |
		\ endif
	augroup END
endif

" It would be nice if the user did not need to remember to convert back from
" hex before saving changes to a binary file. Also, certain files are almost
" always binary; it would be nice if Vim would pick up on this and automatically
" enter an appropriate editing mode. The help files for Vim include the
" following advice for automating the xxd-style hex editing capabilities for
" Vim, in order to automate the conversion and automatically enter hex mode
" for binary files:

" vim -b : edit binary using xxd-format!
augroup Binary
	au!
	au BufReadPre  *.bin let &bin=1
	au BufReadPost *.bin if &bin | %!xxd
	au BufReadPost *.bin set ft=xxd | endif
	au BufWritePre *.bin if &bin | %!xxd -r
	au BufWritePre *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"        FIM FAZER O VIM VIRAR EDIROT HEXA
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""

" alias uteis para fechar o vim
cab W w
cab Q q
cab Wq wq
cab wQ wq
cab WQ wq
cab Wqw wq
cab wqw wq

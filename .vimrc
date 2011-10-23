" Active Pathoen.vim. (this should be called before enabling filetype
" detection.)
call pathogen#runtime_append_all_bundles()
call pathogen#helptages()

scriptencoding utf-8

autocmd! bufwritepost .vimrc source ~/.vimrc	" auto reload vimrc when editing it

" General Settings
"
set autoread	" auto read when file is changed outside
set showmode	" show current mode


syntax on	" syntax highlight
set hlsearch	" search highlighting
set guifont=Monaco
set t_Co=256	" 256 color mode
set cursorline	" highlight current line
colorscheme molokai-e	" set default color scheme


set ai			" auto indent
set copyindent		" copy the previous indentation on autoindenting
set nobackup		" no *~ backup files
set nu 			" show line num
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search patten is all lowrcase, case-sensitive otherwise

" Tab setting {
set expandtab		" replace <TAB> with spaces
set softtabstop=3
set shiftwidth=3	" indent-width

au FileType Makefile set noexpandtab
"}

" set Line# bg-color
"hi LineNr guibg=#1B1B1B
" set Line# fg-color
"hi LineNr guifg=#737373

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "")
	return curdir
endfunction

function! HasPaste()
	if &paste
		return '[PASTE]'
	else
		return ''
	endif
endfunction

" }


" ---------------------------------------------------------------------------------------------
"  USEFUL SHORTCUTS
" ---------------------------------------------------------------------------------------------
" --- move around splits {
" move to & maximize the below split
 map <C-j> <C-W>j "<C-W>_
" move to & maximize the above split
 map <C-k> <C-W>k "<C-W>_
" move to & maximize the left split
 map <C-h> <C-W>h "<C-W><bar>
" move to & maximize the right split
 map <C-l> <C-W>l "<C-W><bar>
set wmw=0			" set the min width of a window to 0 so we can maximize others
set wmh=0			" set the min height of a window to 0 so we can maximize others
"  }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
map <S-H> gT
" go to next tab
" }
" ---------------------------------------------------------------------------------------------
"  USEFUL SHORTCUTS
" ---------------------------------------------------------------------------------------------
" set leader to
let mapleader=","
let g:mapleader=","

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" --- move around splits {
" move to & maximize the below split
 map <C-j> <C-W>j "<C-W>_
" move to & maximize the above split
 map <C-k> <C-W>k "<C-W>_
" move to & maximize the left split
 map <C-h> <C-W>h "<C-W>_
" move to & maximize the right split
 map <C-l> <C-W>l "<C-W>_
set wmw=0			" set the min width of a window to 0 so we can maximize others
set wmh=0			" set the min height of a window to 0 so we can maximize others
"  }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" <Esc>
imap <S-CR> <Esc>

" Max H of current window
map <C-m> <C-w>300_

" Toggle Max current window
map <C-o> <C-w>o

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

"-----------------------------------------------------------------------------------------------
" ENCODING SETTINGS
"-----------------------------------------------------------------------------------------------
set encoding=utf-8
"set termencoding=utf-8
set fileencoding=utf-8
"set fileencoding=ucs-bom,utf-8,big5,gb2312,latin1

"fun! ViewUTF8()
"	set encoding=utf-8
"	set termencoding=big5
"endfun

"fun! UTF8()
"	set encoding=utf-8
"	set termencoding=big5
"	set fileencoding=utf-8
"	set fileencodings=ucs-bom,big5,utf-8,latin1
"endfun

"fun! Big5()
"	set encoding=big5
"	set fileencoding=big5
"endfun





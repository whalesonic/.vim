"Last uptate : 13:15 03/10/2016

"@ Plugin Manager : VundleVim 
"  PATH           : ./bundle/Vundle.vim/
"  -------------------------------------------------------------------
"  Below for Configuration :

   set nocompatible              " be iMproved, required
   filetype off                  " required

   " set the runtime path to include Vundle and initialize
   set rtp+=~/.vim/bundle/Vundle.vim
   call vundle#begin()

   Plugin 'VundleVim/Vundle.vim'    " let Vundle manage Vundle, require

   Plugin 'scrooloose/nerdtree'
   Plugin 'scrooloose/syntastic'
"unmaintained   Plugin 'kien/ctrlp.vim'
   Plugin 'ctrlpvim/ctrlp.vim'
   Plugin 'tpope/vim-fugitive'
   Plugin 'vim-airline/vim-airline'

"   else plugin >>>>>>>>>>>>>>>>>>>>>>>>>>>>>
   Plugin 'majutsushi/tagbar'



   " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"  -------------------------------------------------------------------



"@ Plugin/ ctrlp 
"  -------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

   " Exclude files & directories using vim's wildignore and ctrlP's g:ctrlp_custom_ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore='\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore={ 'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$', 'link': 'some_bad_symbolic_links' }

"@ Plugin/ syntastic 
"  -------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Enable syntax checker
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']
"let g:syntastic_javascript_checkers = ['eslint']


" Change symbol
let g:syntastic_error_symbol = '>×'
let g:syntastic_style_error_symbol = '»'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_warning_symbol = '>!'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn


" Plugin/ fugitive 
"  -------------------------------------------------------------------
set statusline+=%{fugitive#statusline()}  " get an indicator with the current branch in ur statusline.


" Plugin/ airline 
"  -------------------------------------------------------------------
"let g:airline#extensions#tabline#enabled = 1
set laststatus=2  " keep statusline appear ( defaul apper when a split is created )

"set guifont=Liberation\ Mono\ for\ Powerline\ 10 
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" airline symbols   
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


scriptencoding utf-8


" Plugin/ tagbar
"  -------------------------------------------------------------------
nmap <F9> :TagbarToggle<CR>
" auto focus when startup

let g:tagbar_ctags_bin='/usr/bin/ctags'     "Proper Ctags location, let tagbar to invok ctags
let g:tagbar_autofocus = 1
"let g:tagbar_width=35                       " default is 40


" / Go To Definition..
"  -------------------------------------------------------------------
set tags=./.tags;    " tell vim where to look for Default / Generic tag file

" generate tags for this folder recurively
nnoremap <F12> :!ctags -R --exclude=.git -f .tags<CR>:!echo ".tags gened."<CR>

noremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"noremap <C-W> :vsp      <CR>:exec("tag ".expand("<cword>"))<CR>

"autocmd! bufwritepost .vimrc source ~/.vimrc	" auto reload vimrc when editing it
"  -------------------------------------------------------------------

" General Settings
"
set autoread	" auto read when file is changed outside
set showmode	" show current mode

syntax on	" syntax highlight
set hlsearch	" search highlighting
"set guifont=Monaco
set t_Co=256	" 256 color mode
set cursorline	" highlight current line
colorscheme molokai	" set default color scheme

"set ai			" auto indent
"set copyindent		" copy the previous indentation on autoindenting
set nobackup		" no *~ backup files
set nu 			" show line num
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search patten is all lowrcase, case-sensitive otherwise

" replace <TAB> with spaces
" Tab setting 
"{

set expandtab		
set softtabstop=4       " set number of spaces that a <Tab> counts for
set shiftwidth=4	" governs the '>>' behavior
set smarttab

au FileType Makefile set noexpandtab

"}

" set Line# bg-color
"hi LineNr guibg=#1B1B1B
" set Line# fg-color
"hi LineNr guifg=#737373

" status line {
"set laststatus=2
"set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
"set statusline+=\ \ \ [%{&ff}/%Y]
"set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
"set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

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

" Zoom/Restore current split-window 
"   zoom
nnoremap <C-w>o :mksession! ~/session.vim<CR>:wincmd o<CR>      
"   restore(undo)
nnoremap <C-w>u :source ~/session.vim<CR>




" ---------------------------------------------------------------------------------------------
"  USEFUL SHORTCUTS
" ---------------------------------------------------------------------------------------------
" --- move around splits {
" move to & maximize the below split
" map <C-j> <C-W>j "<C-W>_
" move to & maximize the above split
" map <C-k> <C-W>k "<C-W>_
" move to & maximize the left split
" map <C-h> <C-W>h "<C-W><bar>
" move to & maximize the right split
" map <C-l> <C-W>l "<C-W><bar>
"set wmw=0			" set the min width of a window to 0 so we can maximize others
"set wmh=0			" set the min height of a window to 0 so we can maximize others
"  }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
"map <S-H> gT
" go to next tab
" }
" ---------------------------------------------------------------------------------------------
"  USEFUL SHORTCUTS
" ---------------------------------------------------------------------------------------------
" set leader to
"let mapleader=","
"let g:mapleader=","

" ,/ turn off search highlighting
"nmap <leader>/ :nohl<CR>

" --- move around splits {
" move to & maximize the below split
" map <C-j> <C-W>j "<C-W>_
" move to & maximize the above split
" map <C-k> <C-W>k "<C-W>_
" move to & maximize the left split
" map <C-h> <C-W>h "<C-W>_
" move to & maximize the right split
" map <C-l> <C-W>l "<C-W>_
"set wmw=0			" set the min width of a window to 0 so we can maximize others
"set wmh=0			" set the min height of a window to 0 so we can maximize others
"  }

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
"map <S-H> gT
" go to next tab
"map <S-L> gt

" <Esc>
"imap <S-CR> <Esc>

" Max H of current window
"map <C-m> <C-w>300_

" Toggle Max current window
"map <C-o> <C-w>o

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





"most settings are taken from
"http://stevelosh.com/blog/2010/09/coming-home-to-vim/
"
syntax on
filetype off		"Required by vundle

set hidden 			"Leave hidden buffers open
set history=100 	"save 100 last commands
set number			"enable line numbering
set autoindent		"enable autoindentation
set shiftwidth=4 	"set tab size to 4 spaces
set tabstop=4
set expandtab       "expand tabs to spaces
set nocompatible	"disable vi compatibility
set relativenumber	"show line numbers relative to current line
set undofile		"create undo file so you can undo changes even after re-opening file
set encoding=utf-8
set scrolloff=5		"show lines below/above cursor when scrolling
set showmode
set wildmenu		"show autocompletion for command
set wildmode=list:longest,full
set mouse=a			"enable full mouse control
set visualbell		"flash windows instead of beeping when error occurs
set ttyfast			"fast performance
"set cursorline		"highlight current line
"hi CursorLine   cterm=NONE ctermbg=#AFED3B guibg=#AFED3B guifg=white
set statusline=2	"shows status line always
set ignorecase		"search case-sensitively only if at least one letter is capitalized
set smartcase		
set incsearch		"highlight search patterns
set showmatch
set hlsearch
set wrap			"line wrapping
set linebreak		"don't break words
set nolist			"ensures that linebreak will work
set textwidth=79
set formatoptions=qrn1
set pastetoggle=<F2>		"disable indentation when pasting text
let g:rainbow_active = 1	"enable parentheses coloring
set laststatus=2			"enable airline
set t_Co=256				"nice coloring
set splitbelow				"open new horizontal split at the bottom
set splitright				"open new vertical split on the right
set foldmethod=indent       "fold based on indents
set backspace=indent,eol,start


"######## Vundle ############################
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Load Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-latex/vim-latex'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'davidhalter/jedi-vim'
Plugin 'luochen1990/rainbow'
Plugin 'rstacruz/sparkup'
Plugin 'vim-airline/vim-airline'
Plugin 'wincent/command-t'
Plugin 'tpope/vim-vinegar'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on

"########## RAINBOW PARENTHESES ##############
"
" Activate rainbow parentheses
let g:rainbow_active = 1

" Configure rainbow parentheses
    let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

"####################################################################


"Configuring syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_stl_format = "[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]"

"configure vim-latex
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

"========== Commands =============
"execute this file
command Pyrun execute "!python %" 

"execute this file with commands
function PyrunArgFunc(arg)
	execute "!python % " . a:arg 
endfunction
command! -nargs=1 PyrunArg call PyrunArgFunc(<f-args>)

"start NERDTree when vim starts
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p
autocmd VimEnter * hi Normal ctermbg=black

command Vimrc execute ":tabnew ~/.vimrc"
"========== Load Plugins =========
filetype plugin indent on		"enable file-type based automatic indentation

"========== Custom Mappings =============
let mapleader = ","
nmap <C-a> G$vggy
map <C-c> y

"handle syntastic
map <F7> :SyntasticCheck<CR>
map <F8> :SyntasticReset<CR>

"Run current file in python
map <F5> :Pyrun<CR>
map <F6> :PyrunArg<Space>
map <F3> :NERDTree<CR>

"highlight current line permanently - enter :match to remove highlighting
:nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

"remove search pattern highlighting
nnoremap <leader><space> :noh<cr>

"use tab to find brackets
nnoremap <tab> %
vnoremap <tab> %

"moving around in split window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"fold with space bar
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

"make j and k move the cursor to adjacent displayed line rather than file line
nnoremap j gj
nnoremap k gk

"========== Autocomplete parenteses ====
inoremap <leader>' ''<ESC>i
inoremap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
inoremap <leader>{<CR> {<CR>}<Esc>ko

" grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" Save on lost of focus
au FocusLost * :wa

"ctrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

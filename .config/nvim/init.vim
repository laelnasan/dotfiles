" Plugins
call plug#begin('~/.config/nvim/plugged')
	Plug 'honza/vim-snippets'
	Plug 'itchyny/lightline.vim'
	Plug 'morhetz/gruvbox'
	Plug 'vimlab/split-term.vim'
call plug#end()

" gruvbox
	autocmd vimenter * ++nested colorscheme gruvbox

" lightline
	let g:lightline = {'colorscheme': 'one',}

" Vim general settings

" " Tab printing
	set tabstop=3		" width of printed tab character
	set shiftwidth=3	" width of an indent
	set softtabstop=0	" used for mixed tabs and spaces
	"set noexpandtab	" don't replace tabs for spaces

" " Line Number
	set number relativenumber

" " But not for terminals
	autocmd TermOpen * setlocal nonumber norelativenumber

" " Enter insert-mode automatically on terminals
   autocmd BufEnter term://* startinsert
	autocmd BufLeave term://* stopinsert

" " Maintain the <A-hjkl> behavior for all windows
   nmap <silent> <A-k> :wincmd k<CR>
	nmap <silent> <A-j> :wincmd j<CR>
	nmap <silent> <A-h> :wincmd h<CR>
	nmap <silent> <A-l> :wincmd l<CR>

" " Highlight column 80
	let &colorcolumn="73,".join(range(81,120),",")
	hi ColorColumn ctermbg=black ctermfg=darkred

" " Highlight cursor line
	set cursorline
	hi CursorLine cterm=none term=none ctermbg=darkgray

" " List unprintable characters
	set wrap
	set showbreak=↪\ 
	set list listchars=tab:\ \ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" " Relative path search
	set path+=./**

" " Spelling
	set spelllang=pt_br,en_us

" " Change Window title
	set title

" " set formatprg
"	set formatprg=par\ -jw72

" " set mouse
	set mouse=a

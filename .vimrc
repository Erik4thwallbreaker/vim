set wildmode=full:lastused
set wildmenu                                                                " better : mode auto complete
set wildoptions=pum

set hidden
" PLUGINS
"#############
	call plug#begin()
		Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }
		Plug 'https://github.com/Valloric/YouCompleteMe'
		Plug 'jnurmine/Zenburn'
		Plug 'preservim/nerdcommenter'
		Plug 'airblade/vim-gitgutter'                                           " integrate git into nvim
	call plug#end()



" MISC SETTINGS
"#############
	set mouse=a
	let g:NERDTreeWinPos = "right"
	let NERDTreeShowHidden=1
	let NERDTreeQuitOnOpen=1
	set backspace=indent,eol,start



" HOTKEYS
"#############
	" JK to escape
	inoremap <special> jk <ESC>

	" NERDTree
	nmap <ESC>t :NERDTree<CR>

	" Hotkeys for commenting: Mark the blocks you want and press # or -#
	noremap <silent> # :s/^/#/<cr>:noh<cr>
	vnoremap <silent> -# :s/^#//<cr>:noh<cr>

	" Space instead of alt shift
	nnoremap <SPACE> <Nop>
	let mapleader=" "

	" NERDCommenter hotkeys
	map <leader>kc :call nerdcommenter#Comment(0,"comment")<cr>
	map <leader>ku :call nerdcommenter#Comment(0,"uncomment")<cr>
	map <leader>kt :call nerdcommenter#Comment(0,"toggle")<CR>

	" Hotkey for save, (compile) and execute 
	autocmd FileType python map <buffer> <leader>ef :w<CR>:! 'python3' % <CR>
	autocmd FileType python map <buffer> <leader>eg  :w<CR>:! 'python' % <CR>
	autocmd FileType make map <buffer> <leader>ef :w<CR>:! 'make' <CR>
	map <leader>et <esc>:! 'clear' <CR>
	"nnoremap <leader>et :!clear <CR>

	"autocmd FileType python map <buffer> <leader>ef :w<CR>:exec '!python3' shellescape(@%, 1)<CR> 
	"autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
	"autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
	"autocmd FileType python map <buffer> <F8> <esc>:! 'clear' <CR>


	" SESSIONS
	:command! LOAD :source Session.vim
	:command! SAVE :mksession!
	:command! SAVEQ :mksession! | qa
	:command! SAVEX :mksession! | w | qa

	" Common File Access
	:command! VIMRC :e ~/.vimrc

" VISUAL MODIFICATIONS
"######################
	
	set rnu
	set nu
	colorscheme zenburn



" SYNTAX MANAGEMENT
"###################
	" Use python
	syntax on
	filetype on
	au BufNewFile,BufRead ?\+.sage setf py

	" Make tabs correctly in python
	set autoindent tabstop=4 shiftwidth=4
	set noet
	
	autocmd BufNewFile,BufRead *.sage :set filetype=python
	autocmd FileType python setlocal noexpandtab
	:command! BASHRC :e ~/.bashrc 

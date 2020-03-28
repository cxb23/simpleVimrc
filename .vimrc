set nu
set hlsearch
set incsearch
set wrapscan
set encoding=utf8
set mouse=a
syntax on


imap <C-d> <esc>ddi
noremap <C-f> :execute "grep! " . expand("<cword>"). " -r " . searchPath <cr>:copen<cr>
vnoremap <leader>f :let tmpSearch=shellescape(@")<cr>:execute "grep! " . tmpSearch . " -r " . searchPath <cr>:copen<cr>
noremap <leader>f :let tmpSearch=shellescape(@")<cr>:execute "grep! " . tmpSearch . " -r " . searchPath <cr>:copen<cr>
noremap <leader>p :let g:searchPath=expand('%:h')<cr>
inoremap jk <esc>
noremap ev :vsplit $MYVIMRC <cr>
noremap sv :source $MYVIMRC <cr>
inoremap <leader>s <esc>:w!<cr>i
noremap <leader>s <esc>:w!<cr>
inoremap <leader>x <esc>:q!<cr>
noremap <leader>x <esc>:q!<cr>

function Findall(something)
	let needsearch=shellescape(a:something)
	execute "grep! " . needsearch . " -r " . g:searchPath
	echom "grep! " . needsearch . " -r " . g:searchPath
	copen
endfunction


augroup willer
autocmd!
augroup END


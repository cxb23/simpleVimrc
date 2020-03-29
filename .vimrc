set nu
set hlsearch
set incsearch
set wrapscan
set encoding=utf8
set mouse=a
set tabstop=4
set expandtab
set autoindent
syntax on

inoremap <leader>a <esc>ggvG:w !pbcopy<CR>i
noremap <leader>a <esc>ggvG:w !pbcopy<CR>

imap <C-d> <esc>ddi
noremap <C-f> :execute "grep! " . expand("<cword>"). " -r " . searchPath <cr>:copen<cr>
vnoremap <leader>f :let tmpSearch=shellescape(@")<cr>:execute "grep! " . tmpSearch . " -r " . searchPath <cr>:copen<cr>
noremap <leader>f :let tmpSearch=shellescape(@")<cr>:execute "grep! " . tmpSearch . " -r " . searchPath <cr>:copen<cr>
noremap <leader>e :let g:searchPath=expand('%:h')<cr>
inoremap jk <esc>
noremap ev :vsplit $MYVIMRC <cr>
noremap sv :source $MYVIMRC <cr>
inoremap <leader>s <esc>:w!<cr>i
noremap <leader>s <esc>:w!<cr>
inoremap <leader>x <esc>:q!<cr>
noremap <leader>x <esc>:q!<cr>

inoremap <leader>F <esc>:call Findall('')<left><left>
noremap <leader>F <esc>:call Findall('')<left><left>
function! Findall(something)
	let needsearch=shellescape(a:something)
	execute "grep! " . needsearch . " -r " . g:searchPath
	echom "grep! " . needsearch . " -r " . g:searchPath
	copen
endfunction

inoremap <leader>p <esc>:call Findfiles('')<left><left>
noremap <leader>p <esc>:call Findfiles('')<left><left>
function! Findfiles(something)
    execute "!find " . g:searchPath . " -name " . shellescape(a:something) . " > tmp.search.txt"
    vsplit tmp.search.txt
endfunction
augroup willer
autocmd!
augroup END


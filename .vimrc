
iabbrev if if() {<cr>}

set nu
set hlsearch
set incsearch
set wrapscan
set encoding=utf8
"set mouse=a
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
syntax on

noremap <leader>e g:searchPath=expand('%:h')<cr>
inoremap <leader>a <esc>ggvG:w !pbcopy<CR>i
noremap <leader>a <esc>ggvG:w !pbcopy<CR>

noremap <leader>j <esc>:on<CR>

inoremap <leader>O <esc>:bro ol<CR>
noremap <leader>O <esc>:bro ol<CR>
inoremap <leader>o <esc>:ls<CR>:b 
noremap <leader>o <esc>:ls<CR>:b 
inoremap <leader><enter> <esc>o


imap <C-d> <esc>ddi
noremap <C-f> :execute "grep! " . expand("<cword>"). " -r " . searchPath <cr>:copen<cr>
vnoremap <leader>F :let tmpSearch=shellescape(@")<cr>:execute "grep! " . tmpSearch . " -r " . searchPath <cr>:copen<cr>
noremap <leader>F :let tmpSearch=shellescape(@")<cr>:execute "grep! " . tmpSearch . " -r " . searchPath <cr>:copen<cr>
noremap <leader>e :let g:searchPath=expand('%:h')<cr>:echo g:searchPath<cr>
inoremap jk <esc>
noremap ev :vsplit $MYVIMRC <cr>
noremap sv :source $MYVIMRC <cr>
inoremap <leader>s <esc>:w!<cr>
noremap <leader>s <esc>:w!<cr>
noremap <tab> i<tab>
inoremap <leader>x <esc>:q!<cr>
noremap <leader>x <esc>:q!<cr>
noremap <leader>t <esc>:tabs<cr>

inoremap <leader>f <esc>:call Findall('')<left><left>
noremap <leader>f <esc>:call Findall('')<left><left>
function! Findall(something)
	let needsearch=shellescape(a:something)
	execute "grep! " . needsearch . " -r " . g:searchPath
	echom "grep! " . needsearch . " -r " . g:searchPath
	copen
endfunction
noremap <leader>P <esc>:execute "!php -l " . expand('%:p')<cr>

inoremap <leader>p <esc>:call Findfiles('')<left><left>
noremap <leader>p <esc>:call Findfiles('')<left><left>
function! Findfiles(something)
    execute "!find " . g:searchPath . " -name " . shellescape('*' . a:something . '*') . " > tmp.search.txt"
    execute "vsplit " . g:searchPath . '/tmp.search.txt'
endfunction
augroup willer
autocmd!
augroup END

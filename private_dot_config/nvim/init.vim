set syntax
set wrap
set number
set hlsearch
set ignorecase
set incsearch
set noswapfile
imap jk <Esc>
set spell
set spell spelllang=en_us

" scripting

" Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

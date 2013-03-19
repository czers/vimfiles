" Basic features
set nocompatible
filetype indent plugin on
syntax on
set hidden
set confirm
set wildmenu
set wildmode=longest:full,full
set showcmd
set hlsearch

" Display, scheme, etc.
set background=dark
colorscheme peachpuff
set number
set ruler
set textwidth=76
set colorcolumn=+1

" Indent and tabulation options
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Disabling arrow keys (to make me learn h,j,k,l)
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Paste mode that does not break indents
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Functions for trimming unwanted spaces
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Promela
au BufNewFile,BufRead *.promela,*.prm           setf promela

" NianioLang
au BufRead,BufNewFile *.nl setfiletype nl

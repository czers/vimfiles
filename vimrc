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
set t_Co=16
set background=dark
colorscheme solarized
set number
set ruler
set textwidth=76
set colorcolumn=+1

" Indent and tabulation options
set shiftwidth=4
set softtabstop=4
set tabstop=4
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

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Promela
au BufNewFile,BufRead *.promela,*.prm setfiletype promela

" NianioLang
au BufNewFile,BufRead *.nl setfiletype nl

" OpenCL
au BufNewFile,BufRead *.opencl,*.cl setfiletype opencl

" Smart Dust
set tags=~/Dropbox/Studia/sd/ivlmgr-tags/tags_smart_dust,~/Dropbox/Studia/sd/ivlmgr-tags/tags_common,~/Dropbox/Studia/sd/ivlmgr-tags/tags_lwip,~/Dropbox/Studia/sd/ivlmgr-tags/tags_stm32

" Code metrics for C
nnoremap <F5> :Metrics<CR>
nnoremap <F6> :Complexity<CR>

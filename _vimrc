set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

filetype plugin on

"editing encoding
let $LANG="zh_CN.UTF-8"
set langmenu=zh_cn.utf-8
set termencoding=utf-8
set encoding=utf-8

"reload menu with UTF-8 encoding
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"file encoding
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,big5,latin1
set nobomb

"Hot key to switch between GBK and UTF-8
set <C-u>=^U
set <C-b>=^B
map <C-u>:set fileencoding=utf-8<CR>
map <C-b>:set fileencoding=gbk<CR>

"Show line number
set number

"Parenthesis matching
set showmatch

"Have vim highlight the target of a search.
set hlsearch
"Do incremental searches.
set incsearch

"Set the width of text to 70 characters.
set textwidth=70

" Tab behavior
set expandtab
set shiftwidth=2
set softtabstop=4
set tabstop=4

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


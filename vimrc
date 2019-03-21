let $HOME=$VIM

set number
set encoding=utf-8

" for python development
" au BufNewFile,BufRead *.py
"    \ set tabstop=4
"    \ set softtabstop=4
"    \ set shiftwidth=4
"    \ set textwidth=79
"    \ set expandtab
"    \ set autoindent
"    \ set fileformat=unix

"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


color srcery

"highlight Normal ctermfg=black ctermbg=white
execute pathogen#infect()
"call pathogen#helptags() " generate helptags in runtime
syntax on
filetype plugin indent on
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=50 columns=120
  autocmd GUIenter * set vb t_vb=
endif

fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

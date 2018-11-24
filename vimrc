let $HOME=$VIM
"set smartindent
"syntax on
set number

"set colorcolumn=80
highlight ColorColumn ctermbg=102 guibg=#2c2d27
let &colorcolumn=join(range(81,999),",")

color srcery
execute pathogen#infect()
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

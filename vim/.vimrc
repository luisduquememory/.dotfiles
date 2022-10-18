"" This are the minimal configs to
"" use when vim is called by an external
"" program through the EDITOR variable
"" I don't use nvim for this, it give me
"" some odd behaviors
call plug#begin()
Plug 'machakann/vim-highlightedyank'
call plug#end()

set number relativenumber
set hlsearch
set cursorline
let g:highlightedyank_highlight_duration = 500

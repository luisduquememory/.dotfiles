" If you change the python interpreter with
" pyenv please remember to install pynvim
" with python -m pip install pynvim

lua <<EOF
require('init')
EOF

"" turn hybrid line numbers on
:set number relativenumber
:set nu rnu
:set cursorline

" Close all buffers except the current
command! BufOnly execute '%bdelete|edit #|normal `"'

syntax enable
filetype plugin indent on

set clipboard+=unnamedplus
set autoread

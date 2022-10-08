lua <<EOF
require('init')
EOF

" Close all buffers except the current
command! BufOnly execute '%bdelete|edit #|normal `"'

syntax enable
"filetype plugin indent on

" highlight text on yank this is documented in the
" official lua API docs
au TextYankPost * silent! lua vim.highlight.on_yank()

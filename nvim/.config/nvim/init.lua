-- Remember to install pynvim
-- if you change the python interpreter

require("user.plugins")
require("user.treesitter")
require("user.nvim-dap")
require("user.lualine")
require("user.lsp")
require("user.telescope")
require("user.hydra")

local g = vim.g
local o = vim.o
local set = vim.opt

g.mapleader = " "
require("user.keybinds") -- Always mapleader before any keybind

-- colorscheme
vim.cmd([[
  if has('termguicolors')
    set termguicolors
  endif
  " For dark version.
  set background=dark
  " Set contrast.
  " This configuration option should be placed before `colorscheme gruvbox-material`.
  " Available values: 'hard', 'medium'(default), 'soft'
  let g:gruvbox_material_background = 'medium'
  " For better performance
  let g:gruvbox_material_better_performance = 1
  colorscheme gruvbox-material
]])

-- I'm not sure how to translate this to lua syntax
-- this enabled highlight on yank
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

-- enable fish filetype recognition
vim.cmd([[autocmd BufRead,BufNewFile *.fish setfiletype fish]])

-- Indentation
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

set.mouse = ""
set.cursorline = true

-- relative line numbers
set.number = true
set.relativenumber = true

-- clipboard config
set.clipboard = "unnamedplus"

set.autoread = true
set.syntax = "enabled"

-- this is used by which-key
set.timeoutlen = 500

-- this enable letters autoincrementing
set.nrformats = "bin,hex,alpha"

-- GUI font
set.guifont = "Fira Code:h18"

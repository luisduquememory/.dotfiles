-- Remember to install pynvim
-- if you change the python interpreter

require("user.plugins")
require("user.treesitter")
require("user.nvim-dap")
require("user.lualine")
require("user.lsp")
require("user.toggleterm")
require("user.telescope")
require("user.hydra")

local g = vim.g
local o = vim.o
local set= vim.opt

g.mapleader = " "
require("user.keybinds") -- Always mapleader before any keybind

vim.cmd[[colorscheme dracula]]

g.hardtime_default_on = 1000

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
set.clipboard  = "unnamedplus"

set.autoread = true

-- this is used by which-key
set.timeoutlen = 500

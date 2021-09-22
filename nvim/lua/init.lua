-- Remember to install pynvim
-- if you change the python interpreter

require("user.plugins")
require("user.treesitter")
require("user.nvim-dap")
require("user.lualine")
require("user.lsp")
require("user.toggleterm")

local general_settings = vim.g
local global_variables = vim.o
local set= vim.opt

general_settings.mapleader = " "
require("user.keybinds") -- Always mapleader before any keybind

vim.cmd[[colorscheme dracula]]

general_settings.hardtime_default_on = 1000

-- Indentation
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

set.mouse = ""

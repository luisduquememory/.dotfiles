local function normal_map(k, v)
    vim.keymap.set("n", k, v, { silent = false })
end

local function visual_map(k, v)
    vim.keymap.set("v", k, v, { silent = false })
end
-- Misc
normal_map("<Leader>ve", ":e $MYVIMRC<CR>")
normal_map("<Leader>vr", ":source $MYVIMRC<CR>")
normal_map("<Leader>ww", ":w<CR>")
normal_map("<Leader>w", "<C-w>")
normal_map("<Leader>h", ":Telescope help_tags <CR>")
-- I changed f to t, is more confortable for me using dvorak
normal_map("t", "f")
normal_map("T", "F")
normal_map("f", "t")
normal_map("F", "T")
visual_map("t", "f")
visual_map("T", "F")
visual_map("f", "t")
visual_map("F", "T")
-- B Buffers and files
normal_map("<Leader>bb", ":Telescope buffers <CR>")
normal_map("<Leader>d", ":bd<CR>")
normal_map("<Leader>f", ":Telescope find_files <CR>")
normal_map("<Leader>F", ":Telescope git_files <CR>")

--debugger
normal_map("<Leader>sc", ":lua require'dap'.continue()<CR>")
normal_map("<Leader>sk", ":lua require'dap'.terminate()<CR>")
normal_map("<Leader>sb", ":lua require'dap'.toggle_breakpoint()<CR>")
normal_map("<Leader>sB", ":lua require'dap'.clear_breakpoints()<CR>")
normal_map("<Leader>so", ":lua require'dap'.step_over()<CR>")
normal_map("<Leader>sO", ":lua require'dap'.step_out()<CR>")
normal_map("<Leader>si", ":lua require'dap'.step_into()<CR>")
normal_map("<Leader>sr", ":lua require'dap'.repl.toggle()<CR><C-w>j")

local dap_hydra = require("hydra")

local hint = [[
	_c_: continue ^^^  _b_: toggle breakpoint ^^^ _k_: terminate
	_n_: step over ^^^ _B_: clear breakpoints
	_o_: step out
	_i_: step into
	_r_: toggle repl
	^^^
 	_q_: exit
]]


dap_hydra({
	name = "Debug Adapter",
	mode = { "n" },
	body = "<C-d>",
	hint = hint,
	config = {
		buffer = bufnr,
		color = 'pink',
		invoke_on_body = true,
		hint = {
		   type = 'window',
		   border = 'rounded',
		},
	},
	heads = {
		-- move between windows
		{"c", ":lua require'dap'.continue()<CR>"},
		{"k", ":lua require'dap'.terminate()<CR>"},
		{"b", ":lua require'dap'.toggle_breakpoint()<CR>"},
		{"B", ":lua require'dap'.clear_breakpoints()<CR>"},
		{"n", ":lua require'dap'.step_over()<CR>"},
		{"o", ":lua require'dap'.step_out()<CR>"},
		{"i", ":lua require'dap'.step_into()<CR>"},
		{"r", ":lua require'dap'.repl.toggle()<CR><C-w>j"},

		-- exit this Hydra
		{ "q", nil, { exit = true, nowait = true } },
	},
})

function activate_dap_hydra()
	dap_hydra:activate()
end

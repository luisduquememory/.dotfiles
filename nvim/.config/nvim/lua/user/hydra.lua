local Hydra = require('hydra')
local dap = require'dap'

local hint = [[
  Steps       Session             Breakpoints     Windows
  _n_: over     _s_: start/continue   _b_: toggle	_j_: down
  _i_: into     _x_: quit	        _B_: clear all    _k_: up
  _o_: out      _X_: stop	        _L_: list         _h_: left
  _c_: cursor   _r_: repl                             _l_: right

------------------------------------------------------------
_C_: commands _q_: exit
]]

local dap_hydra = Hydra({
   hint = hint,
   config = {
      color = 'pink',
      invoke_on_body = true,
      hint = {
         position = 'bottom',
         border = 'rounded'
      },
   },
	 name = 'dap',
   mode = {'n','x'},
   body = '<leader>hd',
   heads = {
      { 'n', dap.step_over, { silent = true } },
      { 'i', dap.step_into, { silent = true } },
      { 'o', dap.step_out, { silent = true } },
      { 'c', dap.run_to_cursor, { silent = true } },
      { 's', dap.continue, { silent = true } },
      { 'x', ":lua require'dap'.disconnect({ terminateDebuggee = false })<CR>", {exit=true, silent = true } },
      { 'X', dap.close, { silent = true } },
      { 'C', ":lua require('dapui').close()<cr>:DapVirtualTextForceRefresh<CR>", { silent = true } },
      { 'b', dap.toggle_breakpoint, { silent = true } },
      { 'q', nil, { exit = true, nowait = true } },

      { 'B', dap.clear_breakpoints, { silent = true } },
      { 'L', ":lua require'dap'.list_breakpoints()<CR>:Telescope quickfix<CR>", { silent = true } },
      { 'C', ":Telescope dap commands<CR>" },
      { 'r', ":lua require'dap'.repl.open()<CR>" },
      { 'j', "<C-w>j" },
      { 'k', "<C-w>k" },
      { 'h', "<C-w>h" },
      { 'l', "<C-w>l" },
   }
})
Hydra.spawn = function(head)
	if head == 'dap-hydra' then
		dap_hydra:activate()
	end
end

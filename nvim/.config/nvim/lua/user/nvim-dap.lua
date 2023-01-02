require("dap-python").setup("$HOME/.virtualenvs/debugpy/bin/python")
table.insert(require("dap").configurations.python, {
	type = "python",
	request = "attach",
	name = "sw plugin: remote attach",
	host = "localhost",
	port = 5678,
	pathMappings = {
		{ ["localRoot"] = "${workspaceFolder}", ["remoteRoot"] = "./src" },
	},
})
-- UI config
local dap, dapui = require("dap"), require("dapui")
dapui.setup({
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				"breakpoints",
				"stacks",
				"watches",
				{ id = "scopes", size = 0.25 },
			},
			size = 40, -- 40 columns
			position = "left",
		},
		{
			elements = {
				"repl",
			},
			size = 0.25, -- 25% of total lines
			position = "bottom",
		},
	},
})
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- REPL completation
require("cmp").setup({
	enabled = function()
		return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
	end,
})

require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
	sources = {
		{ name = "dap" },
	},
})

local floaterm_dimensions = "--height=0.9 --width=0.9"

local function map(modes, keybinding, action)
	for _, mode in ipairs(modes) do
		vim.keymap.set(mode, keybinding, action, { silent = false })
	end
end

local leader_prefix = { prefix = "<leader>" }
local wk = require("which-key")

-- I haven't found how to do a double space with which-key yet
map({ "n" }, "<Leader><Leader>", ":Telescope find_files <CR>")

-- Return to normal mode from terminal mode
map({ "t" }, "<C-Q>", "<C-\\><C-n>")

-- Scroll without loosing the cursor
map({ "n" }, "<C-d>", "<C-d>zz")
map({ "n" }, "<C-u>", "<C-u>zz")
map({ "n" }, "n", "nzz")
map({ "n" }, "N", "Nzz")

-- globals
wk.register({
	C = { ":Telescope commands<CR>", "Command search" },
	H = { ":Telescope help_tags<CR>", "Help tags" },
	S = { ":%s///ng<CR>", "Full search count" },
	a = { '"_', "Black hole register" },
	c = { ":", "Command entry", silent = false },
	d = { "<CMD>lua vim.diagnostic.show()<CR><CMD>Telescope quickfix<CR>", "Show diagnostics" },
	h = { ":lua require'hydra'.spawn('dap-hydra')<CR>", "DAP" },
	m = { ":Telescope marks<CR>", "Marks" },
	n = { ":noh<CR>", "No search selection" },
	o = { ":on<CR>", "Only" },
	q = { ":Telescope quickfix<CR>", "QuickFix" },
	r = { ":Telescope registers<CR>", "show registers" },
	w = { "<C-w>w", "Next window" },
}, leader_prefix)

-- projects
wk.register({
	p = {
		name = "project", -- group name
		g = { ":Telescope live_grep <CR>", "Grep Search" },
		p = { ":lua require'telescope'.extensions.project.project{}<CR>", "Switch project" },
	},
}, leader_prefix)

-- buffers
wk.register({
	b = {
		name = "buffers", -- group name
		b = { ":Telescope buffers <CR>", "Find buffer" },
		d = { ":bd<CR>", "Close current" },
		c = { ":bufdo bwipeout<CR>", "Close all" },
		f = {
			name = "format",
			j = { "<CMD>%! jq .<CR><CMD>w<CR>", "json with jq" },
			p = { "<CMD>!black %<CR>", "python with black" },
		},
	},
}, leader_prefix)

-- lsp
wk.register({
	s = {
		name = "LSP", -- group name
		K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Displays hover information about a symbol" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Select code action" },
		d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show diagnostics" },
		g = {
			name = "goto",
			D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
			d = { ":Telescope lsp_definitions<CR>", "Definition" },
			i = { ":Telescope lsp_implementations<CR>", "Implementations" },
			o = { ":Telescope lsp_type_definitions<CR>", "Type's definition" },
			r = { ":Telescope lsp_references<CR>", "References" },
			s = { ":Telescope lsp_document_symbols<CR>", "Document symbols" },
		},
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol" },
		R = { "<cmd>LspRestart<CR>", "Restart server" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Display signature information" },
	},
}, leader_prefix)

-- floaterm
map({ "t", "n" }, "<C-T>", "<CMD>FloatermToggle<CR>")
map({ "t" }, "<C-S>", "<CMD>FloatermNext<CR>")
map({ "t" }, "<C-H>", "<CMD>FloatermPrev<CR>")
wk.register({
	t = {
		name = "floaterm",
		v = { ":FloatermNew " .. floaterm_dimensions .. " vifm<CR>", "Vifm" },
		n = { ":FloatermNew " .. floaterm_dimensions .. "<CR>", "New" },
	},
}, leader_prefix)

-- git
wk.register({
	g = {
		name = "Git",
		a = { ":Git add % <CR>", "Add current file" },
		b = { ":Git blame<CR>", "Blame" },
		g = { ":Git<CR><CMD>on<CR>", "Status" },
		p = { ":Git push<CR>", "Push" },
		r = { ":GMove ", "Rename current file" },
		s = { ":Gvdiffsplit!<CR>", "Open diff for conflict resolution" },
	},
}, leader_prefix)

wk.register({
	t = {
		t = {
			name = "Tests",
			d = { "<CMD>lua require('neotest').run.run({strategy = 'dap'})<CR>", "Debug nearest" },
			f = { "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Run current file" },
			p = { "<CMD>lua require('neotest').output_panel.toggle()<CR>", "Toggle output panel" },
			r = { "<CMD>lua require('neotest').run.run()<CR>", "Run nearest" },
			t = { "<CMD>lua require('neotest').summary.toggle()<CR>", "Toggle summary" },
		},
	},
}, leader_prefix)

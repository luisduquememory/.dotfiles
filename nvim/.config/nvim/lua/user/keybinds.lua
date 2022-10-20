local floaterm_dimensions = "--height=0.9 --width=0.9"

local function map(modes, keybinding, action)
	for _, mode in ipairs(modes) do
		vim.keymap.set(mode, keybinding, action, { silent = false })
	end
end

local leader_prefix = { prefix = "<leader>" }
local wk = require("which-key")

-- I haven't found how to do a double space with which-key yet
map({"n"}, "<Leader><Leader>", ":Telescope find_files <CR>")

-- globals
wk.register({
	c = {":Telescope command_palette<CR>", "Command palette" },
	q = {":Telescope quickfix<CR>", "QuickFix" },
	o = {":on<CR>", "Only"},
  }, leader_prefix)

-- projects
wk.register({
  p = {
    name = "project", -- group name
    g = {":Telescope live_grep <CR>", "Grep Search"},
    p = {":lua require'telescope'.extensions.project.project{}<CR>", "Switch project" },
  },
}, leader_prefix)

-- buffers
wk.register({
	b = {
	  name = "buffers", -- group name
	  b = {":Telescope buffers <CR>", "Find buffer"},
	  d = {":bd<CR>", "Close buffer"},
    f = {
      name = "format",
      j = {"<CMD>%! jq .<CR><CMD>w<CR>", "json with jq"},
    }
	},
}, leader_prefix)

-- hydra
wk.register({
	h = {
	  name = "hydras",
	  d = {":lua require'hydra'.spawn('dap-hydra')<CR>", "DAP"},
	},
}, leader_prefix)

-- lsp
wk.register({
	s = {
	  name = "LSP", -- group name
	  K = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Displays hover information about a symbol"},
      a = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "Select code action"},
      d = {"<cmd>lua vim.diagnostic.open_float()<CR>", "Show diagnostics"},
      g = {
        name = "goto",
        D = {"<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration"},
        d = {":Telescope lsp_definitions<CR>", "Definition"},
        i = {":Telescope lsp_implementations<CR>", "Implementations"},
        o = {":Telescope lsp_type_definitions<CR>", "Type's definition"},
        r = {":Telescope lsp_references<CR>", "References"},
        s = {":Telescope lsp_document_symbols<CR>", "Document symbols"},
      },
      r = {"<cmd>lua vim.lsp.buf.rename()<CR>", "Rename symbol"},
      s = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Display signature information"},
	},
}, leader_prefix)

-- floaterm
map({"t", "n"}, "<C-T>", "<CMD>FloatermToggle<CR>")
map({"t"}, "<C-N>", "<CMD>FloatermNext<CR>")
map({"t"}, "<C-P>", "<CMD>FloatermPrev<CR>")
wk.register({
	t = {
	  name = "floaterm",
	  v = {":FloatermNew " .. floaterm_dimensions .. " vifm<CR>", "Vifm"},
	  n = {":FloatermNew " .. floaterm_dimensions .. "<CR>", "New"},
	},
}, leader_prefix)

-- git
wk.register({
	g = {
	  name = "Git utils",
	  r = {":GMove ", "Rename current file"},
	},
}, leader_prefix)

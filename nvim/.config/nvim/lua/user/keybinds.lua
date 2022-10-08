local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = false })
end

local leader_prefix = { prefix = "<leader>" }
local wk = require("which-key")

-- I changed f to t, is more confortable for me using dvorak
map("n", "t", "f")
map("n", "T", "F")
map("n", "f", "t")
map("n", "F", "T")

map("v", "t", "f")
map("v", "T", "F")
map("v", "f", "t")
map("v", "F", "T")

-- I haven't found how to do a double space with which-key yet
map("n", "<Leader><Leader>", ":Telescope find_files <CR>")

-- globals
wk.register({
	c = { ":Telescope command_palette<CR>", "Command palette" },
	q = { ":Telescope quickfix<CR>", "QuickFix" },
  }, leader_prefix)

-- projects
wk.register({
  p = {
    name = "project", -- group name
    f = {":Telescope git_files<CR>", "Find files avoiding gitignores"},
	g = {":Telescope live_grep <CR>", "Grep Search"},
	p = {":lua require'telescope'.extensions.project.project{}<CR>", "Switch project" },
  },
}, leader_prefix)

-- buffers
wk.register({
	b = {
	  name = "buffers", -- group name
	  b = {":Telescope buffers <CR>", "Find buffer"},
	  d = {":bd<CR>", "Close buffer"}
	},
}, leader_prefix)


-- Git
wk.register({
	g = {
	  name = "Git", -- group name
	  g = {":Git<CR>:on<CR>", "Git status"},
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

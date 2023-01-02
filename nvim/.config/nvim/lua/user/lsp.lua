local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"dockerls",
	"eslint",
	"jsonls",
	"marksman",
	"pyright",
	"sumneko_lua",
	"tsserver",
	"vimls",
	"yamlls",
})
lsp.nvim_workspace()
lsp.setup()

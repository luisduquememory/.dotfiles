require("telescope").setup({
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = true,
			file_ignore_patterns = {
				"^.git",
				"^.idea",
				"__pycache__",
			},
		},
	},
	extensions = {
		project = {
			base_dirs = {
				{
					path = "~/code",
					max_depth = 4,
				},
				{
					path = "~/.dotfiles",
				},
			},
			hidden_files = false, -- default: false
			theme = "dropdown",
			order_by = "asc",
		},
	},
})

require("telescope").load_extension("project")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("dap")
require("telescope").load_extension("fzf")

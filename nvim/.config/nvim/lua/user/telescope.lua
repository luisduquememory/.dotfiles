require('telescope').setup({
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
            file_ignore_patterns = {
                ".git",
                ".idea"
            },
        },
    },
    extensions = {
        command_palette = {
            {"Global", {"cd to .dotfiles", "cd $HOME/.dotfiles"}},
            {"Packer", {"Sync", "PackerSync"}},
            {"Vim", {"exit", ":qa"}}},
        project = {
            base_dirs = {{
                path = '~/code',
                max_depth = 4
            }},
            hidden_files = false, -- default: false
            theme = "dropdown",
            order_by = "asc"
        }
    }
})

require('telescope').load_extension('command_palette')
require'telescope'.load_extension('project')
require("telescope").load_extension("file_browser")
require('telescope').load_extension('dap')

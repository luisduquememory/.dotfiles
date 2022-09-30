require('telescope').setup({
extensions = {
    command_palette = {
    {"Packer",
        {"Sync", "PackerSync"}
    },
    {"Vim",
        { "exit", ":q"},
    }
    },
    project = {
        base_dirs = {
          {path = '~/code', max_depth = 4},
        },
        hidden_files = false, -- default: false
        theme = "dropdown",
        order_by = "asc"
      }
}
})

require('telescope').load_extension('command_palette')
require'telescope'.load_extension('project')

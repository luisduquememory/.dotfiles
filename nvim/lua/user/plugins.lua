-- This file can be loaded by calling `lua require("plugins")` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
    -- Packer is managed by itself
    use "wbthomason/packer.nvim"
    -- Color schema
    use "Mofiqul/dracula.nvim"
    -- Quick-Scope
    use "unblevable/quick-scope"
    -- Indent lines
    use "lukas-reineke/indent-blankline.nvim"
    -- Toggleterm
    use "akinsho/toggleterm.nvim"
    -- status bar
    use {
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true
        }
    }
    -- Fuzzy finder
    use {
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/plenary.nvim"}}
    }
    -- Set delay to single movements hjkl
    use "takac/vim-hardtime"
    -- Fish sintax support
    use "dag/vim-fish"
    -- Autopair symbols
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }
    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    -- Debugger adapter
    use "mfussenegger/nvim-dap"
    use "mfussenegger/nvim-dap-python"
    use "rcarriga/nvim-dap-ui"
    -- LSP
    use {
        "VonHeikemen/lsp-zero.nvim",
        requires = {
        {"neovim/nvim-lspconfig"},
		{"williamboman/nvim-lsp-installer"},
		-- Autocompletion
        {"hrsh7th/nvim-cmp"},
		{"hrsh7th/cmp-buffer"},
		{"hrsh7th/cmp-path"},
		{"saadparwaiz1/cmp_luasnip"},
        {"hrsh7th/cmp-nvim-lsp"},
		{"hrsh7th/cmp-nvim-lua"},
		-- Snippets
        {"L3MON4D3/LuaSnip"},
		{"rafamadriz/friendly-snippets"}}
    }

end)

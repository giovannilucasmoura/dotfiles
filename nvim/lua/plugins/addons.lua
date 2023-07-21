-- Small additions
return {
    -- Enabling LazyVim project addon
    {
        "ahmedkhalf/project.nvim",
        opts = {},
        event = "VeryLazy",
        config = function(_, opts)
            require("project_nvim").setup(opts)
            require("telescope").load_extension("projects")
        end,
        keys = {
            { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
        },
    },
    -- Enabling snippet search with telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "benfowler/telescope-luasnip.nvim",
            config = function()
                require("telescope").load_extension("luasnip")
            end,
        },
    },
    -- Adding extra formatting support to null-ls
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
            local nls = require("null-ls")
            return {
                root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
                sources = vim.list_extend(opts.sources, { nls.builtins.formatting.xq }),
            }
        end,
    },
    -- Disabling LSP autoformat
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = function(_, opts)
            opts.autoformat = false
        end,
    },
}

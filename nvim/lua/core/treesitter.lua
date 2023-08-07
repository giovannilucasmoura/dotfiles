return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" }, -- lazy load on reading buffer or creating file
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>", desc = "Decrement selection", mode = "x" }
    },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = { "bash", "json", "lua", "yaml" },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  }
}

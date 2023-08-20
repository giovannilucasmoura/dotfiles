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
      ensure_installed = { "json", "yaml" },
      incremental_selection = false,
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  }
}

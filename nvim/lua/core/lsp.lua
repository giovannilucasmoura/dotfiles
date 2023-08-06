return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
	  -- enable this once nvim 0.10 stable gets released
          -- prefix = "icons",
        },
        severity_sort = true
      },
      -- inlay hints will only work on neovim > 0.10. try it once a stable release happens
      inlay_hints = {
        enabled = false
      },
      capabilities = {},
      -- format on save
      autoformat = false,
      -- useful for debugging formatter issues
      format_notify = false,
      -- formatting not handled by lsp(for now)
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      servers = {},
      setup = {}
    },
    config = function(_, opts)
      require('mason').setup()
      require('mason-lspconfig').setup()
      
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {}
    end
  }
}

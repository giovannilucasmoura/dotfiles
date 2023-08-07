return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      "mason.nvim",
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
      -- inlay hints will only work on neovim >= 0.10. try it once a stable release happens
      inlay_hints = {
        enabled = false
      },
      capabilities = {},
      -- format on save
      autoformat = false,
      -- useful for debugging formatter issues
      format_notify = false,
      -- formatting not handled by lsp(for now?)
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
    },
    keys = {
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      { "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
      { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help" },
      { "<leader>a", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
      { 'gD', vim.lsp.buf.declaration, desc = "Go to declaration" },
      { 'gd', vim.lsp.buf.definition, desc = "Go to definition" },
      { 'gi', vim.lsp.buf.implementation, desc = "Go to implementation"},
      -- TODO: Figure out what workspaces do for the LSP
      -- { '<space>wa', vim.lsp.buf.add_workspace_folder, desc = "" },
      -- { '<space>wr', vim.lsp.buf.remove_workspace_folder, desc = "" },
      -- { '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end},
      { '<leader>D', vim.lsp.buf.type_definition, desc = "Type definition" },
      { '<leader>cr', vim.lsp.buf.rename, desc = "Rename" },
      { 'gr', vim.lsp.buf.references, desc = "List references" },
      -- Not using the LSP for formatting(for now??)
      -- { '<space>f', function() vim.lsp.buf.format { async = true } end, desc = "Format code" }
    },
    config = function()
      local spec_plugins = require("lazy.core.config").spec.plugins;

      if spec_plugins["neodev"] ~= nil then
        spec_plugins["neodev"].config()
      end

      require('mason').setup()
      require('mason-lspconfig').setup()

      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      }
    end
  },
  {
    'williamboman/mason.nvim',
    keys = { { "<leader>im", desc = "Mason" } }
  }
}

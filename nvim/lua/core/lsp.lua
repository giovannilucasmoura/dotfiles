return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      "mason.nvim",
      "mason-lspconfig.nvim"
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
      -- Format on save
      autoformat = false,
      -- useful for debugging formatter issues
      format_notify = true
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
      {
        '<leader>mF',
        function()
          vim.lsp.buf.format {
            range = {
              ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
              ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
            }
          }
        end,
        desc = "Format (LSP)"
      }
    },
    config = function()
      local spec_plugins = require("lazy.core.config").spec.plugins;

      if spec_plugins["neodev.nvim"] ~= nil then
        spec_plugins["neodev.nvim"].config(_, _)
      end

      local lspconfig = require('lspconfig')

      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            }
          }
        }
      }
      lspconfig.omnisharp.setup {
        cmd = { "OmniSharp", "--languageserver" }
      }
    end
  },
  {
    'williamboman/mason.nvim',
    keys = {{ "<leader>im", function() vim.cmd("Mason") end, desc = "Mason" }}
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = { "lua_ls" }
    },
    config = function(_, opts)
      require('mason').setup()
      require('mason-lspconfig').setup(opts)
    end
  }
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "c_sharp" })
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "omnisharp" })
    end
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {},
      },
      setup = {
        omnisharp = function(_, _)
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              -- local buffer = args.buf
              local client = vim.lsp.get_client_by_id(args.data.client_id)

              if client.name == "omnisharp" then
                local tokenModifiers =
                  client.server_capabilities.semanticTokensProvider.legend.tokenModifiers

                for i, v in ipairs(tokenModifiers) do
                  tokenModifiers[i] = string.gsub(v, "%s*[- ]%s*", "_")
                end
                local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
                for i, v in ipairs(tokenTypes) do
                  tokenTypes[i] = string.gsub(v, "%s*[- ]%s*", "_")
                end
              end
            end,
          })
        return false
        end
      },
    },
  },
}

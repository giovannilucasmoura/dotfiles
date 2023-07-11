-- Original config source: https://github.com/amaanq/nvim-config/blob/6b05d966b2ba496b9c313221c1a80a02da8ccbfe/lua/plugins/extras/lang/csharp.lua
return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
            vim.list_extend(opts.ensure_installed, {
                "c_sharp",
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                omnisharp = {},
            },
            setup = {
                omnisharp = function(_, _)
                    require("lazyvim.util").on_attach(function(client, _)
                        if client.name == "omnisharp" then
                            ---@type string[]
                            local tokenModifiers =
                                client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
                            for i, v in ipairs(tokenModifiers) do
                                tokenModifiers[i] = v:gsub(" ", "_")
                            end
                            ---@type string[]
                            local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
                            for i, v in ipairs(tokenTypes) do
                                tokenTypes[i] = v:gsub(" ", "_")
                            end
                        end
                    end)
                    return false
                end,
            },
        },
    },
}

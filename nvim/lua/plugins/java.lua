-- Original config source: https://github.com/igorgue/dotnvim/blob/0f2cbef476b15c414f476c4c09e4951ef8b69770/lua/plugins/extras/lang/java.lua
return {
    {
        "neovim/nvim-lspconfig",
        ft = { "java" },
        opts = {
            setup = {
        -- stylua: ignore
        jdtls = function() return true end,
            },
        },
    },
    {
        "mfussenegger/nvim-jdtls",
        -- stylua: ignore
        cond = function() return not vim.o.diff end,
        ft = "java",
        config = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "java",
                callback = function()
                    local jdtls = require("jdtls")
                    local wk = require("which-key")
                    local bufnr = vim.api.nvim_get_current_buf()
                    local extract_variable = function()
                        jdtls.extract_variable(true)
                    end
                    local extract_method = function()
                        jdtls.extract_method(true)
                    end

                    wk.register({
                        ["<leader>cJ"] = { name = "+java", buffer = bufnr, mode = { "n", "v" } },
                    })

                    wk.register({
                        i = { jdtls.organize_importsorganize_imports, "Organize imports" },
                        t = { jdtls.test_class, "Test class" },
                        n = { jdtls.test_nearest_method, "Test nearest method" },
                        e = { extract_variable, "Extract variable" },
                        M = { extract_method, "Extract method" },
                    }, {
                        prefix = "<leader>cJ",
                        buffer = bufnr,
                    })

                    wk.register({
                        e = { extract_variable, "Extract variable" },
                        M = { extract_method, "Extract method" },
                    }, {
                        mode = "v",
                        prefix = "<leader>cJ",
                        buffer = bufnr,
                    })

                    jdtls.start_or_attach({
                        cmd = { "jdtls" },
                        settings = {
                            java = {},
                        },
                        root_dir = jdtls.setup.find_root({ ".git", "mvnw", "gradlew", "build.gradle" }),
                    })
                end,
            })

            return true
        end,
    },
}

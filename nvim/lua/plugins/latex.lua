return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_syntax_conceal_disable = true
        vim.g.vimtex_compiler_latexmk = {
            build_dir = ".out",
            options = {
                "-shell-escape",
                "-verbose",
                "-file-line-error",
                "-interaction=nonstopmode",
                "-synctex=1",
            },
        }
    end,
}

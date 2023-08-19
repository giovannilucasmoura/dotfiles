return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { 'bibtex', 'latex' })
    end,
  },
  {
    'lervag/vimtex',
    lazy = false,
    config = function()
      vim.g.vimtex_quickfix_method = vim.fn.executable('pplatex') == 1 and 'pplatex' or 'latexlog'
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_syntax_conceal_disable = true
      vim.g.vimtex_compiler_latexmk = {
        build_dir = '.out',
        options = {
          '-shell-escape',
          '-verbose',
          '-file-line-error',
          '-interaction=nonstopmode',
          '-synctex=1',
        },
      }
    end,
  },
}

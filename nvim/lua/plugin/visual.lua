return {
  {
    'echasnovski/mini.trailspace',
    version = '*',
    config = function()
      require('mini.trailspace').setup()
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    keys = {
      {
        '<leader>dc',
        function()
          require('colorizer').attach_to_buffer(0)
        end,
        desc = 'Attach colorizer',
      },
    },
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    commit = '9637670896b68805430e2f72cf5d16be5b97a22a',
    opts = {
      char = '▏',
      context_char = '▏',
      max_indent_increase = 1,
      show_current_context = true,
      show_trailing_blankline_indent = false,
    },
  },
  {
    'metalelf0/jellybeans-nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme jellybeans-nvim')
    end,
    dependencies = { 'rktjmp/lush.nvim' },
  },
  {
    'xiyaowong/transparent.nvim',
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    config = function()
      require('lsp_lines').setup()
    end,
  },
  {
    'tzachar/local-highlight.nvim',
    config = function()
      require('local-highlight').setup()
    end,
  },
}

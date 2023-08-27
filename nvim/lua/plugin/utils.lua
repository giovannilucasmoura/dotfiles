return {
  {
    'sustech-data/wildfire.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      surrounds = {
        { '(', ')' },
        { '{', '}' },
        { '<', '>' },
        { '[', ']' },
      },
      keymaps = {
        init_selection = '<C-Space>',
        node_incremental = '<C-Space>',
        node_decremental = '<BS>',
      },
      filetype_exclude = { 'qf' },
    },
    config = function(_, opts)
      require('wildfire').setup(opts)
    end,
  },
  {
    'echasnovski/mini.trailspace',
    version = '*',
    config = function()
      require('mini.trailspace').setup()
    end,
  },
  {
    'echasnovski/mini.sessions',
    lazy = false,
    priority = 100,
    keys = function()
      local msessions = require('mini.sessions')

      return {
        {
          '<leader>xw',
          function()
            local sessionname = ''
            -- theres probably a better way to do this
            for i in string.gmatch(vim.fn.getcwd(), '[^/]+') do
              sessionname = i
            end

            msessions.write(sessionname)
          end,
          desc = 'Write session',
        },
        {
          '<leader>xs',
          function()
            msessions.select('read')
          end,
          desc = 'Write session',
        },
        {
          '<leader>xd',
          function()
            msessions.select('delete')
          end,
          desc = 'Write session',
        },
      }
    end,
    version = '*',
    config = function()
      require('mini.sessions').setup()
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function(_, _)
      require('gitsigns').setup({})
    end,
  },
  {
    'm4xshen/hardtime.nvim',
    dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
    opts = {
      disabled_filetypes = { 'qf', 'netrw', 'NvimTree', 'lazy', 'mason' },
      disabled_keys = {
        ['<Up>'] = {},
        ['<Down>'] = {},
        ['<Left>'] = {},
        ['<Right>'] = {},
      },
    },
  },
  {
    'Darazaki/indent-o-matic',
    config = function()
      require('indent-o-matic').setup({})
    end,
  },
  {
    'folke/neodev.nvim',
    opts = {},
    config = function()
      require('neodev').setup()
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
}

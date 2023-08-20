return {
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
}

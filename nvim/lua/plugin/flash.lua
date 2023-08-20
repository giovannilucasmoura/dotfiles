return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    label = { rainbow = { enabled = true } },
  },
  keys = {
    {
      '<leader>s',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
    {
      '<leader>S',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
  },
}

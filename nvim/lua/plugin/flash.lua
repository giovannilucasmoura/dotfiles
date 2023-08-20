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
    -- TODO: Figure out what is this remote mode
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  },
}

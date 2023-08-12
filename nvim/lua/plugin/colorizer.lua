return {
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
}

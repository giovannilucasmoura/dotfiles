return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'telescope-ui-select.nvim',
    },
    opts = {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    },
    config = function(_, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('ui-select')
    end,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
  },
}

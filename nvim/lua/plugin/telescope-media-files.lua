return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'telescope-media-files.nvim',
    },
    opts = {
      extensions = {
        extensions = {
          media_files = {
            filetypes = { 'png', 'webp', 'jpg', 'jpeg', 'pdf' },
          },
        },
      },
    },
    keys = {
      { '<leader>fm', function() require('telescope').extensions.media_files.media_files() end, desc = "Find Media" },
    },
    config = function(_, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('media_files')
    end,
  },
  {
    'nvim-telescope/telescope-media-files.nvim',
  },
}

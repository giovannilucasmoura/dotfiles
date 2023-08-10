return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'telescope-project.nvim',
    },
    opts = {
      extensions = {
        project = {
          base_dirs = {
            { '~/Workspace/', max_depth = 2 },
          },
          theme = 'dropdown',
          sync_with_nvim_tree = true,
          on_project_selected = function(prompt_bufnr)
            require('telescope._extensions.project.actions').change_working_directory(prompt_bufnr, false)
          end,
        },
      },
    },
    keys = {
      { '<leader>ip', function() require('telescope').extensions.project.project{} end, desc = "Projects" },
    },
    config = function(_, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('ui-select')
    end,
  },
  {
    'nvim-telescope/telescope-project.nvim',
  },
}

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'telescope-project.nvim', 'telescope-media-files.nvim' },
    opts = {
      defaults = {
        path_display = { 'truncate' },
      },
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
        media_files = {
          filetypes = { 'png', 'webp', 'jpg', 'jpeg', 'pdf' },
        },
      },
    },
    keys = {
      {
        '<leader>ff',
        function()
          require('telescope.builtin').find_files({ cwd = vim.fn.getcwd() })
        end,
        desc = 'Find files',
      },
      {
        '<leader>fF',
        function()
          require('telescope.builtin').find_files({
            cwd = vim.fn.getcwd(),
            hidden = true,
            no_ignore = true,
          })
        end,
        desc = 'Find files (Full)',
      },
      {
        '<leader>ft',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = 'Find text',
      },
      {
        '<leader>fb',
        function()
          require('telescope.builtin').buffers()
        end,
        desc = 'Find buffer',
      },
      {
        '<leader>fh',
        function()
          require('telescope.builtin').help_tags()
        end,
        desc = 'Find help',
      },
      {
        '<leader>fr',
        function()
          require('telescope.builtin').oldfiles()
        end,
        desc = 'Recent files',
      },

      -- LSP Bindings
      {
        '<leader>gd',
        function()
          require('telescope.builtin').lsp_definitions()
        end,
        desc = 'Go to definition',
      },
      {
        '<leader>gD',
        function()
          require('telescope.builtin').lsp_type_definitions()
        end,
        desc = 'Go to type definition',
      },
      {
        '<leader>gi',
        function()
          require('telescope.builtin').lsp_implementations()
        end,
        desc = 'Go to implementation',
      },
      {
        '<leader>dd',
        function()
          require('telescope.builtin').diagnostics({ bufnr = 0 })
        end,
        desc = 'Document diagnostics',
      },
      {
        '<leader>dD',
        function()
          require('telescope.builtin').diagnostics()
        end,
        desc = 'Workspace diagnostics',
      },
      {
        '<leader>dr',
        function()
          require('telescope.builtin').lsp_references()
        end,
        desc = 'List references',
      },
      {
        '<leader>ds',
        function()
          require('telescope.builtin').lsp_document_symbols()
        end,
        desc = 'List document symbols',
      },
      {
        '<leader>dS',
        function()
          require('telescope.builtin').lsp_workspace_symbols()
        end,
        desc = 'List workspace symbols',
      },

      -- extension bindings
      {
        '<leader>ip',
        function()
          require('telescope').extensions.project.project({})
        end,
        desc = 'Projects',
      },
      {
        '<leader>fm',
        function()
          require('telescope').extensions.media_files.media_files()
        end,
        desc = 'Find Media',
      },
    },
    config = function(_, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('project')
      require('telescope').load_extension('media_files')
    end,
  },
  {
    'nvim-telescope/telescope-project.nvim',
  },
  {
    'nvim-telescope/telescope-media-files.nvim',
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      diagnostics = {
        enable = true,
      },
    },
    keys = {
      {
        '<leader>e',
        function()
          require('nvim-tree.api').tree.toggle({ path = vim.fn.getcwd() })
        end,
        desc = 'Toggle Nvim-Tree',
      },
      {
        '<leader>E',
        function()
          require('nvim-tree.api').tree.focus()
        end,
        desc = 'Refresh Nvim-Tree',
      },
    },
    init = function(plugin)
      require('nvim-tree').setup(plugin.opts)
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = { label = { rainbow = { enabled = true } } },
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
  },
}

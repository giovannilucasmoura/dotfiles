return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      path_display = { 'truncate' }
    }
  },
  keys = {
    {
      '<leader>ff',
      function() require('telescope.builtin').find_files({ cwd = vim.fn.getcwd() }) end,
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
      function() require('telescope.builtin').live_grep() end,
      desc = 'Find text',
    },
    {
      '<leader>fb',
      function() require('telescope.builtin').buffers() end,
      desc = 'Find buffer',
    },
    {
      '<leader>fh',
      function() require('telescope.builtin').help_tags() end,
      desc = 'Find help',
    },
    {
      '<leader>fr',
      function() require('telescope.builtin').oldfiles() end,
      desc = 'Recent files',
    },

    -- LSP Bindings
    {
      '<leader>gd',
      function() require('telescope.builtin').lsp_definitions() end,
      desc = 'Go to definition',
    },
    {
      '<leader>gD',
      function() require('telescope.builtin').lsp_type_definitions() end,
      desc = 'Go to type definition',
    },
    {
      '<leader>gi',
      function() require('telescope.builtin').lsp_implementations() end,
      desc = 'Go to implementation',
    },
    {
      '<leader>dd',
      function() require('telescope.builtin').diagnostics({ bufnr = 0 }) end,
      desc = 'Document diagnostics',
    },
    {
      '<leader>dD',
      function() require('telescope.builtin').diagnostics() end,
      desc = 'Workspace diagnostics',
    },
    {
      '<leader>dr',
      function() require('telescope.builtin').lsp_references() end,
      desc = 'List references',
    },
    {
      '<leader>ds',
      function() require('telescope.builtin').lsp_document_symbols() end,
      desc = 'List document symbols',
    },
    {
      '<leader>dS',
      function() require('telescope.builtin').lsp_workspace_symbols() end,
      desc = 'List workspace symbols',
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
  end,
}

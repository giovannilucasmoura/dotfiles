return {
    'nvim-telescope/telescope.nvim', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { "<leader>ff", function() require('telescope.builtin').find_files({ cwd = vim.fn.getcwd() }) end, desc = "Find files" },
      { "<leader>fF", function() require('telescope.builtin').find_files({ cwd = vim.fn.getcwd(), hidden = true, no_ignore = true }) end, desc = "Find files (Full)" },
      { "<leader>ft", function() require('telescope.builtin').live_grep() end, desc = "Find text" },
      { "<leader>fb", function() require('telescope.builtin').buffers() end, desc = "Find buffer" },
      { "<leader>fh", function() require('telescope.builtin').help_tags() end, desc = "Find help" },
      { "<leader>fr", function() require('telescope.builtin').oldfiles() end, desc = "Recent files" },
    },
    config = function()
      require("telescope").setup()
    end
}

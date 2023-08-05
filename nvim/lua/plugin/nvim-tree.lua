return {
  { 
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
    keys = {
      { "<leader>e", function() require("nvim-tree.api").tree.toggle({ path = vim.fn.getcwd() }) end, desc = "Toggle Nvim-Tree" },
      { "<leader>E", function() require("nvim-tree.api").tree.focus() end, desc = "Refresh Nvim-Tree" }
    },
    init = function() 
      require("nvim-tree").setup()
    end, 
  }
}
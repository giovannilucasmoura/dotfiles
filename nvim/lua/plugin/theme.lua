return {
  'metalelf0/jellybeans-nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd([[colorscheme jellybeans-nvim]])
  end,
  dependencies = { 'rktjmp/lush.nvim' }
}
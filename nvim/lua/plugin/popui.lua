return {
  'hood/popui.nvim',
  lazy = false,
  config = function()
    vim.ui.select = require('popui.ui-overrider')
    vim.ui.input = require('popui.input-overrider')
  end,
}

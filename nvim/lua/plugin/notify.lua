return {
  'rcarriga/nvim-notify',
  opts = {
    timeout = 2500,
  },
  config = function()
    require('notify').setup()
    vim.notify = require('notify')
  end,
}

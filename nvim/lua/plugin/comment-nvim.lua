local binds = {
  line = '<leader>mc',
  block = '<leader>mC',
}

return {
  'numToStr/Comment.nvim',
  opts = {
    toggler = binds,
    opleader = binds,
    mappings = { basic = true, extra = false },
  },
}

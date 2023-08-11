local binds = {
  line = 'mc',
  block = 'mC',
}

return {
  'numToStr/Comment.nvim',
  opts = {
    toggler = binds,
    opleader = binds,
    mappings = { basic = true, extra = false },
  },
}

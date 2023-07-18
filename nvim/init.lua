-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- indentation configuration
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- show absolute line numbers
vim.opt.number = true
vim.opt.relativenumber = false

local opt = vim.opt
local o = vim.o

-- relative line numbers
opt.number = true
opt.relativenumber = true
opt.termguicolors = true -- use true term colors
opt.ignorecase = true -- ignore capitalization on searches
opt.smartcase = true -- ...unless there' an uppercase letter
opt.hlsearch = false -- disable highlighting of previous search
opt.updatetime = 250 -- setting faster value for local-highlight plugin

o.tabstop = 4 -- how many characters a tab occupies
o.softtabstop = 4 -- same thing but for soft tabs
o.shiftwidth = 4 -- how much to indent when using << and >>
o.expandtab = true -- transform tab insertion into multiple spaces
o.autoindent = true -- self explanatory
o.clipboard = 'unnamedplus' -- use system clipboard

vim.g.mapleader = ' ' -- set leader key as <space>

-- delete buffer
vim.keymap.set('n', '<leader>q', function()
  vim.cmd('bd')
end)

require('init') -- load lazy.nvim

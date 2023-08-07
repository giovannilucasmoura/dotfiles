local opt = vim.opt
local o = vim.o

-- show absolute line numbers
opt.number = true
opt.relativenumber = false
opt.termguicolors = true -- use true term colors
opt.ignorecase = true -- ignore capitalization on searches
opt.smartcase = true -- ...unless there's an uppercase letter
opt.hlsearch = false -- disable highlighting of previous search

o.tabstop = 4 -- how many characters a tab occupies
o.softtabstop = 4 -- same thing but for soft tabs
o.shiftwidth = 4 -- how much to indent when using << and >>
o.expandtab = true -- transform tab insertion into multiple spaces

vim.g.mapleader = " " -- set leader key as <space>

require("init") -- load lazy.nvim

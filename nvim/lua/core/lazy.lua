local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local opts = {
  spec = {
    { import = "core.treesitter" },
    { import = "core.lsp" },
    { import = "core.cmp" },
    { import = "plugin" },
    { import = "plugin.lang" }
  },
  checker = {
    enabled = true, -- enable auto updates
    frequency = 432000 -- only check for updates every 5 days
  },
  readme = {
    enabled = true,
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md" },
    skip_if_doc_exists = true,
  },
  change_detection = { enabled = false },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  }
}

require("lazy").setup(opts)
vim.keymap.set('n', '<leader>il', function() vim.cmd("Lazy") end)

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

opts = {
  spec = {
    { import = "plugin" }
  },
  defaults = {
    version = "*" -- install only latest stable for plugins that support semver
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
}

require("lazy").setup(opts)

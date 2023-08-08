return {
  {
    'mhartington/formatter.nvim',
    lazy = false,
    opts = function()
      return {
        logging = true,
        log_level = vim.log.levels.INFO,
        filetype = {
          lua = {
            require('formatter.filetypes.lua').stylua,
          },
          cs = {
            require('formatter.filetypes.cs').dotnetformat,
          },
          ['*'] = { require('formatter.filetypes.any').remove_trailing_whitespace },
        },
      }
    end,
    keys = {
      { '<leader>mf', function() vim.cmd('Format') end, mode = { 'n', 'v' }, desc = 'Format (external)' }
    }
  }
}

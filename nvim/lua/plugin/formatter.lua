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
          ocaml = function()
            return {
              exe = 'ocamlformat',
              args = {
                '--enable-outside-detected-project',
                vim.api.nvim_buf_get_name(0),
              },
              stdin = true,
            }
          end,
          ['*'] = { require('formatter.filetypes.any').remove_trailing_whitespace },
        },
      }
    end,
    keys = {
      { 'mf', function() vim.cmd('Format') end, mode = { 'n', 'v' }, desc = 'Format (external)' },
      { 'mF', function() vim.cmd('Format') end, mode = { 'n', 'v' }, desc = 'Format (external)' }
    }
  }
}

return {
  {
    'mhartington/formatter.nvim',
    lazy = false,
    opts = function()
      return {
        logging = true,
        log_level = vim.log.levels.INFO,
        filetype = {
          lua = { require('formatter.filetypes.lua').stylua },
          cs = function()
            return {
              exe = 'clang-format',
              args = {
                '--assume-filename=.cs',
                '--style=Microsoft',
              },
              stdin = true,
            }
          end,
          java = function()
            return {
              exe = 'clang-format',
              args = {
                '--assume-filename=.java',
                '--style="{BasedOnStyle: LLVM, IndentWidth: 4}"',
              },
              stdin = true,
            }
          end,
          html = { require('formatter.filetypes.html').prettierd },
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
      {
        '<leader>mf',
        function()
          vim.cmd('Format')
        end,
        mode = { 'n', 'v' },
        desc = 'Format (external)',
      },
    },
  },
}

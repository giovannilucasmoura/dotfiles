return {
  {
    'numToStr/Comment.nvim',
    opts = function()
      local binds = {
        line = '<leader>mc',
        block = '<leader>mC',
      }

      return {
        toggler = binds,
        opleader = binds,
        mappings = { basic = true, extra = false },
      }
    end,
  },
  {
    'windwp/nvim-autopairs',
    opts = {
      disable_filetype = { 'TelescopePrompt', 'NvimTree' },
    },
    config = function(_, opts)
      require('nvim-autopairs').setup({ opts })

      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')

      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

      local Rule = require('nvim-autopairs.rule')
      local npairs = require('nvim-autopairs')

      npairs.add_rules({ Rule('<', '>', { 'cs', 'csx', 'java' }) })
    end,
  },
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
                '--style="{BasedOnStyle: WebKit, BreakBeforeBraces: Attach, IndentWidth: 4}"',
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
  {
    'echasnovski/mini.surround',
    version = '*',
    opts = {
      mappings = {
        add = '<leader>msa',
        delete = '<leader>msd',
        find = '<leader>fs',
        find_left = '<leader>fS',
        replace = '<leader>msr',
      },
    },
  },
}

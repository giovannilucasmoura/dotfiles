return {
  {
    'willothy/nvim-cokeline',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    version = '*',
    opts = function()
      local get_hex = require('cokeline.utils').get_hex
      local blue = '#8094B4'
      local black = '#000000'
      local white = '#FFFFFF'
      local red = '#FF0000'
      local yellow = '#FFA500'

      return {
        show_if_buffers_are_at_least = 2,
        default_hl = {
          fg = function(buffer)
            local d = buffer.diagnostics

            if not buffer.is_focused then
              return get_hex('Comment', 'fg')
            end

            if d.errors > 0 then
              return red
            elseif d.warnings > 0 or d.infos > 0 then
              return yellow
            end

            return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'fg')
          end,
          bg = 'NONE',
        },

        tabs = { placement = 'right' },

        sidebar = {
          filetype = 'NvimTree',
          components = {
            {
              text = '  NvimTree',
              fg = function(buffer)
                return buffer.is_focused and black or white
              end,
              bg = function(buffer)
                return buffer.is_focused and blue or 'NONE'
              end,
              style = function(buffer)
                return buffer.is_focused and 'bold' or nil
              end,
            },
          },
        },

        components = {
          {
            text = function(buffer)
              return (buffer.index ~= 1) and '▏' or ' '
            end,
            fg = blue,
          },
          {
            text = function(buffer)
              return ' ' .. buffer.devicon.icon .. ' '
            end,
            fg = function(buffer)
              return buffer.devicon.color
            end,
          },
          {
            text = function(buffer)
              return buffer.unique_prefix
            end,
            fg = function(buffer)
              return buffer.is_focused and get_hex('Normal', 'fg') or get_hex('Comment', 'fg')
            end,
            italic = true,
          },
          {
            text = function(buffer)
              return buffer.filename .. ' '
            end,
            style = function(buffer)
              return buffer.is_focused and 'bold' or nil
            end,
          },
          {
            text = function(buffer)
              local d = buffer.diagnostics

              if d.errors > 0 then
                return ' '
              elseif d.warnings > 0 then
                return ' '
              elseif d.infos > 0 or d.hints > 0 then
                return ' '
              else
                return ''
              end
            end,
            fg = function(buffer)
              local d = buffer.diagnostics

              if not buffer.is_focused then
                return get_hex('Comment', 'fg')
              end

              if d.errors > 0 then
                return red
              elseif d.warnings > 0 or d.infos > 0 then
                return yellow
              else
                return white
              end
            end,
          },
          {
            text = ' ',
          },
        },
      }
    end,
    config = function(_, opts)
      local map = vim.api.nvim_set_keymap

      map('n', '<Leader>p', '<Plug>(cokeline-focus-prev)', { silent = true })
      map('n', '<Leader>n', '<Plug>(cokeline-focus-next)', { silent = true })

      for i = 1, 9 do
        map('n', ('<leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { silent = true })
      end

      require('cokeline').setup(opts)
    end,
  },
  {
    'hood/popui.nvim',
    lazy = false,
    config = function()
      vim.ui.select = require('popui.ui-overrider')
      vim.ui.input = require('popui.input-overrider')
    end,
  },
  {
    'rcarriga/nvim-notify',
    opts = {
      timeout = 2500,
    },
    config = function()
      require('notify').setup({
        background_colour = '#000000',
      })
      vim.notify = require('notify')
    end,
  },
  {
    'echasnovski/mini.starter',
    version = '*',
    config = function()
      require('mini.starter').setup()
    end,
  },
  {
    'aznhe21/actions-preview.nvim',
    keys = {
      {'<leader>ia', function() require('actions-preview').code_actions() end, desc = "Code Action Preview"}
    },
  },
}

return {
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

    return {
      show_if_buffers_are_at_least = 2,
      default_hl = {
        fg = function(buffer)
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
            return ' ' .. buffer.devicon.icon
          end,
          fg = function(buffer)
            return buffer.devicon.color
          end,
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
          text = ' ',
        },
      },
    }
  end,
}

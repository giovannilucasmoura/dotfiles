return {
  {
    'echasnovski/mini.sessions',
    lazy = false,
    priority = 100,
    keys = function()
      local msessions = require('mini.sessions')

      return {
        {
          '<leader>xw',
          function()
            local sessionname = ''
            -- theres probably a better way to do this
            for i in string.gmatch(vim.fn.getcwd(), '[^/]+') do
              sessionname = i
            end

            msessions.write(sessionname)
          end,
          desc = 'Write session',
        },
        {
          '<leader>xs',
          function()
            msessions.select('read')
          end,
          desc = 'Write session',
        },
        {
          '<leader>xd',
          function()
            msessions.select('delete')
          end,
          desc = 'Write session',
        },
      }
    end,
    version = '*',
    config = function()
      require('mini.sessions').setup()
    end,
  },
}

return {
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
}

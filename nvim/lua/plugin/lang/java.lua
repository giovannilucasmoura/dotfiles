return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        'java',
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    ft = { 'java' },
    opts = {
      setup = {
        jdtls = function()
          return true
        end,
      },
    },
  },
  {
    'mfussenegger/nvim-jdtls',
    cond = function()
      return not vim.o.diff
    end,
    ft = 'java',
    config = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'java',
        callback = function()
          local jdtls = require('jdtls')
          local jdtls_path = '/home/giovanni/.programs/jdtls/'

          local config = {
            cmd = {
              'java',
              '-Declipse.application=org.eclipse.jdt.ls.core.id1',
              '-Dosgi.bundles.defaultStartLevel=4',
              '-Declipse.product=org.eclipse.jdt.ls.core.product',
              '-Dlog.protocol=true',
              '-Dlog.level=ALL',
              '-Xmx1g',
              '--add-modules=ALL-SYSTEM',
              '--add-opens',
              'java.base/java.util=ALL-UNNAMED',
              '--add-opens',
              'java.base/java.lang=ALL-UNNAMED',
              '-jar',
              jdtls_path .. 'plugins/org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar',
              '-configuration',
              jdtls_path .. 'config_linux',
              '-data',
              jdtls_path .. 'data/',
            },
            settings = {
              java = {},
            },
            root_dir = jdtls.setup.find_root({ '.git', 'mvnw', 'gradlew', 'build.gradle', 'pom.xml' }),
          }

          local map = vim.keymap.set
          map('n', '<leader>ji', function() jdtls.organize_imports() end)
          map({'n', 'v'}, '<leader>je', function () jdtls.extract_variable({ true }) end)
          map({'n', 'v'}, '<leader>jm', function () jdtls.extract_method({ true }) end)

          jdtls.start_or_attach(config)
        end,
      })

      return true
    end,
  },
}

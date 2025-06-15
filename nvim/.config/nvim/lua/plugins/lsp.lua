return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Autocompletion
      {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        build = 'cargo build --release',
        opts = {
          keymap = { preset = 'default' },
          appearance = { nerd_font_variant = 'mono' },
          completion = { documentation = { auto_show = true } },
          sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
          fuzzy = { implementation = 'prefer_rust_with_warning' },
          signature = { enabled = true }
        },
      },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, {
              buffer = event.buf,
              noremap = true,
              silent = true,
              desc = 'LSP: ' .. desc,
            })
          end
          local mapi = function(keys, func, desc)
            vim.keymap.set('i', keys, func, {
              buffer = event.buf,
              noremap = true,
              silent = true,
              desc = 'LSP: ' .. desc,
            })
          end

          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
          map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
          map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          mapi('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      require('mason-lspconfig').setup({
        automatic_enable = true,
        ensure_installed = {
          'lua_ls',
          'pyright',
          'ruff',
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,

          ['lua_ls'] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = { globals = { 'vim' } },
                },
              },
            })
          end,

          ['ruff'] = function()
            lspconfig.ruff.setup({
              capabilities = capabilities,
              on_attach = function(client, bufnr)
                client.server_capabilities.hoverProvider = false
              end,
            })
          end,

          ['pyright'] = function()
            lspconfig.pyright.setup({
              capabilities = capabilities,
              settings = {
                pyright = {
                  disableOrganizeImports = true,
                },
                python = {
                  analysis = {
                    ignore = { '*' },
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
  -- For Lua development in your Neovim config
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
}

-- local icons = require 'icons'

return {
  {
    'ibhagwan/fzf-lua',
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    cmd = 'FzfLua',
    keys = {
      { '<leader><leader>', '<cmd>FzfLua git_files<cr>',                 desc = '[S]earch [f]iles' },
      { '<leader>sf',       '<cmd>FzfLua git_files<cr>',                 desc = '[S]earch [f]iles' },
      { '<leader>s<',       '<cmd>FzfLua resume<cr>',                    desc = '[S]earch [r]esume last fzf command' },
      { '<leader>sd',       '<cmd>FzfLua lsp_document_diagnostics<cr>',  desc = '[S]earch [d]ocument [d]iagnostics' },
      { '<leader>sD',       '<cmd>FzfLua lsp_workspace_diagnostics<cr>', desc = '[S]earch workspace [d]iagnostics' },
      { '<leader>sk',       '<cmd>FzfLua keymaps<cr>',                   desc = '[S]earch [k]eymaps' },
      { '<leader>sg',       '<cmd>FzfLua live_grep<cr>',                 desc = '[S]earch [g]rep git repo' },
      { '<leader>sg',       '<cmd>FzfLua grep_visual<cr>',               desc = '[S]earch [g]rep git repo',          mode = 'x' },
      { '<leader>sh',       '<cmd>FzfLua help_tags<cr>',                 desc = '[S]earch [h]elp' },
      {
        '<leader>sr',
        function() -- Read from ShaDa to include files that were already deleted from the buffer list.
          vim.cmd 'rshada!'
          require('fzf-lua').oldfiles()
        end,
        desc = '[S]earch [r]ecent files',
      },
      {
        '<leader>sn',
        function()
          require('fzf-lua').files({
            cwd = vim.fn.stdpath('config'),
            prompt = 'Neovim Config> ',
          })
        end,
        desc = '[S]earch in [n]eovim config',
      },
    },
    opts = function()
      return {
        { 'border-fused', 'hide' },
        -- Make stuff better combine with the editor.
        fzf_colors = {
          bg = { 'bg', 'Normal' },
          gutter = { 'bg', 'Normal' },
          info = { 'fg', 'Conditional' },
          scrollbar = { 'bg', 'Normal' },
          separator = { 'fg', 'Comment' },
        },
        fzf_opts = {
          ['--info'] = 'default',
          ['--layout'] = 'reverse-list',
        },
        keymap = {
          builtin = {
            ['<C-ß>'] = 'toggle-help',
            ['<C-a>'] = 'toggle-fullscreen',
            ['<C-i>'] = 'toggle-preview',
            ['<C-f>'] = 'preview-page-down',
            ['<C-d>'] = 'preview-page-up',
          },
        },
        winopts = {
          height = 0.8,
          width = 0.8,
          preview = {
            scrollbar = false,
            layout = 'horizontal',
            horizontal = "right:65%"
          },
        },

        -- Configuration for specific commands.
        -- lsp = {
        --   symbols = {
        --     -- symbol_icons = icons.symbol_kinds,
        --   },
        -- },
        oldfiles = {
          include_current_session = true,
        },
      }
    end,
  },
}

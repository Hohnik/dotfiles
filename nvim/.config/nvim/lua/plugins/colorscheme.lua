return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'tokyonight-moon'

      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require('themery').setup {
        livePreview = true,
        themes = {
          'catppuccin-latte',
          'tokyonight',
          'catppuccin-frappe',
          'catppuccin-macchiato',
          'catppuccin-mocha',
        },
      }
      vim.keymap.set('n', '<leader>cs', '<cmd>Themery<cr>', { desc = '[C]olor[S]cheme', noremap = true })
    end,
  },
}

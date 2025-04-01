return {
  'ellisonleao/glow.nvim',
  cmd = 'Glow',
  init = function()
    vim.keymap.set('n', '<leader>pm', ':Glow<CR>', { desc = '[P]lay [M]arkdown' })
  end,
  config = function()
    require('glow').setup {
      glow_path = '/opt/homebrew/bin/glow',
      install_path = '~/.local/bin',
      border = 'rounded',
      style = 'light',
      pager = false,
      width = 140,
      -- height = 100,
      width_ratio = 0.90, -- overrides with and height
      height_ratio = 0.90,
    }
  end,
}

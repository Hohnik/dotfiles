return {
  'echasnovski/mini.files',
  version = '*',
  config = function()
    require('mini.files').setup()
    vim.api.nvim_set_keymap('n', '<C-p>', ":lua MiniFiles.open()<cr>", { noremap = true, silent = true })
  end
}

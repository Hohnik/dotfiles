--  See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'sql',
  desc = 'Set commentstring for SQL files',
  callback = function()
    vim.opt_local.commentstring = '-- %s' -- Set comment string for SQL to '--'
    vim.keymap.set('n', '<leader>ps', ':w | belowright split | sqlite3 $(ls *.db | head -n 1) < %<CR>',
      { desc = '[P]lay [S]qlite file' })
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  desc = 'Run current python file',
  callback = function()
    vim.keymap.set('n', '<leader>pp', ':w | belowright split | terminal uv run %<CR>', { desc = '[P]lay [P]ython file' })
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  desc = 'Run current line of lua file',
  callback = function()
    vim.keymap.set('n', '<leader>pl', ':.lua<CR>', { desc = '[P]lay [L]ua line' })
  end,
})
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

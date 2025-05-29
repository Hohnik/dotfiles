-- vim.keymap.set('i', 'jk', '<Esc>l')
-- vim.keymap.set('i', 'kj', '<Esc>l')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', 'H', 'zH')
vim.keymap.set('n', 'L', 'zL')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dp', vim.diagnostic.get_prev, { desc = 'Go to [P]revious diagnostic' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.get_next, { desc = 'Go to [N]ext diagnostic' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.api.nvim_set_keymap('n', '<C-p>', ":lua MiniFiles.open()<cr>", { noremap = true, silent = true })

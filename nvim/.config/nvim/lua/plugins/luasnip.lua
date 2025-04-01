return {
  'L3MON4D3/LuaSnip',
  -- install jsregexp (optional!).
  build = 'make install_jsregexp',
  config = function()
    local ls = require 'luasnip'

    -- Load friendly snippets (optional)
    require('luasnip.loaders.from_vscode').lazy_load()
    require('luasnip.loaders.from_lua').load { paths = { '~/.config/nvim/lua/snippets.lua' } }

    -- Set up keybindings
    vim.api.nvim_set_keymap('i', '<C-k>', "<cmd>lua require'luasnip'.jump(1)<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('s', '<C-k>', "<cmd>lua require'luasnip'.jump(1)<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('i', '<C-j>', "<cmd>lua require'luasnip'.jump(-1)<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('s', '<C-j>', "<cmd>lua require'luasnip'.jump(-1)<CR>", { noremap = true, silent = true })
  end,
}

return {
  'ggandor/leap.nvim',
  dependencies = { 'tpope/vim-repeat' },
  config = function()
    local leap = require('leap')
    leap.set_default_mappings()
    vim.api.nvim_set_hl(0, "LeapBackdrop", { fg = "#999999", bg = "NONE" })
    vim.api.nvim_set_hl(0, "LeapLabel", { fg = "#82A3FF", bg = "NONE", bold = true })
  end
}

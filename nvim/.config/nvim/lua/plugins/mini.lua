return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.files').setup()
    require('mini.jump').setup()

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_diagnostics = function()
      return ''
    end

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_lsp = function()
      return ''
    end

    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return ''
      -- return '%2l:%-2v'
    end

    -- ---@diagnostic disable-next-line: duplicate-set-field
    -- statusline.section_fileinfo = function()
    --   -- return filetype and current conda environment
    --   return vim.bo.filetype .. ' ' .. vim.env.CONDA_DEFAULT_ENV
    -- end
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}

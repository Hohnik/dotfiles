return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" }, -- Run on save
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      python = { "ruff_format"},
      lua = { "stylua" },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
  init = function()
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      require("conform").format({ async = true, lsp_fallback = true })
    end, { desc = "Format buffer" })
  end,
}

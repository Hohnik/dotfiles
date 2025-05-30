---@type vim.lsp.Config
return {
  cmd = { 'uvx', 'ty', 'server' },
  filetypes = { 'python' },
  root_markers = { '.venv/', 'pyproject.toml' },
  capabilities = {},
  settings = {
    ty = {}
  },
}

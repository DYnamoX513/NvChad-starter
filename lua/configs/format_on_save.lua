local M = {}

function M.can_format_on_save(bufnr)
  return not (vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat)
end

return M

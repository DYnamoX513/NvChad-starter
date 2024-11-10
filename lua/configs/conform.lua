local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "prettierd", "prettier", stop_after_first = true },
    css = { "prettierd", "prettier", stop_after_first = true },
    html = { "prettierd", "prettier", stop_after_first = true },
    json = { "prettierd", "prettier", stop_after_first = true },

    -- cpp = { "clang-format" },
    -- use ruff-lsp
    -- python = { "isort", "black" },

    sh = { "shfmt" },
  },

  default_format_opts = {
    lsp_format = "fallback",
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
  },
}

return options

local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    -- javascript = { "prettierd", "prettier", stop_after_first = true },
    -- css = { "prettierd", "prettier", stop_after_first = true },
    -- html = { "prettierd", "prettier", stop_after_first = true },
    -- json = { "prettierd", "prettier", stop_after_first = true },

    -- no prettierd
    javascript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },

    -- cpp = { "clang-format" },
    -- use ruff-lsp
    -- python = { "isort", "black" },

    sh = { "shfmt" },
  },

  default_format_opts = {
    lsp_format = "fallback",
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  -- },

  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500 }
  end,
}

vim.api.nvim_create_user_command("FormatToggle", function(args)
  if args.bang then
    -- disable/enable auto format_on_save for current buffer
    vim.b.disable_autoformat = not (vim.b.disable_autoformat or false)
    vim.notify(string.format("Buffer format_on_save %s", vim.b.disable_autoformat and "disabled" or "enabled"))
  else
    -- for global
    vim.g.disable_autoformat = not (vim.g.disable_autoformat or false)
    vim.notify(string.format("Global format_on_save %s", vim.g.disable_autoformat and "disabled" or "enabled"))
  end
end, {
  desc = "Conform Toggle format_on_save",
  bang = true,
})

vim.keymap.set("n", "<leader>tf", ":FormatToggle!<CR>", { desc = "Conform Toggle buffer format_on_save" })
vim.keymap.set("n", "<leader>tF", ":FormatToggle<CR>", { desc = "Conform Toggle global format_on_save" })

return options

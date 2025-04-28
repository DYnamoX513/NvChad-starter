local prettier = { "prettier" }
local prettierd = { "prettierd", "prettier", stop_after_first = true }

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    lsp_fallback = true,

    formatters_by_ft = {
      lua = { "stylua" },

      javascript = prettier,
      css = prettier,
      html = prettier,
      json = prettier,

      -- cpp = { "clang-format" },

      -- python = { "isort", "black" },
      -- use ruff, organizing imports together with format
      python = { "ruff_format", "ruff_organize_imports" },
      -- As of Dec 2024, ruff linting and formatting haven't been unified yet
      -- https://github.com/astral-sh/ruff/issues/8232

      sh = { "shfmt" },
      nix = { "alejandra" },
    },

    default_format_opts = {
      lsp_format = "fallback",
    },

    format_on_save = function(bufnr)
      if require("configs.format_on_save").can_format_on_save(bufnr) then
        -- options will be passed to conform.format()
        return { timeout_ms = 500 }
      end
    end,
  },

  config = function(_, opts)
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

    require("conform").setup(opts)
  end,
}

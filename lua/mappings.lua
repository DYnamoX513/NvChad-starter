require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local tele = require "telescope.builtin"
-- LSP document symbols
map("n", "<leader>fs", tele.lsp_document_symbols, {
  desc = "telescope LSP document symbols",
})

-- Document diagnostics
map("n", "<leader>fd", function()
  tele.diagnostics { bufnr = 0, sort_by = "severity" }
end, {
  desc = "telescope document diagnostics",
})

-- Workspace diagnostics
map("n", "<leader>fD", tele.diagnostics, {
  desc = "telescope workspace diagnostics",
})

-- Find keys
map("n", "<leader>fk", tele.keymaps, {
  desc = "telescope find keymaps",
})

-- Jumping to context (upwards)
map("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true, desc = "Jump to context start" })

-- Conform
map({ "n", "v" }, "<leader>F", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "Conform Format" })

-- lazygit
map({ "n", "t" }, "<A-g>", function()
  require("nvchad.term").toggle {
    pos = "float",
    id = "flg",
    cmd = "lazygit",
    float_opts = { relative = "editor", width = 0.8, height = 0.8, row = 0.05, col = 0.1 },
  }
end, { desc = "terminal toggle lazygit " })

-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open "default"
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec '"normal! \\<RightMouse>"'

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + delta
end

vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(0.1)
end, { desc = "neovide scale up 10%" })
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(-0.1)
end, { desc = "neovide scale down 10%" })
vim.keymap.set("n", "<C-0>", function()
  vim.g.neovide_scale_factor = 1.0
end, { desc = "neovide scale factor reset" })

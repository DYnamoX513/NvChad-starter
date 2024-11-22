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
    float_opts = { relative = "win", width = 0.8, height = 0.8 },
  }
end, { desc = "terminal toggle lazygit " })

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

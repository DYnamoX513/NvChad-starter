require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local tele = require "telescope.builtin"
-- LSP document symbols
map("", "<leader>fs", tele.lsp_document_symbols, {
  desc = "telescope LSP document symbols",
})

-- Find keys
map("", "<leader>fk", tele.keymaps, {
  desc = "telescope find keymaps",
})

-- Jumping to context (upwards)
map("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true, desc = "Jump to context start" })

-- Conform
-- map("", "<leader>F", function()
--   require("conform").format { async = true, lsp_fallback = true }
-- end, { desc = "Format buffer" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

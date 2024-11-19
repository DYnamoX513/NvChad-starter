require "nvchad.options"

-- add yours here!

local o = vim.o

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

o.cursorlineopt = "both" -- to enable cursorline!
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.softtabstop = -1

o.scrolloff = 4
o.sidescrolloff = 4
o.shell = "fish"

if vim.g.neovide then
  vim.print("Neovide " .. vim.g.neovide_version)
  vim.o.guifont = "IosevkaTerm Nerd Font:h14"
  vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
  -- vim.o.guifont = "BlexMono Nerd Font:h13"
  -- Put anything you want to happen only in Neovide here
end

if #vim.api.nvim_list_uis() == 0 then
  print "Running in headless mode"
  vim.o.guifont = "IosevkaTerm Nerd Font:h14"
  vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
end

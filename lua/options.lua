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

o.fileencodings = "ucs-bom,utf-8,gb18030,latin1"

local neovide_settings = function()
  vim.o.guifont = "Iosevka SS08,Symbols Nerd Font:h13"
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"
end

if vim.g.neovide then
  vim.print("Neovide " .. vim.g.neovide_version)
  -- Put anything you want to happen only in Neovide here
  neovide_settings()
end

if #vim.api.nvim_list_uis() == 0 then
  print "Running in headless mode"
  neovide_settings()
end

local open_with_trouble = require("trouble.sources.telescope").open

-- Use this to add more results without clearing the trouble list
local add_to_trouble = require("trouble.sources.telescope").add

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      mappings = {
        i = { ["<C-t>"] = open_with_trouble },
        n = { ["<C-t>"] = open_with_trouble },
      },
    },
  },
}

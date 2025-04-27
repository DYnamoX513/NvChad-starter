return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function(_, opts)
    local open_with_trouble = require("trouble.sources.telescope").open
    -- Use this to add more results without clearing the trouble list
    -- local add_to_trouble = require("trouble.sources.telescope").add
    local trouble_mappings = {
      defaults = {
        mappings = {
          i = { ["<C-t>"] = { open_with_trouble, type = "action", opts = { desc = "open_with_trouble" } } },
          n = { ["<C-t>"] = { open_with_trouble, type = "action", opts = { desc = "open_with_trouble" } } },
        },
      },
    }
    return vim.tbl_deep_extend("error", opts, trouble_mappings)
  end,
}

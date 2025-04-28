return {
  {
    "hrsh7th/nvim-cmp",
    -- Modify NvChad's default opts
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 100,
      })
    end,
  },
  {
    "Exafunction/windsurf.nvim",
    event = "InsertEnter",
    -- main module name
    main = "codeium",
    opts = {
      -- Optionally disable cmp source if using virtual text only
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        key_bindings = {
          -- Accept the current completion.
          accept = "<M-Tab>",
          -- Accept the next word.
          accept_word = false,
          -- Accept the next line.
          accept_line = "<M-l>",
          -- Clear the virtual text.
          clear = false,
          -- Cycle to the next completion.
          next = "<M-]>",
          -- Cycle to the previous completion.
          prev = "<M-[>",
        },
      },
    },
  },
}

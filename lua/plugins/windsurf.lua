return {
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "Exafunction/windsurf.nvim",
      },
    },
    opts = function(_, opts)
      -- opts.sources.providers = opts.sources.providers or {}
      -- opts.sources.providers.windsurf = {
      --   name = "Windsurf",
      --   module = "codeium.blink",
      --   async = true,
      -- }
      -- table.insert(opts.sources.default, 1, "windsurf")
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

local nvlsp = require "nvchad.configs.lspconfig"
-- load defaults i.e. lua_lsp
nvlsp.defaults()

local lspconfig = require "lspconfig"

-- local servers = { "pyright", "ruff_lsp", "clangd" }
local servers = { "rust_analyzer" }
local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init
local capabilities = nvlsp.capabilities

local trouble_symbols = require("trouble").statusline {
  mode = "lsp_document_symbols",
  groups = {},
  title = false,
  filter = { range = true },
  format = "/ {kind_icon}{symbol.name:Normal}",
  hl_group = "WinBar",
}

GetWinbar = function()
  if trouble_symbols.has() then
    return "󰼁 " .. trouble_symbols.get()
  else
    return "󰼂 "
    -- return vim.fn.expand('%:t')
  end
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.documentSymbolProvider then
      vim.wo.winbar = [[ %{%v:lua.GetWinbar()%}]]
    end
  end,
})

-- lsp with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.ruff.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
    "--log=error",
    "--offset-encoding=utf-16",
    -- "--query-driver=/opt/homebrew/opt/gcc@13"
  },
}

lspconfig.harper_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    ["harper-ls"] = {
      linters = {
        sentence_capitalization = false,
        long_sentences = false,
      },
    },
  },
}

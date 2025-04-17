require("nvchad.configs.lspconfig").defaults()

local servers = { "clangd", "harper_ls", "neocmake", "pyright", "ruff", "rust_analyzer", "nil_ls", "nixd" }
vim.lsp.enable(servers)

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
    return "󰼂 " .. trouble_symbols.get()
  else
    return "󰼁 "
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

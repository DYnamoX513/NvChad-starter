local fos = require "configs.format_on_save"
local fos_status = function()
  -- conform.nvim format_on_save status
  local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
  -- check buffer setting
  if fos.can_format_on_save(buf) then
    return "󰹣 "
  end

  if vim.g.disable_autoformat then
    return "󱏽 "
  end

  return "󱏾 "
end

return {
  -- theme = "vscode_colored", -- default/vscode/vscode_colored/minimal
  order = {
    "mode",
    "file",
    "git",
    "%=",
    "fos", -- format_on_save
    "ff",
    "lc",
    "codeium",
    "lsp_msg",
    "%=",
    "diagnostics",
    "lsp_all",
    "en",
    -- "lsp",
    -- "cursor",
    -- "cwd",
  },
  modules = {
    -- f = "%f",

    -- dynamic relative_path
    ff = function()
      local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
      local path = vim.api.nvim_buf_get_name(buf)
      if path == "" then
        return "Empty"
      end

      local relative_path = vim.fn.fnamemodify(path, ":.")

      -- further truncated
      if vim.o.columns < 60 then
        return "..."
      end
      -- filename only
      if vim.o.columns < 100 or #relative_path > 50 then
        local filename = vim.fn.fnamemodify(path, ":t")
        return ".../" .. filename
      end

      return relative_path
    end,

    -- format_on_save status
    fos = function()
      return "%#St_seed#" .. fos_status() .. "%X" .. "%#StText# " -- reset
    end,

    -- all attached LSPs
    lsp_all = function()
      if rawget(vim, "lsp") then
        local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
        local clients = {}
        for _, client in ipairs(vim.lsp.get_clients()) do
          if client.attached_buffers[buf] then
            table.insert(clients, client.name)
          end
        end
        if #clients > 0 then
          if vim.o.columns > 100 then
            return "%#St_Lsp#󰟥 " .. table.concat(clients, "/") .. " "
          else
            return "%#St_Lsp#󰟥 " .. #clients .. " "
          end
        end
      end
      return ""
    end,

    -- line-column
    lc = " %3l,%-3c",

    codeium = function()
      return " 󰖝 " .. require("codeium.virtual_text").status_string()
    end,

    -- file encoding
    en = function()
      local encode = vim.bo.fileencoding
      if #encode > 0 then
        return "%#StText#󰴓 " .. encode:upper() .. " "
      end
      return ""
    end,
  },
}

local status, lsp = pcall(require, "lsp")
if (not status) then return end


local lsp = {}

lsp.select_symbol = function(cursor_pos, symbol)
  if symbol.valueRange then
    local value_range = {
      ["start"] = {
        character = 0,
        line = vim.fn.byte2line(symbol.valueRange[1]),
      },
      ["end"] = {
        character = 0,
        line = vim.fn.byte2line(symbol.valueRange[2]),
      },
    }

    return require("lsp-status.util").in_range(cursor_pos, value_range)
  end
end

lsp.activate = function()
  plugin.config {
    select_symbol = status.select_symbol,

    indicator_errors = "",
    indicator_warnings = "",
    indicator_info = "🛈",
    indicator_hint = "!",
    indicator_ok = "",
    spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
  }

  plugin.register_progress()
end

lsp.on_attach = function(client)
  plugin.on_attach(client)

  vim.cmd [[augroup tj_lsp_status]]
  vim.cmd [[autocmd CursorHold,BufEnter <buffer> lua require('lsp-status').update_current_function()]]
  vim.cmd [[augroup END]]
end

return lsp

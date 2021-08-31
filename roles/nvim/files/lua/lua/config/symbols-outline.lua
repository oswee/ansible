local status, plugin = pcall(require, "symbols_outline")
if (not status) then return end

local opts = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false, -- experimental
  position = 'right',
  keymaps = {
    close = "<Esc>",
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<C-space>",
    rename_symbol = "r",
    code_actions = "a"
  },
  lsp_blacklist = {}
}

plugin.setup(opts)

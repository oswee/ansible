local status, plugin = pcall(require, "lspsaga")
if (not status) then return end

local h = require('helpers')

plugin.init_lsp_saga({
  code_action_icon = " ",
  definition_preview_icon = "  ",
  dianostic_header_icon = "   ",
  error_sign = " ",
  finder_definition_icon = "  ",
  finder_reference_icon = "  ",
  hint_sign = "⚡",
  infor_sign = "",
  warn_sign = "",
})

local opts = { noremap=true, silent=true }

h.map("n", "<Leader>cf", ":Lspsaga lsp_finder<CR>", opts)
h.map("n", "<Leader>ca", ":Lspsaga code_action<CR>", opts)
h.map("v", "<Leader>ca", ":<C-U>Lspsaga range_code_action<CR>", opts)
h.map("n", "<Leader>ch", ":Lspsaga hover_doc<CR>", opts)
h.map("n", "<Leader>ck", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
h.map("n", "<Leader>cj", '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)
h.map("n", "<Leader>cs", ":Lspsaga signature_help<CR>", opts)
h.map("n", "<Leader>ci", ":Lspsaga show_line_diagnostics<CR>", opts)
h.map("n", "<Leader>cc", ":Lspsaga show_cursor_diagnostics<CR>", opts)
h.map("n", "<Leader>cn", ":Lspsaga diagnostic_jump_next<CR>", opts)
h.map("n", "<Leader>cp", ":Lspsaga diagnostic_jump_prev<CR>", opts)
h.map("n", "<Leader>cr", ":Lspsaga rename<CR>", opts)
h.map("n", "<Leader>cd", ":Lspsaga preview_definition<CR>", opts)

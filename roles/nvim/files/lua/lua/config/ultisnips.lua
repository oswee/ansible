local vim = vim
local map = require('helpers').map

-- Open the edit buffer in a specific split
vim.g.UltiSnipsEditSplit = "vertical"

-- Setting snippet folder
vim.g.UltiSnipsSnippetDirectories = { "ultisnips" }

-- Triggers
vim.g.UltiSnipsExpandTrigger = "<C-e>"
vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
vim.g.UltiSnipsJumpBackwardTrigger = "<S-tab>"

-- Edit snippets keymap
map("n", "<Leader>se", ":UltiSnipsEdit<Enter>", { noremap = true, silent = true })

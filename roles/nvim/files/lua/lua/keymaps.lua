local g = vim.g
local h = require('helpers')

local opts = { noremap = true, silent = true }

g.mapleader = ' '
g.maplocalleader = '\\'

h.map('n', '<C-n>', ':NERDTreeToggle<CR>', opts)
h.map('n', '<F5>', ':UndotreeToggle<CR>', opts)


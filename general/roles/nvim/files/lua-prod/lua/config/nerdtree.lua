local g = vim.g
local map = require('helpers').map

local opts = { noremap = true, silent = true }

g.NERDTreeMinimalUI           = 0  -- Hide Press ? for help
g.NERDTreeShowHidden          = 1  -- Show hidden files
g.NERDTreeAutoDeleteBuffer    = 1  -- Reload the buffer when renaming the file
-- g.NERDTreeChDirMode           = 2
g.NERDTreeDirArrowExpandable  = ''
g.NERDTreeDirArrowCollapsible = ''
g.NERDTreeWinSize             = 40  -- Set the width of the NerdTree split
g.webdevicons_enable_nerdtree = 1

-- after a re-source, fix syntax matching issues (concealing brackets):
-- if g.loaded_webdevicons
--     call webdevicons#refresh()
-- endif

map('n', '<C-n>', ':NERDTreeToggle<CR>', opts)

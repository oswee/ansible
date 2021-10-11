local vim = vim
local g = vim.g
local set = vim.opt
local tree_cb = require'nvim-tree.config'.nvim_tree_callback

local map = require('helpers').map

g.nvim_tree_side = 'right'                                -- left by default
g.nvim_tree_width = 40                                    -- 30 by default, can be width_in_columns or 'width_in_percent%'
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' } -- empty by default
g.nvim_tree_gitignore = 1                                 -- 0 by default
g.nvim_tree_quit_on_open = 1                              -- 0 by default, closes the tree when you open a file
g.nvim_tree_indent_markers = 1                            -- 0 by default, this option shows indent markers when folders are open
g.nvim_tree_hide_dotfiles = 1                             -- 0 by default, this option hides files and folders starting with a dot `.`
g.nvim_tree_git_hl = 1                                    -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
g.nvim_tree_highlight_opened_files = 1                    -- 0 by default, will enable folder and file icon highlight for opened files/directories.
g.nvim_tree_root_folder_modifier = ':~'                   -- This is the default. See :help filename-modifiers for more options
g.nvim_tree_auto_resize = 0                               -- 1 by default, will resize the tree to its saved width when opening a file
g.nvim_tree_add_trailing = 1                              -- 0 by default, append a trailing slash to folder names
g.nvim_tree_group_empty = 1                               -- 0 by default, compact folders that only contain a single folder into one node in the file tree
g.nvim_tree_lsp_diagnostics = 1                           -- 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
g.nvim_tree_disable_window_picker = 1                     -- 0 by default, will disable the window picker.
g.nvim_tree_icon_padding = ' '                            -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
g.nvim_tree_symlink_arrow = ' >> '                        -- defaults to ' ➛ '. used as a separator between symlinks' source and target.
g.nvim_tree_respect_buf_cwd = 1                           -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
g.nvim_tree_refresh_wait = 500                            -- 1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
g.nvim_tree_window_picker_exclude = {
  filetype = {
    'notify',
    'packer',
    'qf'
  },
  buftype = {
    'terminal'
  }
}
g.nvim_tree_special_files = { 'README.md', 'Makefile', 'MAKEFILE', 'go.mod' } -- List of filenames that gets highlighted with NvimTreeSpecialFile
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 0,
  }
g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged  = "✗",
    staged    = "✓",
    unmerged  = "",
    renamed   = "➜",
    untracked = "★",
    deleted   = "",
    ignored   = "◌"
    },
  folder = {
    arrow_open   = "",
    arrow_closed = "",
    default      = "",
    open         = "",
    empty        = "",
    empty_open   = "",
    symlink      = "",
    symlink_open = "",
    },
    lsp = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  }

map("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
map("n", "<Leader>r", ":NvimTreeRefresh<CR>")
map("n", "<Leader>n", ":NvimTreeFindFile<CR>")
-- NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them

set.termguicolors = true

-- a list of groups can be found at `:help nvim_tree_highlight`
--highlight NvimTreeFolderIcon guibg=blue
vim.cmd("highlight NvimTreeFolderIcon guibg=blue")

-- default mappings
vim.g.nvim_tree_bindings = {
  { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
  { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
  { key = "<C-v>",                        cb = tree_cb("vsplit") },
  { key = "<C-x>",                        cb = tree_cb("split") },
  { key = "<C-t>",                        cb = tree_cb("tabnew") },
  { key = "<",                            cb = tree_cb("prev_sibling") },
  { key = ">",                            cb = tree_cb("next_sibling") },
  { key = "P",                            cb = tree_cb("parent_node") },
  { key = "<BS>",                         cb = tree_cb("close_node") },
  { key = "<S-CR>",                       cb = tree_cb("close_node") },
  { key = "<Tab>",                        cb = tree_cb("preview") },
  { key = "K",                            cb = tree_cb("first_sibling") },
  { key = "J",                            cb = tree_cb("last_sibling") },
  { key = "I",                            cb = tree_cb("toggle_ignored") },
  { key = "H",                            cb = tree_cb("toggle_dotfiles") },
  { key = "R",                            cb = tree_cb("refresh") },
  { key = "a",                            cb = tree_cb("create") },
  { key = "d",                            cb = tree_cb("remove") },
  { key = "r",                            cb = tree_cb("rename") },
  { key = "<C-r>",                        cb = tree_cb("full_rename") },
  { key = "x",                            cb = tree_cb("cut") },
  { key = "c",                            cb = tree_cb("copy") },
  { key = "p",                            cb = tree_cb("paste") },
  { key = "y",                            cb = tree_cb("copy_name") },
  { key = "Y",                            cb = tree_cb("copy_path") },
  { key = "gy",                           cb = tree_cb("copy_absolute_path") },
  { key = "[c",                           cb = tree_cb("prev_git_item") },
  { key = "]c",                           cb = tree_cb("next_git_item") },
  { key = "-",                            cb = tree_cb("dir_up") },
  { key = "s",                            cb = tree_cb("system_open") },
  { key = "q",                            cb = tree_cb("close") },
  { key = "g?",                           cb = tree_cb("toggle_help") },
}

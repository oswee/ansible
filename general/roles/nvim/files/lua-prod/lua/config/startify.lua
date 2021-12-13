local g = vim.g
local fn = vim.fn

g.startify_session_dir = '~/.config/nvim/sessions'          -- Specify the location to save and load sessions from
g.startify_session_delete_buffers = 1                       -- Let Startify take care of buffers
g.startify_change_to_vcs_root = 1                           -- Similar to vim-rooter
g.startify_fortune_use_unicode = 1                          -- If you want Unicode
g.startify_session_persistence = 1                          -- Automatically Update Sessions
g.startify_enable_special = 0                               -- Get rid of empty buffer on quit

g.startify_lists = {
  { type = 'files',     header = {' Files'} },
  { type = 'dir',       header = {' Current Directory ' .. fn.getcwd()} },
  { type = 'sessions',  header = {' Sessions'} },
  { type = 'bookmarks', header = {' Bookmarks'} },
}

g.startify_bookmarks = {
  { a = '~/.config/alacritty/alacritty.yml' },
  { i = '~/.config/nvim/init.lua' },
  { s = '~/.config/sway/config' },
  { t = '~/.tmux.conf' },
  { z = '~/.zshrc' },
}

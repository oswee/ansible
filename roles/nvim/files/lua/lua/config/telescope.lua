local status, telescope = pcall(require, "telescope")
if (not status) then return end

local builtin = require("telescope.builtin")
local h = require('helpers')

local opts = { noremap = true, silent = true }

telescope.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

-- _G.map("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
-- _G.map('n', '<Leader>ff', ":Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍<CR>", opts)
h.map('n', '<Leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
h.map("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
h.map("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
h.map("n", "<Leader>fh", ":Telescope help_tags<CR>", opts)

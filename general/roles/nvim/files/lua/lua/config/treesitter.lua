local status, plugin = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

plugin.setup({
  ensure_installed = "maintained",
  highlight = { enable = true },
  indent = { enable = true },
  additional_vim_regex_highlighting = { "markdown" },
})

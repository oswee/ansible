local ok, util = pcall(require, 'lspconfig.util')
if not ok then return end

return {
  default_config = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod' },
    root_dir = function(fname)
      return util.root_pattern 'go.work'(fname) or util.root_pattern('go.mod', '.git')(fname)
    end,
  },
  docs = {
    description = [[
      https://github.com/golang/tools/tree/master/gopls
      Google's lsp server for golang.
    ]],
    default_config = {
      root_dir = [[root_pattern("go.mod", ".git")]],
    },
  },
}

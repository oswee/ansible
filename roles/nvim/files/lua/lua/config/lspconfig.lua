local status, lspconfig = pcall(require, "lspconfig")
if (not status) then return end

local vim = vim
local linters = require('./config/efm/_linters')
local get_table_keys = require('helpers').get_table_keys

local format_on_write = true

local lint_settings = {
  ["="] = {linters.misspell},
  vim = {linters.vint},
  lua = {linters.luafmt},
  go = {linters.golint, linters.goimports},
  python = {linters.black, linters.isort, linters.flake8, linters.mypy},
  typescript = {linters.prettier, linters.eslint},
  javascript = {linters.prettier, linters.eslint},
  yaml = {linters.yamllint},
  json = {linters.prettier},
  html = {linters.prettier},
  scss = {linters.prettier},
  css = {linters.stylelint},
  markdown = {linters.prettier},
  sh = {linters.shellcheck},
  tf = {linters.terraform},
  bzl = {linters.buildifier},
}

-- Linting
vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
  if err ~= nil or result == nil then
    return
  end
  if not vim.api.nvim_buf_get_option(bufnr, "modified") then
    local view = vim.fn.winsaveview()
    vim.lsp.util.apply_text_edits(result, bufnr)
    vim.fn.winrestview(view)
    if bufnr == vim.api.nvim_get_current_buf() then
      vim.api.nvim_command("noautocmd :update")
    end
  end
end

local on_attach_efm = function(client)
  --local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  ----Enable completion triggered by <c-x><c-o>
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  --local opts = { noremap=true, silent=true }

  ---- See `:help vim.lsp.*` for documentation on any of the below functions
  --buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts) -- <C-o> to go back
  --buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  --buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  --buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  --buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  --buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  ---- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  --buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  --buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  --buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  --buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  if format_on_write and client.resolved_capabilities.document_formatting then -- format on write
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_seq_sync({}, 1000)]] -- Use all formatters
    vim.api.nvim_command [[augroup END]]
  end
end

local on_attach = function(client)
  require('lsp_signature').on_attach()
end

local function setup_servers()
  -- Default setups from lsp-config
  require('lspinstall').setup()
  local servers = require('lspinstall').installed_servers()
  for _, server in pairs(servers) do
    require('lspconfig')[server].setup{
      on_attach = on_attach
    }
  end

  -- specific lsp configs
  lspconfig.efm.setup {
    on_attach = on_attach_efm,
    init_options = {
      documentFormatting = true,
      hover = true,
    },
    root_dir = vim.loop.cwd,
    settings = {
      rootMarkers = {".git/"},
      languages = lint_settings
    },
    filetypes = get_table_keys(lint_settings)
  }
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require('lspinstall').post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

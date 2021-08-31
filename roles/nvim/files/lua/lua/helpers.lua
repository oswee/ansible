local vim = vim
local api = vim.api
local cmd = vim.cmd

local H = {}

function H.create_augroup(autocmds, name)
    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end

function H.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

function H.get_table_keys(tab)
  local keyset = {}
  for k,_ in pairs(tab) do
    keyset[#keyset + 1] = k
  end
  return keyset
end


return H

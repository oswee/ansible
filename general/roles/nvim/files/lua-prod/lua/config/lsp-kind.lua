local status, plugin = pcall(require, "lspkind")
if (not status) then return end

local opts = {
  with_text = true,
  preset = 'default',
}

plugin.init(opts)

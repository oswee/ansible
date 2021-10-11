local vim = vim

 vim.api.nvim_command("autocmd BufEnter,BufRead,BufNewFile *.md set filetype=markdown")


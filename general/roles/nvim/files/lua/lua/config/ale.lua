local g = vim.g

g.ale_echo_msg_format = "[%linter%] [%severity%] %s"
g.ale_sign_error = '✘'
g.ale_sign_warning = '⚠'

g.ale_typescript_prettier_use_local_config = 1

g.ale_lint_on_text_changed = 'never'
g.ale_linters_explicit = 1
g.ale_linters = {
  html = {'tidy', 'htmlhint'},
  css = {'stylelint'},
  scss = {'stylelint'},
  javascript = {'eslint', 'tsserver'},
  typescript = {'eslint', 'tsserver'},
  vim = {'vint'},
  proto = {'buf-check-lint'},
  yaml = {'yamllint'},
}

-- Do not lint or fix minified files.
g.ale_pattern_options = {
  ['\\.min\\.css$'] = {ale_enabled = 0},
  ['\\.min\\.js$'] = {ale_enabled = 0},
}

g.ale_fix_on_save = 1
g.ale_fixers = {
  css = {'prettier'},
  scss = {'prettier'},
  javascript = {'prettier'},
  typescript = {'prettier'},
  json = {'prettier'},
}


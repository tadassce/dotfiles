return {
  'dense-analysis/ale',
  config = function()
    -- vim.g.ale_ruby_rubocop_auto_correct_all = 1
    vim.g.ale_linters = {
      ruby = { 'brakeman', 'reek', 'rubocop', 'ruby', 'sorbet' },
      javascript = { 'standard' },
      markdown = { 'proselint' },
      lua = {'lua_language_server'},
    }
    vim.g.ale_sign_error = '! '
    vim.g.ale_sign_warning = '. '
    vim.g.ale_echo_msg_format = '[%linter%] %s [%severity%]'
    vim.g.ale_pattern_options = {
      ['db/schema\\.rb$'] = { ale_enabled = 0 },
    }
    -- vim.g.ale_fixers = { ruby = { 'standardrb' }, javascript = { 'standard' } }
    -- vim.g.ale_fix_on_save = 1
    vim.g.ale_lint_on_enter = 0

    vim.cmd('highlight clear ALEErrorSign')
    vim.cmd('highlight clear ALEWarningSign')
  end
}

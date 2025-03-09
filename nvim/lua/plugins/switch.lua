return {
  'AndrewRadev/switch.vim',
  config = function()
    -- Switch (for toggling TODO items)
    vim.g.todo_switch_definition = {
      ['- \\[ \\]\\(.*\\)$'] = '- [x]\\1',
      ['- \\[x\\]\\(.*\\)$'] = '- [ ]\\1',
    }
    vim.g.switch_custom_definitions = { vim.g.todo_switch_definition }
  end
}

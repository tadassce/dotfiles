return {
  "github/copilot.vim", cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufWinEnter",
  init = function()
    -- vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

    -- vim.g.copilot_no_maps = true
    -- vim.g.copilot_no_tab_map = true

    -- Uncomment to disable copilot on startup
    -- vim.api.nvim_create_autocmd('VimEnter', {
    --   pattern = '*',
    --   command = 'Copilot disable'
    -- })
  end,
}

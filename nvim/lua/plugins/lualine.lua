return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      always_divide_middle = true,
      icons_enabled = true,
      theme = 'nord',
      component_separators = { " ", " " },
      section_separators = { left = " ", right = " " },
    },
    sections = {
      lualine_a = {
        { "mode" },
      },
      lualine_b = {
        {
          'branch',
          'diff',
          'diagnostics',
        },
      },
      lualine_c = {
        {
          'filename',
          file_status = true,
          path = 1,
          on_click = function() vim.cmd('let @+ = expand("%")') end,
        },
      },
      lualine_x = {
        { "searchcount" },
      },
      lualine_y = {
        { "filetype" },
      },
      lualine_z = {
        { 'location' },
      }
    },
    extensions = {
      'trouble',
      'fzf',
      'lazy',
    },
  },
}

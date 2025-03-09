--[[
return {
  'saghen/blink.cmp',
  dependencies = { "fang2hou/blink-copilot" },
  opts = {
    keymap = {
      preset = 'default',
      ['<Esc>'] = { 'fallback' },
      ['<Tab>'] = { 'show', 'select_next', 'fallback'},
      ['<CR>'] = { 'select_and_accept', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback' },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
    cmdline = {
      sources = {},
    },
    signature = { enabled = true }
  }
}
]]
return {}

return {
  'stevearc/oil.nvim',
  init = function()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
  event = "VeryLazy",
  config = function()
    require("oil").setup({
      skip_confirm_for_simple_edits = true,
      columns = {
        "icon",
        "size",
        "mtime",
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["v"] = "actions.select_vsplit",
        ["s"] = "actions.select_split",
        ["t"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
      },
      view_options = {
        show_hidden = true,
      },
    })
  end,
}

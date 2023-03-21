vim.keymap.set("n", "<Space>di", require("nvim-tree.api").tree.toggle)

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local status, autosave = pcall(require, "auto-save")
if (not status) then return end

-- Toggle auto-save
vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})

autosave.setup({
  enabled = false,
})

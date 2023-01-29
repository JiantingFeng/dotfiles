local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

vim.opt.termguicolors = true

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = "thin",
    numbers = "ordinal",
    diagnostics = "nvim_lsp"
  },
  -- highlights = {
  --   separator = {
  --     fg = '#073642',
  --     bg = '#002b36',
  --   },
  --   separator_selected = {
  --     fg = '#073642',
  --   },
  --   background = {
  --     fg = '#657b83',
  --     bg = '#002b36'
  --   },
  --   buffer_selected = {
  --     fg = '#fdf6e3',
  --     bold = true,
  --   },
  --   fill = {
  --     bg = '#073642'
  --   }
  -- },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

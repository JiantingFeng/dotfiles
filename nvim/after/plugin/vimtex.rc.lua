local status, vimtex = pcall(require, "vimtex")
if (not status) then return end

vim.g.vimtex_view_enabled = true
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_skim_sync = true
vim.g.vimtex_view_skim_activate = true
vim.g.tex_flavor = 'latex'
vim.g.vimtex_compiler_latexmk.backend = 'nvim'
vimtex.setup({

})

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then return end

local protocal = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufwritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end
end

nvim_lsp.ghcide.setup {
  on_attach = on_attach,
  filetypes = { "haskell", "haskell-cabal" },
  cmd = { "ghcide", "--lsp" },
}


nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescript.tsx", "typescriptreact" },
  cmd = { "typescript-language-server", "--stdio" },
}

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      }
    }
  }
}


nvim_lsp.pyright.setup {
  on_attach = on_attach,
  filetypes = { "purescript" },
  cmd = { "pyright-langserver", "--stdio" },
}

nvim_lsp.emmet_ls.setup {
  on_attach = on_attach,
  cmd = { "emmet-ls", "--stdio" },
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
}

nvim_lsp.clangd.setup {
  on_attach = on_attach,
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  single_file_support = true,
}

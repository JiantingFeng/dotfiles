-- Install Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'wbthomason/packer.nvim',
  { "catppuccin/nvim", as = "catppuccin" },
  -- Statusline
  'nvim-lualine/lualine.nvim',
  -- Common utilities
  'nvim-lua/plenary.nvim',
  'onsails/lspkind-nvim', -- vscode-like pictograms
  'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
  'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim's built-in LSP
  'hrsh7th/nvim-cmp', -- Completion
  'neovim/nvim-lspconfig', -- LSP
  'jose-elias-alvarez/null-ls.nvim', -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- 'glepnir/lspsaga.nvim', -- LSP UIs
  'L3MON4D3/LuaSnip',
  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
  'kyazdani42/nvim-web-devicons', -- File icons
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-file-browser.nvim',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'norcalli/nvim-colorizer.lua',
  'folke/zen-mode.nvim',
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  'akinsho/nvim-bufferline.lua',
  --  'github/copilot.vim'

  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim', -- For git blame & browse
  -- vimtex
  'lervag/vimtex',
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    -- replace "lervag/vimtex" with "nvim-treesitter/nvim-treesitter" if you're
    -- using treesitter.
    dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    config = function()
      require 'luasnip-latex-snippets'.setup()
      -- or setup({ _treesitter = true })
    end,
    ft = "tex",
  },
  "numToStr/Comment.nvim",
  'JoosepAlviste/nvim-ts-context-commentstring', -- comment string for js, ts, jsx, astro, lua, etc...
  {
    "akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end
  }, -- floating term

  -- Rust Debugging
  'mfussenegger/nvim-dap',
})

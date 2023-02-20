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
    { "catppuccin/nvim", as = "catppuccin" },
    -- Statusline
    'nvim-lualine/lualine.nvim',
    'arkav/lualine-lsp-progress',
    -- Common utilities
    'nvim-lua/plenary.nvim',
    'onsails/lspkind-nvim', -- vscode-like pictograms
    'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
    'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim's built-in LSP
    'hrsh7th/nvim-cmp', -- Completion
    'L3MON4D3/LuaSnip',
    'neovim/nvim-lspconfig', -- LSP
    'jose-elias-alvarez/null-ls.nvim', -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    'williamboman/mason.nvim', -- Install Lsp
    'williamboman/mason-lspconfig.nvim',

    -- 'glepnir/lspsaga.nvim', -- LSP UIs
    {
        'nvim-treesitter/nvim-treesitter',
        build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    },
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',
    'norcalli/nvim-colorizer.lua',
    'folke/zen-mode.nvim',
       {
        'akinsho/nvim-bufferline.lua',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
    },
    --  'github/copilot.vim'

    'lewis6991/gitsigns.nvim',
    'dinhhuy258/git.nvim', -- For git blame & browse
    'numToStr/Comment.nvim',
    'JoosepAlviste/nvim-ts-context-commentstring', -- comment string for js, ts, jsx, astro, lua, etc...
    {
        "akinsho/toggleterm.nvim", config = function()
        require("toggleterm").setup()
    end
    }, -- floating term

    -- Rust Debugging
    'mfussenegger/nvim-dap',
    {
        'codota/tabnine-nvim',
        build = './dl_binaries.sh'
    },
    -- Diagnostics and Debugging
    {
        'folke/trouble.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    -- Which key
    {
        "folke/which-key.nvim",
        config = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 400
        end,
    },

})

-- This is Jianting's nvim configuration entry point
-- For latest config, please refer https://github.com/JiantingFeng/dotfiles
require('base')
require('highlights')
require('maps')
require('plugins')
require("luasnip.loaders.from_lua").lazy_load({
    paths = "~/.config/nvim/LuaSnip/"
})
local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then require('macos') end
if is_win then require('windows') end

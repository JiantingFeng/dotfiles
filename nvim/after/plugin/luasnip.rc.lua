local status, luasnip = pcall(require, "luasnip")
if (not status) then return end

luasnip.setup({
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
})

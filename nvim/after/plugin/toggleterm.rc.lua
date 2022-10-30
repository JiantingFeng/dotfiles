require("toggleterm").setup {
  direction = 'float',
  open_mapping = [[<c-\>]],
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
    width = math.ceil(vim.o.columns * 0.8),
  }
}
print(vim.o.shell)

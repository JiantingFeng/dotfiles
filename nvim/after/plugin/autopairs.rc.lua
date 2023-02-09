local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end
autopairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})
local rule = require("nvim-autopairs.rule")
local cond = require('nvim-autopairs.conds')
autopairs.add_rules({
    rule("$", "$", { "tex", "latex" })
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex("%%"))
    -- don't add a pair if  the previous character is xxx
    :with_pair(cond.not_before_regex("xxx", 3))
    -- don't move right when repeat character
    :with_move(cond.none())
    -- don't delete if the next character is xx
    :with_del(cond.not_after_regex("xx"))
    -- disable adding a newline when you press <cr>
    :with_cr(cond.none())
},
    -- disable for .vim files, but it work for another filetypes
    rule("a", "a", "-vim")
)

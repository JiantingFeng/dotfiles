local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.tex"

local function cs(trigger, nodes, opts) --{{{
  local snippet = s(trigger, nodes)
  local target_table = snippets

  local pattern = file_pattern
  local keymaps = {}

  if opts ~= nil then
    -- check for custom pattern
    if opts.pattern then
      pattern = opts.pattern
    end

    -- if opts is a string
    if type(opts) == "string" then
      if opts == "auto" then
        target_table = autosnippets
      else
        table.insert(keymaps, { "i", opts })
      end
    end

    -- if opts is a table
    if opts ~= nil and type(opts) == "table" then
      for _, keymap in ipairs(opts) do
        if type(keymap) == "string" then
          table.insert(keymaps, { "i", keymap })
        else
          table.insert(keymaps, keymap)
        end
      end
    end

    -- set autocmd for each keymap
    if opts ~= "auto" then
      for _, keymap in ipairs(keymaps) do
        vim.api.nvim_create_autocmd("BufEnter", {
          pattern = pattern,
          group = group,
          callback = function()
            vim.keymap.set(keymap[1], keymap[2], function()
              ls.snip_expand(snippet)
            end, { noremap = true, silent = true, buffer = true })
          end,
        })
      end
    end
  end

  table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- Start Refactoring --

local get_visual = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

cs(
  { trig = "eq", dscr = "Equation environment(numbered)" },
  fmt(-- The snippet code actually looks like the equation environment it produces.
    [[
      \begin{equation}
          <>
      \end{equation}
    ]],
    -- The insert node is placed in the <> angle brackets
    { i(1) },
    -- This is where I specify that angle brackets are used as node positions.
    { delimiters = "<>" }
  )
)

cs(
  { trig = "eq", dscr = "Equation environment(unnumbered)" },
  fmt(-- The snippet code actually looks like the equation environment it produces.
    [[
      \begin{equation*}
          <>
      \end{equation*}
    ]],
    -- The insert node is placed in the <> angle brackets
    { i(1) },
    -- This is where I specify that angle brackets are used as node positions.
    { delimiters = "<>" }
  )
)

cs({ trig = "tt", dscr = "Expands 'tt' into '\texttt{}'" },
  fmta(
    "\\texttt{<>}",
    { i(1) }
  )
)

cs({ trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command." },
  fmta("\\textit{<>}",
    {
      d(1, get_visual),
    }
  )
)
cs({ trig = "ff", dscr = "Expands 'ff' into '\frac{}{}'" },
  fmt(
    "\\frac{<>}{<>}",
    {
      i(1),
      i(2)
    },
    { delimiters = "<>" }-- manually specifying angle bracket delimiters
  )
)

cs({ trig = "env", snippetType = "autosnippet" },
  fmta(
    [[
      \begin{<>}
          <>
      \end{<>}
    ]],
    {
      i(1),
      i(2),
      rep(1), -- this node repeats insert node i(1)
    }
  )
)

cs({ trig = "hr", dscr = "The hyperref package's href{}{} command (for url links)" },
  fmta(
    [[\href{<>}{<>}]],
    {
      i(1, "url"),
      i(2, "display name"),
    }
  )
)

cs({ trig = '([^%a])ee', regTrig = true, wordTrig = false },
  fmta(
    "<>e^{<>}",
    {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual)
    }
  )
)

-- End Refactoring --

return snippets, autosnippets

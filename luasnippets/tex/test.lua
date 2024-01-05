local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s(
    { trig = ";fb", dscr = "Mathbb font", snippetType = "autosnippet" },
    fmt(
      [[
        \mathbb{<>}
      ]],
      { i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = ";fc", dscr = "Mathcal font", snippetType = "autosnippet" },
    fmt(
      [[
        \mathcal{<>}
      ]],
      { i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = ";fs", dscr = "Mathscr font", snippetType = "autosnippet" },
    fmt(
      [[
        \mathscr{<>}
      ]],
      { i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = ";fi", dscr = "Italic font", snippetType = "autosnippet" },
    fmt(
      [[
        \textit{<>}
      ]],
      { i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = ";fo", dscr = "Bold font", snippetType = "autosnippet" },
    fmt(
      [[
        \textbf{<>}
      ]],
      { i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    { trig = ";fu", dscr = "Underline", snippetType = "autosnippet" },
    fmt(
      [[
        \underline{<>}
      ]],
      { i(1) },
      { delimiters = "<>" }
    )
  ),
}

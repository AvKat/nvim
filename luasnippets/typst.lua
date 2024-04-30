local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt

function language_autocomplete(trig, lang)
  return s({
    trig = string.format("^;%s", trig),
    snippetType = "autosnippet",
    regTrig = true
  }, fmt([[
```<>
<>
```
  ]], {
    t(lang),
    i(1)
  }, {
    delimiters = "<>"
  }))
end

return {
  s("template", fmt([[
#let project(title: "", body) = {
  set document(author: "Avish Kathpal", title: title)
  set page(numbering: "1")
  align(center)[
    #block(text(font: "Avenir", weight: 900, 2.75em, title))
  ]
  set par(justify: true)
  set text(font: "sans serif", lang: "en", size: 1em)
  body
}

#show: project.with(title: "<>")
  ]], {
    i(1, "title")
  }, {
    delimiters = "<>"
  })),

  s("template_with_outline", fmt([[
#let project(title: "", body) = {
  set document(author: "Avish Kathpal", title: title)
  set page(numbering: "1")
  set text(font: "Avenir", lang: "en", size: 1.1em)
  align(center)[
    #block(text(weight: 900, 2.75em, title))
  ]
  set par(justify: true)
  align(horizon)[
    #outline()
  ]
  pagebreak()
  body
}

#show: project.with(title: "<>")
  ]], {
    i(1, "title")
  }, {
    delimiters = "<>"
  })),

  s("typcmd", fmt([[
#let seq = $subset.eq$
#let supeq = $supset.eq$
#let iff = $<=>$
#let bsq = $square.filled.big$
#let nin = $in.not$
#let pm = $plus.minus$
  ]], {})),
  -- Math mode
  s({
    trig = "mk",
    snippetType = "autosnippet",
  }, fmt([[
    $<>$
  ]], {
    i(1)
  }, {
    delimiters = "<>"
  })),

  s("trig", {
    i(1), t "text", i(2), t "text again", i(3)
  }),
  language_autocomplete("rkt", "racket"),
  language_autocomplete("py", "python"),
  language_autocomplete("js", "javascript"),
  language_autocomplete("ts", "typescript"),
  language_autocomplete("c", "c"),
  language_autocomplete("cpp", "c++"),
  language_autocomplete("java", "java"),
  language_autocomplete("rs", "rust"),
  language_autocomplete("scala", "scala"),
  language_autocomplete("hs", "haskell"),
}

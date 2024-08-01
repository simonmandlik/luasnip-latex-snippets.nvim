local ls = require("luasnip")
local t = ls.text_node
local d = ls.dynamic_node
local utils = require("luasnip-latex-snippets.util.utils")
local get_visual = utils.get_visual

local M = {}

function M.retrieve(not_math)
  local s = ls.extend_decorator.apply(ls.snippet, {
    condition = utils.pipe { not_math },
  }) --[[@as function]]

  return {
    s(
      { trig = "mM", name = "Inline math mode" },
      {
        t { "\\( " },
        d(1, get_visual),
        t { " \\)" },
      }
    ),
  }
end

return M

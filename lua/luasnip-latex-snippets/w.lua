local ls = require("luasnip")
local i = ls.insert_node
local t = ls.text_node

local M = {}

function M.retrieve(not_math)
    local utils = require("luasnip-latex-snippets.util.utils")
    local pipe = utils.pipe

    local condition = pipe({ not_math })

    local s = ls.extend_decorator.apply(ls.snippet, {
        condition = condition,
    }) --[[@as function]]

    return {
        s( { trig = "figure", name = "Figure reference" }, {
            i(1, "Figure~"),
            t{ "\\ref{fig:" },
            i(2),
            t{ "}" }
        }),
        s( { trig = "table", name = "Table reference" }, {
            i(1, "Table~"),
            t{ "\\ref{tab:" },
            i(2),
            t{ "}" }
        }),
        s( { trig = "section", name = "Section reference" }, {
            i(1, "Section~"),
            t{ "\\ref{sec:" },
            i(2),
            t{ "}" }
        }),
        s( { trig = "page", name = "Page reference" }, {
            i(1, "Page~"),
            t{ "\\pageref{" },
            i(2),
            t{ "}" }
        }),
        s( { trig = "equation", name = "Equation reference" }, {
            i(1, "Equation~"),
            t{ "\\eqref{eq:" },
            i(2),
            t{ "}" }
        }),

        s( { trig = "tit", name = "Italic text" }, {
            t{ "\\textit{" }, i(1), t{ "}" }
        }),
        s( { trig = "tbf", name = "Bold text" }, {
            t{ "\\textbf{" }, i(1), t{ "}" }
        }),
        s( { trig = "tsc", name = "Small-caps text" }, {
            t{ "\\textsc{" }, i(1), t{ "}" }
        }),
        s( { trig = "tsf", name = "Sans-serif text" }, {
            t{ "\\textsf{" }, i(1), t{ "}" }
        }),
        s( { trig = "emp", name = "Emphasized text" }, {
            t{ "\\emph{" }, i(1), t{ "}" }
        }),
    }
end

return M

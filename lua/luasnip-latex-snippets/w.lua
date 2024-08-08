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

    local parse_snippet = ls.extend_decorator.apply(ls.parser.parse_snippet, {
        condition = condition
    }) --[[@as function]]

    return {
        s({ trig = "figure", name = "Figure reference" }, {
            i(1, "Figure~"),
            t{ "\\ref{fig:" },
            i(2),
            t{ "}" }
        }),
        s({ trig = "table", name = "Table reference" }, {
            i(1, "Table~"),
            t{ "\\ref{tab:" },
            i(2),
            t{ "}" }
        }),
        s({ trig = "section", name = "Section reference" }, {
            i(1, "Section~"),
            t{ "\\ref{sec:" },
            i(2),
            t{ "}" }
        }),
        s({ trig = "page", name = "Page reference" }, {
            i(1, "page~"),
            t{ "\\pageref{" },
            i(2),
            t{ "}" }
        }),
        s({ trig = "equation", name = "Equation reference" }, {
            i(1, "Equation~"),
            t{ "\\eqref{eq:" },
            i(2),
            t{ "}" }
        }),
        s({ trig = "cite", name = "Citation" }, {
            t{ "\\cite{" },
            i(1),
            t{ "}" }
        }),

        parse_snippet({ trig = "tit", name = "Italic" }, "\\textit{${1:${TM_SELECTED_TEXT}}}$0"),
        parse_snippet({ trig = "tbf", name = "Bold" }, "\\textbf{${1:${TM_SELECTED_TEXT}}}$0"),
        parse_snippet({ trig = "tsc", name = "Small-caps" }, "\\textsc{${1:${TM_SELECTED_TEXT}}}$0"),
        parse_snippet({ trig = "tsf", name = "Sans-serif" }, "\\textsf{${1:${TM_SELECTED_TEXT}}}$0"),
        parse_snippet({ trig = "ttt", name = "Monospaced" }, "\\texttt{${1:${TM_SELECTED_TEXT}}}$0"),
        parse_snippet({ trig = "emp", name = "Emphasized" }, "\\emph{${1:${TM_SELECTED_TEXT}}}$0"),
    }
end

return M

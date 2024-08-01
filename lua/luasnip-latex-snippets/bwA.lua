local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local r = require("luasnip.extras").rep
local utils = require("luasnip-latex-snippets.util.utils")
local get_visual = utils.get_visual

local M = {}

function M.retrieve(not_math)
    local conds = require("luasnip.extras.expand_conditions")

    local s = ls.extend_decorator.apply(ls.snippet, {
        condition = utils.pipe { conds.line_begin, not_math },
    }) --[[@as function]]

    return {
        s( { trig = "beg", name = "General environment" }, {
            t { "%", "\\begin{" },
            i(1),
            t { "}", "\t" },
            d(2, get_visual),
            t { "", "\\end{" },
            r(1),
            t { "}", "%", "" },
        }),
        s( { trig = "Mm", name = "Displayed math mode" }, {
            t { "%", "\\[", "\t" },
            d(1, get_visual),
            t { "", "\\]", "%", "" },
        }),
        s( { trig = "enum", name = "Enumerate" }, {
            t { "%", "\\begin{enumerate}", "\t\\item " },
            d(1, get_visual),
            t { "", "\\end{enumerate}", "%", "" },
        }),
        s( { trig = "item", name = "Itemize" }, {
            t { "%", "\\begin{itemize}", "\t\\item " },
            d(1, get_visual),
            t { "", "\\end{itemize}", "%", "" },
        }),
        s( { trig = "desc", name = "Description" }, {
            t { "%", "\\begin{description}", "\t\\item[" },
            i(1),
            t { "] " },
            d(2, get_visual),
            t { "", "\\end{description}", "%", "" },
        }),
        s( { trig = "ali", name = "Align" }, {
            t { "%", "\\begin{align}", "\t" },
            d(1, get_visual),
            t { "", "\\end{align}", "%", "" },
        }),
        s( { trig = "*ali", name = "Align (starred)" }, {
            t { "%", "\\begin{align*}", "\t" },
            d(1, get_visual),
            t { "", "\\end{align*}", "%", "" },
        }),
        s( { trig = "eq", name = "Equation" }, {
            t { "%", "\\begin{equation}", "\t\\label{eq:" },
            i(1),
            t { "}", "\t" },
            d(2, get_visual),
            t { "", "\\end{equation}", "%", "" },
        }),
        s( { trig = "eq*", name = "Equation (starred)" }, {
            t { "%", "\\begin{equation*}", "\t\\label{eq:" },
            i(1),
            t { "}", "\t" },
            d(2, get_visual),
            t { "", "\\end{equation*}", "%", "" },
        }),
        s( { trig = "tab", name = "Table" }, {
            t { "%", "\\begin{table}[" },
            i(1, "htpb!H"),
            t { "]", "\t\\centering", "\t\\caption{" },
            i(2),
            t { "}", "\t\\label{tab:" },
            i(3),
            t { "}", "\t\\begin{tabular}{c}", "\t\t" },
            d(4, get_visual),
            t { "", "\t\t\\toprule", "\t\t\\midrule", "\t\t\\bottomrule" },
            t { "", "\t\\end{tabular}", "\\end{table}", "%", "" },
        }),
        s( { trig = "fig", name = "Figure" }, {
            t { "%", "\\begin{figure}[" },
            i(1, "htpb!H"),
            t { "]", "\t\\centering", "\t" },
            i(4),
            t { "", "\t\\caption{" },
            i(2),
            t { "}", "\t\\label{fig:" },
            i(3),
            t { "}", "\\end{figure}", "%", "" }
        }),
        s( { trig = "sfig", name = "Subfigure" }, {
            t { "\t\\begin{subfigure}{0.5\\textwidth}", "\t\t" },
            i(3),
            t { "", "\t\t\\caption{" },
            i(1),
            t { "}", "\t\t\\label{fig:" },
            i(2),
            t { "}", "\t\\end{subfigure}", "\t\\hfill", "" }
        }),
        s( { trig = "use", name = "Package import" }, {
            t { "\\usepackage{" },
            i(1),
            t { "}", "" },
        }),

        s( { trig = "cha", name = "Chapter" }, {
            t { "\\chapter{" },
            i(1),
            t { "}", "\\label{sec:" },
            i(2),
            t { "}", "", "" },
        }),
        s( { trig = "*cha", name = "Chapter (starred)" }, {
            t { "\\chapter*{" },
            i(1),
            t { "}", "\\label{sec:" },
            i(2),
            t { "}", "", "" },
        }),
        s( { trig = "sec", name = "Section" }, {
            t { "\\section{" },
            i(1),
            t { "}", "\\label{sec:" },
            i(2),
            t { "}", "", "" },
        }),
        s( { trig = "*sec", name = "Section (starred)" }, {
            t { "\\section*{" },
            i(1),
            t { "}", "\\label{sec:" },
            i(2),
            t { "}", "", "" },
        }),
        s( { trig = "sub", name = "Subsection" }, {
            t { "\\subsection{" },
            i(1),
            t { "}", "\\label{sec:" },
            i(2),
            t { "}", "", "" },
        }),
        s( { trig = "*sub", name = "Subsection (starred)" }, {
            t { "\\subsection*{" },
            i(1),
            t { "}", "\\label{sec:" },
            i(2),
            t { "}", "", "" },
        }),
        s( { trig = "ssub", name = "Subsubsection" }, {
            t { "\\subsubsection{" },
            i(1),
            t { "}", "\\label{sec:" },
            i(2),
            t { "}", "", "" },
        }),
        s( { trig = "*ssub", name = "Subsubsection (starred)" }, {
            t { "\\subsubsection*{" },
            i(1),
            t { "}", "\\label{sec:" },
            i(2),
            t { "}", "", "" },
        }),
        s( { trig = "par", name = "Paragraph" }, {
            t { "\\paragraph{" },
            i(1),
            t { "}", "\\label{sec:" },
            i(2),
            t { "}", "", "" },
        }),
        s( { trig = "spar", name = "Subparagraph" }, {
            t { "\\subparagraph{" },
            i(1),
            t { "}", "\\label{sec:" },
            i(2),
            t { "}", "", "" },
        }),
    }
end

return M

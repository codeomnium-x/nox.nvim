-- lua/nox/groups/treesitter.lua
-- Nox colorscheme Treesitter highlights
-- Modern syntax highlighting using Treesitter

local M = {}

---Apply a highlight group with the given options
---@param group string The highlight group name
---@param opts table Highlight options (fg, bg, style, etc.)
local function highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

---Configure Treesitter-based syntax highlighting
---@param colors table Color palette
---@param config table Configuration options
function M.setup(colors, config)
	-- Identifiers
	highlight("@variable", vim.tbl_extend("force", { fg = colors.variable }, config.styles.variables))
	highlight("@variable.builtin", { fg = colors.accent })
	highlight("@variable.parameter", { fg = colors.variable })
	highlight("@variable.member", { fg = colors.variable })

	-- Constants
	highlight("@constant", { fg = colors.number })
	highlight("@constant.builtin", { fg = colors.accent })
	highlight("@constant.macro", { fg = colors.preprocessor })

	-- Modules and namespaces
	highlight("@module", { fg = colors.type })
	highlight("@namespace", { fg = colors.type })

	-- Functions
	highlight("@function", vim.tbl_extend("force", { fg = colors["function"] }, config.styles.functions))
	highlight("@function.builtin", { fg = colors.accent })
	highlight("@function.call", { fg = colors["function"] })
	highlight("@function.macro", { fg = colors.preprocessor })
	highlight("@method", { fg = colors["function"] })
	highlight("@method.call", { fg = colors["function"] })
	highlight("@constructor", { fg = colors.accent })

	-- Keywords
	highlight("@keyword", vim.tbl_extend("force", { fg = colors.keyword }, config.styles.keywords))
	highlight("@keyword.function", { fg = colors.keyword })
	highlight("@keyword.operator", { fg = colors.operator })
	highlight("@keyword.return", { fg = colors.keyword })
	highlight("@keyword.conditional", vim.tbl_extend("force", { fg = colors.keyword }, config.styles.conditionals))
	highlight("@keyword.repeat", vim.tbl_extend("force", { fg = colors.keyword }, config.styles.loops))
	highlight("@keyword.exception", { fg = colors.keyword })
	highlight("@keyword.import", { fg = colors.preprocessor })
	highlight("@keyword.control", { fg = colors.keyword })
	highlight("@keyword.control.return", { fg = colors.purple })
	highlight("@keyword.control.goto", { fg = colors.keyword })
	highlight("@keyword.control.break", { fg = colors.keyword })
	highlight("@keyword.control.continue", { fg = colors.keyword })

	-- Types
	highlight("@type", vim.tbl_extend("force", { fg = colors.type }, config.styles.types))
	highlight("@type.builtin", { fg = colors.type })
	highlight("@type.definition", { fg = colors.type })
	highlight("@type.qualifier", { fg = colors.keyword })
	-- C++
	highlight("@storageclass", { fg = colors.keyword })
	highlight("@storageclass.lifetime", { fg = colors.keyword })

	-- Literals
	highlight("@string", vim.tbl_extend("force", { fg = colors.string }, config.styles.strings))
	highlight("@string.escape", { fg = colors.accent })
	highlight("@string.special", { fg = colors.accent })
	highlight("@character", { fg = colors.string })
	highlight("@character.special", { fg = colors.accent })
	highlight("@number", vim.tbl_extend("force", { fg = colors.number }, config.styles.numbers))
	highlight("@number.float", vim.tbl_extend("force", { fg = colors.number }, config.styles.numbers))
	highlight("@boolean", vim.tbl_extend("force", { fg = colors.number }, config.styles.booleans))

	-- Comments
	highlight("@comment", vim.tbl_extend("force", { fg = colors.comment }, config.styles.comments))
	highlight("@comment.documentation", vim.tbl_extend("force", { fg = colors.comment }, config.styles.comments))
	highlight("@comment.error", { fg = colors.red })
	highlight("@comment.warning", { fg = colors.orange })
	highlight("@comment.todo", { fg = colors.bg, bg = colors.yellow, bold = true })
	highlight("@comment.note", { fg = colors.bg, bg = colors.cyan, bold = true })

	-- Operators and punctuation
	highlight("@operator", { fg = colors.operator })
	highlight("@punctuation.delimiter", { fg = colors.punctuation })
	highlight("@punctuation.bracket", { fg = colors.punctuation })
	highlight("@punctuation.special", { fg = colors.accent })

	-- C++ specific
	highlight("@preproc", { fg = colors.preprocessor })
	highlight("@include", { fg = colors.preprocessor })
	highlight("@define", { fg = colors.preprocessor })

	-- Custom highlight for C++ header names in includes
	highlight("@string.special.path", { fg = colors.syntaxHeaderName })

	-- Attributes
	highlight("@attribute", { fg = colors.accent })
	highlight("@property", vim.tbl_extend("force", { fg = colors.variable }, config.styles.properties))

	-- Tags (for markup languages)
	highlight("@tag", { fg = colors.keyword })
	highlight("@tag.attribute", { fg = colors.variable })
	highlight("@tag.delimiter", { fg = colors.punctuation })

	-- Markdown specific
	highlight("@markup.heading", { fg = colors.accent, bold = true })
	highlight("@markup.strong", { fg = colors.orange, bold = true })
	highlight("@markup.emphasis", { fg = colors.yellow, italic = true })
	highlight("@markup.link", { fg = colors.cyan, underline = true })
	highlight("@markup.link.url", { fg = colors.blue, underline = true })
	highlight("@markup.list", { fg = colors.accent })
	highlight("@markup.quote", { fg = colors.comment, italic = true })
	highlight("@markup.raw", { fg = colors.green })

	-- Lua
	highlight("@keyword.function.lua", { fg = colors.keyword })
	highlight("@keyword.return.lua", { fg = colors.keyword })
	highlight("@keyword.conditional.lua", { fg = colors.keyword })
	highlight("@keyword.repeat.lua", { fg = colors.keyword })
	highlight("@variable.builtin.lua", { fg = colors.accent })
	highlight("@constant.builtin.lua", { fg = colors.accent })
	highlight("@function.builtin.lua", { fg = colors.accent })
	highlight("@string.escape.lua", { fg = colors.accent })
	highlight("@operator.lua", { fg = colors.operator })
	highlight("@punctuation.bracket.lua", { fg = colors.punctuation })
	highlight("@punctuation.delimiter.lua", { fg = colors.punctuation })
end

return M

-- lua/nox/groups/syntax.lua
-- Nox colorscheme basic syntax highlights
-- Traditional vim syntax highlighting groups

local M = {}

---Apply a highlight group with the given options
---@param group string The highlight group name
---@param opts table Highlight options (fg, bg, style, etc.)
local function highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

---Configure basic syntax highlighting
---@param colors table Color palette
---@param config table Configuration options
function M.setup(colors, config)
	-- Comments
	highlight("Comment", vim.tbl_extend("force", { fg = colors.comment }, config.styles.comments))

	-- Keywords and preprocessor
	highlight("Keyword", vim.tbl_extend("force", { fg = colors.keyword }, config.styles.keywords))
	highlight("PreProc", { fg = colors.preprocessor })
	highlight("Include", { fg = colors.preprocessor })
	highlight("Define", { fg = colors.preprocessor })
	highlight("Macro", { fg = colors.preprocessor })
	highlight("PreCondit", { fg = colors.preprocessor })

	-- Strings and header names
	highlight("String", vim.tbl_extend("force", { fg = colors.string }, config.styles.strings))
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "cpp", "c", "cxx", "cc", "h", "hpp" },
		callback = function()
			highlight("CppHeaderName", { fg = colors.syntaxHeaderName })

			-- C++: force keyword accent precedence over default syntax groups
			highlight("cppStorageClass", { fg = colors.purple })
			highlight("cppStructure", { fg = colors.purple })
			highlight("cppAccess", { fg = colors.purple })
			highlight("cppModifier", { fg = colors.purple })
			highlight("cppStatement", { fg = colors.purple })
			highlight("cStatement", { fg = colors.purple })

			-- Modern C++ keywords
			highlight("cppOperator", { fg = colors.operator })
			highlight("cppCast", { fg = colors.purple })

			-- Attributes and specifiers
			highlight("cppAttribute", { fg = colors.purple })
			highlight("cppRawString", { fg = colors.string })

			-- Fallback matches for keywords/attributes not covered by treesitter
			vim.cmd([[
				syntax keyword cppPurpleKeywords return goto break continue
				syntax keyword cppPurpleKeywords co_return co_await co_yield
				syntax keyword cppPurpleKeywords public private protected
				syntax keyword cppPurpleKeywords using friend typedef typename
				syntax keyword cppPurpleKeywords static extern inline constexpr consteval constinit
				syntax keyword cppPurpleKeywords mutable virtual override final
				syntax match cppPurpleAttributes /\[\[.*\]\]/
				hi def link cppPurpleKeywords Identifier
				hi def link cppPurpleAttributes Identifier
			]])
			highlight("cppPurpleKeywords", { fg = colors.purple })
			highlight("cppPurpleAttributes", { fg = colors.purple })
		end,
	})

	-- Types
	highlight("Type", vim.tbl_extend("force", { fg = colors.type }, config.styles.types))
	highlight("StorageClass", { fg = colors.purple })
	highlight("Structure", { fg = colors.purple })
	highlight("Typedef", { fg = colors.purple })

	-- Functions
	highlight("Function", vim.tbl_extend("force", { fg = colors["function"] }, config.styles.functions))

	-- Variables and identifiers
	highlight("Identifier", vim.tbl_extend("force", { fg = colors.variable }, config.styles.variables))

	-- Base statements
	highlight("Statement", { fg = colors.purple })

	-- Constants and numbers
	highlight("Constant", { fg = colors.number })
	highlight("Number", vim.tbl_extend("force", { fg = colors.number }, config.styles.numbers))
	highlight("Float", vim.tbl_extend("force", { fg = colors.number }, config.styles.numbers))
	highlight("Boolean", vim.tbl_extend("force", { fg = colors.number }, config.styles.booleans))

	-- Operators and punctuation
	highlight("Operator", { fg = colors.operator })
	highlight("Delimiter", { fg = colors.punctuation })
	highlight("Special", { fg = colors.accent })
	highlight("SpecialChar", { fg = colors.accent })

	-- Control flow
	highlight("Conditional", vim.tbl_extend("force", { fg = colors.keyword }, config.styles.conditionals))
	highlight("Repeat", vim.tbl_extend("force", { fg = colors.keyword }, config.styles.loops))
	highlight("Label", { fg = colors.keyword })
	highlight("Exception", { fg = colors.keyword })

	-- Other
	highlight("Todo", { fg = colors.bg, bg = colors.yellow, bold = true })
	highlight("Error", { fg = colors.red })
	highlight("Underlined", { underline = true })
	highlight("Ignore", { fg = colors.fg_alt })
end

return M
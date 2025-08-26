-- lua/nox/groups/lsp.lua
-- Nox colorscheme LSP highlights
-- LSP semantic tokens, diagnostics, and related features

local M = {}

---Apply a highlight group with the given options
---@param group string The highlight group name
---@param opts table Highlight options (fg, bg, style, etc.)
local function highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

---Configure LSP semantic tokens and diagnostics
---@param colors table Color palette
---@param config table Configuration options
function M.setup(colors, config)
	-- Diagnostic signs
	highlight("DiagnosticError", { fg = colors.red })
	highlight("DiagnosticWarn", { fg = colors.orange })
	highlight("DiagnosticInfo", { fg = colors.cyan })
	highlight("DiagnosticHint", { fg = colors.blue })

	-- Diagnostic virtual text
	highlight("DiagnosticVirtualTextError", { fg = colors.red, bg = colors.bg })
	highlight("DiagnosticVirtualTextWarn", { fg = colors.orange, bg = colors.bg })
	highlight("DiagnosticVirtualTextInfo", { fg = colors.cyan, bg = colors.bg })
	highlight("DiagnosticVirtualTextHint", { fg = colors.blue, bg = colors.bg })

	-- Diagnostic underlines
	highlight("DiagnosticUnderlineError", { sp = colors.red, underline = true })
	highlight("DiagnosticUnderlineWarn", { sp = colors.orange, underline = true })
	highlight("DiagnosticUnderlineInfo", { sp = colors.cyan, underline = true })
	highlight("DiagnosticUnderlineHint", { sp = colors.blue, underline = true })

	-- LSP semantic tokens
	highlight("@lsp.type.class", { fg = colors.type })
	highlight("@lsp.type.decorator", { fg = colors.accent })
	highlight("@lsp.type.enum", { fg = colors.type })
	highlight("@lsp.type.enumMember", { fg = colors.number })
	highlight("@lsp.type.function", { fg = colors["function"] })
	highlight("@lsp.type.interface", { fg = colors.type })
	highlight("@lsp.type.macro", { fg = colors.preprocessor })
	highlight("@lsp.type.method", { fg = colors["function"] })
	highlight("@lsp.type.namespace", { fg = colors.type })
	highlight("@lsp.type.parameter", { fg = colors.variable })
	highlight("@lsp.type.property", { fg = colors.variable })
	highlight("@lsp.type.struct", { fg = colors.type })
	highlight("@lsp.type.type", { fg = colors.type })
	highlight("@lsp.type.typeParameter", { fg = colors.type })
	highlight("@lsp.type.variable", { fg = colors.variable })
	highlight("@lsp.type.keyword", { fg = colors.keyword })

	-- Lua-specific LSP semantic tokens
	highlight("@lsp.type.function.lua", { fg = colors["function"] })
	highlight("@lsp.type.variable.lua", { fg = colors.variable })
	highlight("@lsp.type.parameter.lua", { fg = colors.variable })
	highlight("@lsp.type.property.lua", { fg = colors.variable })
	highlight("@lsp.type.keyword.lua", { fg = colors.keyword })
	highlight("@lsp.type.string.lua", { fg = colors.string })
	highlight("@lsp.type.number.lua", { fg = colors.number })
	highlight("@lsp.type.table.lua", { fg = colors.type })

	-- Reference highlighting
	highlight("LspReferenceText", { bg = colors.bg_element })
	highlight("LspReferenceRead", { bg = colors.bg_element })
	highlight("LspReferenceWrite", { bg = colors.bg_element })

	-- Code lens
	highlight("LspCodeLens", { fg = colors.fg_alt })
	highlight("LspCodeLensSeparator", { fg = colors.fg_alt })
end

return M
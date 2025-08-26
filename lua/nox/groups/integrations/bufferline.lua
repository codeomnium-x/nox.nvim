-- lua/nox/groups/integrations/bufferline.lua
-- Nox colorscheme bufferline.nvim integration

local M = {}

---Apply a highlight group with the given options
---@param group string The highlight group name
---@param opts table Highlight options (fg, bg, style, etc.)
local function highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

---Configure bufferline.nvim highlights
---@param colors table Color palette
---@param config table Configuration options
function M.setup(colors, config)
	-- Handle transparent background option
	local bg = config.transparent and "NONE" or colors.bg
	local bg_alt = config.transparent and "NONE" or colors.bg_alt
	local bg_element = config.transparent and "NONE" or colors.bg_element

	-- Core bufferline
	highlight("BufferLineBackground", { fg = colors.fg_alt, bg = bg_alt })
	highlight("BufferLineBuffer", { fg = colors.fg, bg = bg_alt })
	highlight("BufferLineBufferSelected", { fg = colors.fg, bg = bg, bold = true })
	highlight("BufferLineBufferVisible", { fg = colors.fg_alt, bg = bg_alt })
	highlight("BufferLineFill", { bg = bg_element })

	-- Tabs
	highlight("BufferLineTab", { fg = colors.fg_alt, bg = bg_alt })
	highlight("BufferLineTabSelected", { fg = colors.accent, bg = bg, bold = true })
	highlight("BufferLineTabSeparator", { fg = bg, bg = bg_alt })
	highlight("BufferLineTabSeparatorSelected", { fg = bg, bg = bg })
	highlight("BufferLineTabClose", { fg = colors.red, bg = bg_alt })

	-- Indicators
	highlight("BufferLineIndicatorVisible", { fg = colors.accent, bg = bg_alt })
	highlight("BufferLineIndicatorSelected", { fg = colors.accent, bg = bg })

	-- Separators
	highlight("BufferLineSeparator", { fg = bg, bg = bg_alt })
	highlight("BufferLineSeparatorVisible", { fg = bg, bg = bg_alt })
	highlight("BufferLineSeparatorSelected", { fg = bg, bg = bg })
	highlight("BufferLineOffsetSeparator", { fg = bg, bg = bg })

	-- Close buttons
	highlight("BufferLineCloseButton", { fg = colors.fg_alt, bg = bg_alt })
	highlight("BufferLineCloseButtonVisible", { fg = colors.fg_alt, bg = bg_alt })
	highlight("BufferLineCloseButtonSelected", { fg = colors.red, bg = bg })

	-- Numbers
	highlight("BufferLineNumbers", { fg = colors.fg_alt, bg = bg_alt })
	highlight("BufferLineNumbersVisible", { fg = colors.fg_alt, bg = bg_alt })
	highlight("BufferLineNumbersSelected", { fg = colors.fg, bg = bg, bold = true })

	-- Diagnostics - Error
	highlight("BufferLineError", { fg = colors.red, bg = bg_alt })
	highlight("BufferLineErrorVisible", { fg = colors.red, bg = bg_alt })
	highlight("BufferLineErrorSelected", { fg = colors.red, bg = bg, bold = true })
	highlight("BufferLineErrorDiagnostic", { fg = colors.red, bg = bg_alt })
	highlight("BufferLineErrorDiagnosticVisible", { fg = colors.red, bg = bg_alt })
	highlight("BufferLineErrorDiagnosticSelected", { fg = colors.red, bg = bg })

	-- Diagnostics - Warning
	highlight("BufferLineWarning", { fg = colors.orange, bg = bg_alt })
	highlight("BufferLineWarningVisible", { fg = colors.orange, bg = bg_alt })
	highlight("BufferLineWarningSelected", { fg = colors.orange, bg = bg, bold = true })
	highlight("BufferLineWarningDiagnostic", { fg = colors.orange, bg = bg_alt })
	highlight("BufferLineWarningDiagnosticVisible", { fg = colors.orange, bg = bg_alt })
	highlight("BufferLineWarningDiagnosticSelected", { fg = colors.orange, bg = bg })

	-- Diagnostics - Info
	highlight("BufferLineInfo", { fg = colors.cyan, bg = bg_alt })
	highlight("BufferLineInfoVisible", { fg = colors.cyan, bg = bg_alt })
	highlight("BufferLineInfoSelected", { fg = colors.cyan, bg = bg, bold = true })
	highlight("BufferLineInfoDiagnostic", { fg = colors.cyan, bg = bg_alt })
	highlight("BufferLineInfoDiagnosticVisible", { fg = colors.cyan, bg = bg_alt })
	highlight("BufferLineInfoDiagnosticSelected", { fg = colors.cyan, bg = bg })

	-- Diagnostics - Hint
	highlight("BufferLineHint", { fg = colors.blue, bg = bg_alt })
	highlight("BufferLineHintVisible", { fg = colors.blue, bg = bg_alt })
	highlight("BufferLineHintSelected", { fg = colors.blue, bg = bg, bold = true })
	highlight("BufferLineHintDiagnostic", { fg = colors.blue, bg = bg_alt })
	highlight("BufferLineHintDiagnosticVisible", { fg = colors.blue, bg = bg_alt })
	highlight("BufferLineHintDiagnosticSelected", { fg = colors.blue, bg = bg })

	-- General diagnostics
	highlight("BufferLineDiagnostic", { fg = colors.fg_alt, bg = bg_alt })
	highlight("BufferLineDiagnosticVisible", { fg = colors.fg_alt, bg = bg_alt })
	highlight("BufferLineDiagnosticSelected", { fg = colors.fg, bg = bg, bold = true })

	-- Modified indicators
	highlight("BufferLineModified", { fg = colors.orange, bg = bg_alt })
	highlight("BufferLineModifiedVisible", { fg = colors.orange, bg = bg_alt })
	highlight("BufferLineModifiedSelected", { fg = colors.orange, bg = bg })

	-- Pick mode (for buffer picking)
	highlight("BufferLinePick", { fg = colors.red, bg = bg_alt, bold = true })
	highlight("BufferLinePickVisible", { fg = colors.red, bg = bg_alt, bold = true })
	highlight("BufferLinePickSelected", { fg = colors.red, bg = bg, bold = true })

	-- Duplicate names
	highlight("BufferLineDuplicate", { fg = colors.fg_alt, bg = bg_alt, italic = true })
	highlight("BufferLineDuplicateVisible", { fg = colors.fg_alt, bg = bg_alt, italic = true })
	highlight("BufferLineDuplicateSelected", { fg = colors.fg, bg = bg, italic = true })
end

return M

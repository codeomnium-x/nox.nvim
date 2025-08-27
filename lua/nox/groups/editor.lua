-- lua/nox/groups/editor.lua
-- Nox colorscheme editor UI highlights
-- Core editor elements, cursor, selections, search, messages, etc.

local M = {}

---Apply a highlight group with the given options
---@param group string The highlight group name
---@param opts table Highlight options (fg, bg, style, etc.)
local function highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

---Configure core editor UI elements
---@param colors table Color palette
---@param config table Configuration options
function M.setup(colors, config)
	-- Handle transparent background option
	local bg = config.transparent and "NONE" or colors.bg

	-- Core editor
	highlight("Normal", { fg = colors.fg, bg = bg })
	highlight("NormalFloat", { fg = colors.fg, bg = colors.bg_alt })
	highlight("FloatBorder", { fg = colors.border, bg = colors.bg_alt })
	highlight("FloatTitle", { fg = colors.accent, bg = colors.bg_alt })

	-- Cursor and line highlighting
	highlight("Cursor", { fg = colors.bg, bg = colors.fg })
	highlight("CursorLine", { bg = colors.bg_element })
	highlight("CursorColumn", { bg = colors.bg_element })
	highlight("CursorLineNr", { fg = colors.accent, bold = true })
	highlight("LineNr", { fg = colors.LineNr })

	-- Columns and signs
	highlight("SignColumn", { fg = colors.comment, bg = bg })
	highlight("FoldColumn", { fg = colors.comment, bg = bg })

	-- Selection and search
	highlight("Visual", { bg = colors.bg_element })
	highlight("VisualNOS", { bg = colors.bg_element })
	highlight("Search", { fg = colors.bg, bg = colors.yellow })
	highlight("IncSearch", { fg = colors.bg, bg = colors.orange })
	highlight("CurSearch", { fg = colors.bg, bg = colors.orange })

	-- Messages and prompts
	highlight("ErrorMsg", { fg = colors.red })
	highlight("WarningMsg", { fg = colors.orange })
	highlight("MoreMsg", { fg = colors.green })
	highlight("Question", { fg = colors.cyan })

	-- Status and tab lines
	highlight("StatusLine", { fg = colors.fg, bg = colors.bg_alt })
	highlight("StatusLineNC", { fg = colors.fg_alt, bg = colors.bg_alt })
	highlight("TabLine", { fg = colors.fg_alt, bg = colors.bg_alt })
	highlight("TabLineFill", { bg = colors.bg_alt })
	highlight("TabLineSel", { fg = colors.fg, bg = colors.bg_element })

	-- Window management
	highlight("VertSplit", { fg = colors.border })
	highlight("WinSeparator", { fg = colors.border })
	highlight("Folded", { fg = colors.fg_alt, bg = colors.bg_element })

	-- Completion menu
	highlight("Pmenu", { fg = colors.fg, bg = colors.bg_alt })
	highlight("PmenuSel", { fg = colors.bg, bg = colors.accent })
	highlight("PmenuSbar", { bg = colors.bg_element })
	highlight("PmenuThumb", { bg = colors.fg_alt })

	-- Diff and version control
	highlight("DiffAdd", { fg = colors.green, bg = colors.bg })
	highlight("DiffChange", { fg = colors.yellow, bg = colors.bg })
	highlight("DiffDelete", { fg = colors.red, bg = colors.bg })
	highlight("DiffText", { fg = colors.blue, bg = colors.bg })
end

return M
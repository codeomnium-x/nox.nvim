-- lua/nox/groups/integrations/snacks_explorer.lua

local M = {}

---Apply a highlight group with the given options
---@param group string The highlight group name
---@param opts table Highlight options (fg, bg, style, etc.)
local function highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

---Configure snacks.nvim explorer highlights
---@param colors table Color palette
---@param config table Configuration options
function M.setup(colors, config)
	-- Handle transparent background option
	local bg = config.transparent and "NONE" or colors.bg
	local bg_alt = config.transparent and "NONE" or colors.bg_alt
	local bg_element = config.transparent and "NONE" or colors.bg_element

	-- Theme-aware color adjustments for better contrast in light theme
	local is_light_theme = config.theme == "light"
	local folder_color = is_light_theme and colors.primary or colors.blue
	local info_color = is_light_theme and colors.primary or colors.cyan
	local special_color = is_light_theme and colors.accent or colors.cyan

	-- Core window highlights 
	highlight("SnacksExplorerNormal", { fg = colors.fg, bg = bg })
	highlight("SnacksExplorerNormalNC", { fg = colors.fg_alt, bg = bg })
	highlight("SnacksExplorerBorder", { fg = colors.border, bg = bg })
	highlight("SnacksExplorerTitle", { fg = colors.primary, bg = bg, bold = true })
	highlight("SnacksExplorerWinSeparator", { fg = colors.border, bg = bg })

	-- Core picker highlights
	highlight("SnacksPicker", { fg = colors.fg, bg = bg })
	highlight("SnacksPickerNormal", { fg = colors.fg, bg = bg })
	highlight("SnacksPickerBorder", { fg = colors.border, bg = bg })
	highlight("SnacksPickerTitle", { fg = colors.primary, bg = bg, bold = true })
	highlight("SnacksPickerPrompt", { fg = colors.accent, bold = true })
	highlight("SnacksPickerMatch", { fg = colors.yellow, bold = true })
	highlight("Directory", { fg = folder_color, bold = true })

	-- Picker list highlights
	highlight("SnacksPickerList", { fg = colors.fg, bg = bg })
	highlight("SnacksPickerListItem", { fg = colors.fg, bg = bg })
	highlight("SnacksPickerListDir", { fg = folder_color, bold = true })
	highlight("SnacksPickerListFile", { fg = colors.fg })
	highlight("SnacksPickerListCursor", { bg = bg_element })
	highlight("SnacksPickerListSelected", { fg = colors.bg, bg = colors.accent })

	-- Treesitter path highlights
	highlight("@string.special.path", { fg = folder_color })

	-- File and directory items
	highlight("SnacksExplorerFile", { fg = colors.fg })
	highlight("SnacksExplorerDir", { fg = folder_color })
	highlight("SnacksExplorerDirOpen", { fg = colors.accent })
	highlight("SnacksExplorerDirClosed", { fg = folder_color })
	highlight("SnacksExplorerSymlink", { fg = info_color, italic = true })
	highlight("SnacksExplorerExecutable", { fg = colors.green, bold = true })

	-- File type highlighting
	highlight("SnacksExplorerConfig", { fg = colors.yellow })
	highlight("SnacksExplorerReadme", { fg = special_color })
	highlight("SnacksExplorerLicense", { fg = special_color })
	highlight("SnacksExplorerMarkdown", { fg = special_color })
	highlight("SnacksExplorerImage", { fg = special_color })
	highlight("SnacksExplorerArchive", { fg = colors.orange })
	highlight("SnacksExplorerHidden", { fg = colors.fg_alt, italic = true })

	-- Icons
	highlight("SnacksExplorerIcon", { fg = colors.fg })
	highlight("SnacksExplorerIconDir", { fg = folder_color })
	highlight("SnacksExplorerIconFile", { fg = colors.fg })
	highlight("SnacksExplorerIconSymlink", { fg = info_color })
	highlight("SnacksExplorerIconExecutable", { fg = colors.green })

	-- Selection and cursor
	highlight("SnacksExplorerCursor", { bg = bg_element })
	highlight("SnacksExplorerCursorLine", { bg = bg_element })
	highlight("SnacksExplorerSelection", { bg = colors.accent, fg = colors.bg })
	highlight("SnacksExplorerVisual", { bg = colors.accent, fg = colors.bg })

	-- Git integration
	highlight("SnacksExplorerGitAdd", { fg = colors.green })
	highlight("SnacksExplorerGitChange", { fg = colors.orange })
	highlight("SnacksExplorerGitDelete", { fg = colors.red })
	highlight("SnacksExplorerGitIgnore", { fg = colors.fg_alt, italic = true })
	highlight("SnacksExplorerGitRename", { fg = info_color })
	highlight("SnacksExplorerGitStaged", { fg = colors.green })
	highlight("SnacksExplorerGitUnstaged", { fg = colors.orange })
	highlight("SnacksExplorerGitUntracked", { fg = colors.red })

	-- LSP diagonstics
	highlight("SnacksExplorerDiagnosticError", { fg = colors.red })
	highlight("SnacksExplorerDiagnosticWarn", { fg = colors.orange })
	highlight("SnacksExplorerDiagnosticInfo", { fg = info_color })
	highlight("SnacksExplorerDiagnosticHint", { fg = colors.blue })

	-- Search and filter
	highlight("SnacksExplorerSearch", { fg = colors.bg, bg = colors.yellow, bold = true })
	highlight("SnacksExplorerFilter", { fg = colors.primary, bold = true })
	highlight("SnacksExplorerFilterActive", { fg = colors.accent, bold = true })

	-- Status and feedback
	highlight("SnacksExplorerStatus", { fg = colors.fg_alt, bg = bg_alt })
	highlight("SnacksExplorerInfo", { fg = info_color })
	highlight("SnacksExplorerWarning", { fg = colors.orange })
	highlight("SnacksExplorerError", { fg = colors.red })

	-- Tree structure
	highlight("SnacksExplorerIndent", { fg = colors.border })
	highlight("SnacksExplorerIndentGuide", { fg = colors.border })
	highlight("SnacksExplorerTreeLine", { fg = colors.border })
	highlight("SnacksExplorerTreeExpand", { fg = colors.blue })
	highlight("SnacksExplorerTreeCollapse", { fg = colors.blue })

	-- File states
	highlight("SnacksExplorerModified", { fg = colors.orange })
	highlight("SnacksExplorerNew", { fg = colors.green })
	highlight("SnacksExplorerDeleted", { fg = colors.red })
	highlight("SnacksExplorerRenamed", { fg = info_color })

	-- Copy/cut operations
	highlight("SnacksExplorerCopy", { fg = colors.green, bold = true })
	highlight("SnacksExplorerCut", { fg = colors.red, bold = true })
	highlight("SnacksExplorerPaste", { fg = info_color, bold = true })

	-- Preview and details
	highlight("SnacksExplorerPreview", { fg = colors.fg, bg = bg_alt })
	highlight("SnacksExplorerPreviewBorder", { fg = colors.border, bg = bg_alt })
	highlight("SnacksExplorerDetails", { fg = colors.fg_alt })
	highlight("SnacksExplorerSize", { fg = colors.fg_alt })
	highlight("SnacksExplorerDate", { fg = colors.fg_alt })
	highlight("SnacksExplorerPermissions", { fg = colors.fg_alt })

	-- Help system
	highlight("SnacksExplorerHelp", { fg = colors.fg_alt, italic = true })
	highlight("SnacksExplorerHelpKey", { fg = colors.primary, bold = true })
	highlight("SnacksExplorerHelpDesc", { fg = colors.fg_alt })

	-- Progress indicator
	highlight("SnacksExplorerProgress", { fg = info_color })
	highlight("SnacksExplorerLoading", { fg = info_color, italic = true })

	-- Floating windows
	highlight("SnacksExplorerPopup", { fg = colors.fg, bg = bg_alt })
	highlight("SnacksExplorerPopupBorder", { fg = colors.border, bg = bg_alt })
	highlight("SnacksExplorerFloat", { fg = colors.fg, bg = bg_alt })
	highlight("SnacksExplorerFloatBorder", { fg = colors.border, bg = bg_alt })

	-- Context menu
	highlight("SnacksExplorerMenu", { fg = colors.fg, bg = bg_alt })
	highlight("SnacksExplorerMenuBorder", { fg = colors.border, bg = bg_alt })
	highlight("SnacksExplorerMenuItem", { fg = colors.fg })
	highlight("SnacksExplorerMenuSelected", { fg = colors.bg, bg = colors.accent })

	-- Tab navigation
	highlight("SnacksExplorerTab", { fg = colors.fg_alt, bg = bg_alt })
	highlight("SnacksExplorerTabActive", { fg = colors.fg, bg = bg, bold = true })
	highlight("SnacksExplorerTabInactive", { fg = colors.fg_alt, bg = bg_alt })

	-- Breadcrumb navigation
	highlight("SnacksExplorerBreadcrumb", { fg = colors.fg_alt })
	highlight("SnacksExplorerBreadcrumbSeparator", { fg = colors.border })
	highlight("SnacksExplorerBreadcrumbActive", { fg = colors.primary, bold = true })

	-- Action system
	highlight("SnacksExplorerShortcut", { fg = colors.primary, bold = true })
	highlight("SnacksExplorerAction", { fg = colors.accent })
	highlight("SnacksExplorerActionKey", { fg = colors.primary, bold = true })

	-- Opertion feedback
	highlight("SnacksExplorerSuccess", { fg = colors.green })
	highlight("SnacksExplorerFailure", { fg = colors.red })
	highlight("SnacksExplorerPending", { fg = colors.orange })

	-- Picker integration
	highlight("SnacksExplorerPicker", { fg = colors.fg, bg = bg })
	highlight("SnacksExplorerPickerBorder", { fg = colors.border, bg = bg })
	highlight("SnacksExplorerPickerTitle", { fg = colors.primary, bg = bg, bold = true })
	highlight("SnacksExplorerPickerPrompt", { fg = colors.accent, bold = true })
	highlight("SnacksExplorerPickerMatch", { fg = colors.yellow, bold = true })
end

return M

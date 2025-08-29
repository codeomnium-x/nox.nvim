-- lua/nox/groups/integrations/nvim_tree.lua

local M = {}

---Apply a highlight group with the given options
---@param group string The highlight group name
---@param opts table Highlight options (fg, bg, style, etc.)
local function highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

---Configure nvim-tree highlights
---@param colors table Color palette
---@param config table Configuration options
function M.setup(colors, config)
	-- Handle transparent background option
	local bg = config.transparent and "NONE" or colors.bg
	local bg_alt = config.transparent and "NONE" or colors.bg_alt
	local bg_element = config.transparent and "NONE" or colors.bg_element

	-- Theme-aware color adjustments for better contrast
	local is_light_theme = config.theme == "light"
	local folder_color = is_light_theme and colors.primary or colors.blue
	local muted_text = is_light_theme and colors.fg_alt or colors.fg_alt
	local info_color = is_light_theme and colors.primary or colors.cyan
	local special_color = is_light_theme and colors.accent or colors.cyan

	-- Core nvim-tree window and background
	highlight("NvimTreeNormal", { fg = colors.fg, bg = bg })
	highlight("NvimTreeNormalNC", { fg = colors.fg_alt, bg = bg })
	highlight("NvimTreeEndOfBuffer", { fg = bg, bg = bg })
	highlight("NvimTreeWinSeparator", { fg = colors.border, bg = bg })
	highlight("NvimTreeStatusLine", { fg = colors.fg_alt, bg = bg_alt })
	highlight("NvimTreeStatusLineNC", { fg = colors.fg_alt, bg = bg_alt })

	-- File and directory icons
	highlight("NvimTreeFileIcon", { fg = colors.fg })
	highlight("NvimTreeFolderIcon", { fg = folder_color })
	highlight("NvimTreeOpenedFolderIcon", { fg = colors.accent })
	highlight("NvimTreeClosedFolderIcon", { fg = folder_color })
	highlight("NvimTreeEmptyFolderIcon", { fg = muted_text })

	-- File and directory names
	highlight("NvimTreeFileName", { fg = colors.fg })
	highlight("NvimTreeFolderName", { fg = colors.fg })
	highlight("NvimTreeOpenedFolderName", { fg = colors.accent })
	highlight("NvimTreeRootFolder", { fg = colors.primary, bold = true })
	highlight("NvimTreeSymlink", { fg = info_color, italic = true })
	highlight("NvimTreeExecFile", { fg = colors.green, bold = true })

	-- Special file types
	highlight("NvimTreeSpecialFile", { fg = colors.yellow, underline = true })
	highlight("NvimTreeImageFile", { fg = colors.purple })
	highlight("NvimTreeMarkdownFile", { fg = special_color })

	-- Git integration
	highlight("NvimTreeGitDirty", { fg = colors.orange })
	highlight("NvimTreeGitStaged", { fg = colors.green })
	highlight("NvimTreeGitMerge", { fg = colors.purple })
	highlight("NvimTreeGitRenamed", { fg = info_color })
	highlight("NvimTreeGitNew", { fg = colors.green })
	highlight("NvimTreeGitDeleted", { fg = colors.red })
	highlight("NvimTreeGitIgnored", { fg = colors.fg_alt, italic = true })

	-- LSP diagnostics integration
	highlight("NvimTreeLspDiagnosticsError", { fg = colors.red })
	highlight("NvimTreeLspDiagnosticsWarning", { fg = colors.orange })
	highlight("NvimTreeLspDiagnosticsInformation", { fg = info_color })
	highlight("NvimTreeLspDiagnosticsHint", { fg = colors.blue })

	-- Selection and cursor
	highlight("NvimTreeCursorLine", { bg = bg_element })
	highlight("NvimTreeCursorColumn", { bg = bg_element })
	highlight("NvimTreeVisual", { bg = colors.accent, fg = colors.bg })

	-- Indent guides
	highlight("NvimTreeIndentMarker", { fg = colors.border })
	highlight("NvimTreeLiveFilterPrefix", { fg = colors.accent, bold = true })
	highlight("NvimTreeLiveFilterValue", { fg = colors.primary, bold = true })

	-- Window picker integration
	highlight("NvimTreeWindowPicker", { fg = colors.bg, bg = colors.accent, bold = true })

	-- Bookmarks
	highlight("NvimTreeBookmark", { fg = colors.purple, bold = true })

	-- Modified files
	highlight("NvimTreeModifiedFile", { fg = colors.orange })
	highlight("NvimTreeModifiedIcon", { fg = colors.orange })

	-- Copy/cut indicators
	highlight("NvimTreeCopiedHL", { fg = colors.green, bold = true })
	highlight("NvimTreeCutHL", { fg = colors.red, bold = true })

	-- Popup menu (for rename, create, etc.)
	highlight("NvimTreePopup", { fg = colors.fg, bg = bg_alt })
	highlight("NvimTreePopupBorder", { fg = colors.border, bg = bg_alt })

	-- File size and permissions
	highlight("NvimTreeFileSize", { fg = colors.fg_alt })
	highlight("NvimTreeFilePermissions", { fg = colors.fg_alt })

	-- Search highlighting
	highlight("NvimTreeSearch", { fg = colors.bg, bg = colors.yellow, bold = true })

	-- Help text
	highlight("NvimTreeHelp", { fg = colors.fg_alt, italic = true })

	-- Clipboard indicators
	highlight("NvimTreeClipboard", { fg = info_color, bold = true })

	-- Directory arrows/expanders
	highlight("NvimTreeOpenedFile", { fg = colors.accent })
	highlight("NvimTreeClosedFile", { fg = colors.fg })

	-- Filter highlighting
	highlight("NvimTreeFilterTerm", { fg = colors.primary, bold = true })

	-- Diagnostics count
	highlight("NvimTreeDiagnosticErrorText", { fg = colors.red })
	highlight("NvimTreeDiagnosticWarningText", { fg = colors.orange })
	highlight("NvimTreeDiagnosticInfoText", { fg = info_color })
	highlight("NvimTreeDiagnosticHintText", { fg = colors.blue })

	-- Git folder status
	highlight("NvimTreeGitFolderDirty", { fg = colors.orange })
	highlight("NvimTreeGitFolderStaged", { fg = colors.green })
	highlight("NvimTreeGitFolderNew", { fg = colors.green })

	-- Additional file type highlights
	highlight("NvimTreeConfigFile", { fg = colors.yellow })
	highlight("NvimTreeLicenseFile", { fg = colors.purple })
	highlight("NvimTreeReadmeFile", { fg = special_color })
	highlight("NvimTreeDocumentationFile", { fg = colors.blue })

	-- Hidden files
	highlight("NvimTreeHiddenFile", { fg = colors.fg_alt, italic = true })
	highlight("NvimTreeHiddenFolder", { fg = colors.fg_alt, italic = true })
end

return M

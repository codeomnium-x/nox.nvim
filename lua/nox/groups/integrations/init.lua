-- lua/nox/groups/integrations/init.lua
-- Nox colorscheme plugin integrations
-- Centralized loading of all plugin integration modules

local M = {}

---Apply a highlight group with the given options
---@param group string The highlight group name
---@param opts table Highlight options (fg, bg, style, etc.)
local function highlight(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

---Configure all plugin integrations
---@param colors table Color palette
---@param config table Configuration options
function M.setup(colors, config)
	-- Bufferline
	require("nox.groups.integrations.bufferline").setup(colors, config)

	-- Nvim-tree file explorer
	require("nox.groups.integrations.nvim_tree").setup(colors, config)

	-- Snacks.nvim explorer
	require("nox.groups.integrations.snacks_explorer").setup(colors, config)

	-- Lualine 
	highlight("lualine_a_normal", { fg = colors.bg, bg = colors.accent, bold = true })
	highlight("lualine_a_insert", { fg = colors.bg, bg = colors.green, bold = true })
	highlight("lualine_a_visual", { fg = colors.bg, bg = colors.purple, bold = true })
	highlight("lualine_a_command", { fg = colors.bg, bg = colors.yellow, bold = true })
	highlight("lualine_b_normal", { fg = colors.fg, bg = colors.bg_alt })
	highlight("lualine_c_normal", { fg = colors.fg_alt, bg = colors.bg })

	-- Noice notification
	highlight("NoicePopup", { fg = colors.fg, bg = colors.bg_alt })
	highlight("NoicePopupmenu", { fg = colors.fg, bg = colors.bg_alt })
	highlight("NoiceConfirm", { fg = colors.fg, bg = colors.bg_alt })
	highlight("NoiceCmdline", { fg = colors.fg, bg = colors.bg_alt })

	-- Diagnostics and navigation
	highlight("TroubleText", { fg = colors.fg_alt })
	highlight("TroubleSource", { fg = colors.fg_alt })
	highlight("TroubleCode", { fg = colors.fg_alt })
	highlight("TroubleCount", { fg = colors.purple, bg = colors.bg_alt })
	highlight("TroubleNormal", { fg = colors.fg, bg = colors.bg })

	-- Search and movement
	highlight("FlashBackdrop", { fg = colors.fg_alt })
	highlight("FlashMatch", { fg = colors.bg, bg = colors.accent, bold = true })
	highlight("FlashCurrent", { fg = colors.bg, bg = colors.orange, bold = true })
	highlight("FlashLabel", { fg = colors.bg, bg = colors.red, bold = true })

	-- Which-key
	highlight("WhichKey", { fg = colors.accent })
	highlight("WhichKeyGroup", { fg = colors.blue })
	highlight("WhichKeyDesc", { fg = colors.fg })
	highlight("WhichKeySeparator", { fg = colors.fg_alt })
	highlight("WhichKeyFloat", { bg = colors.bg_alt })
	highlight("WhichKeyBorder", { fg = colors.border, bg = colors.bg_alt })

	-- Version control
	highlight("GitSignsAdd", { fg = colors.green })
	highlight("GitSignsChange", { fg = colors.orange })
	highlight("GitSignsDelete", { fg = colors.red })
	highlight("GitSignsAddNr", { fg = colors.green })
	highlight("GitSignsChangeNr", { fg = colors.orange })
	highlight("GitSignsDeleteNr", { fg = colors.red })
	highlight("GitSignsAddLn", { bg = colors.diff_add })
	highlight("GitSignsChangeLn", { bg = colors.diff_change })

	-- Completion
	highlight("BlinkCmpMenu", { fg = colors.fg, bg = colors.bg_alt })
	highlight("BlinkCmpMenuBorder", { fg = colors.border, bg = colors.bg_alt })
	highlight("BlinkCmpMenuSelection", { fg = colors.bg, bg = colors.accent })
	highlight("BlinkCmpLabel", { fg = colors.fg })
	highlight("BlinkCmpLabelDeprecated", { fg = colors.fg_alt, strikethrough = true })
	highlight("BlinkCmpLabelMatch", { fg = colors.accent, bold = true })
	highlight("BlinkCmpKind", { fg = colors.purple })

	-- Comments and annotations
	highlight("TodoBgFIX", { fg = colors.bg, bg = colors.red, bold = true })
	highlight("TodoBgHACK", { fg = colors.bg, bg = colors.orange, bold = true })
	highlight("TodoBgNOTE", { fg = colors.bg, bg = colors.cyan, bold = true })
	highlight("TodoBgPERF", { fg = colors.bg, bg = colors.purple, bold = true })
	highlight("TodoBgTODO", { fg = colors.bg, bg = colors.yellow, bold = true })
	highlight("TodoBgWARN", { fg = colors.bg, bg = colors.orange, bold = true })
	highlight("TodoFgFIX", { fg = colors.red })
	highlight("TodoFgHACK", { fg = colors.orange })
	highlight("TodoFgNOTE", { fg = colors.cyan })
	highlight("TodoFgPERF", { fg = colors.purple })
	highlight("TodoFgTODO", { fg = colors.yellow })
	highlight("TodoFgWARN", { fg = colors.orange })
	highlight("TodoSignFIX", { fg = colors.red })
	highlight("TodoSignHACK", { fg = colors.orange })
	highlight("TodoSignNOTE", { fg = colors.cyan })
	highlight("TodoSignPERF", { fg = colors.purple })
	highlight("TodoSignTODO", { fg = colors.yellow })
	highlight("TodoSignWARN", { fg = colors.orange })
end

return M
-- lua/nox/highlights.lua
-- Nox colorscheme highlight definitions
-- Applies colors to all Neovim UI elements, syntax groups, and plugin integrations

local M = {}

---Apply all highlight groups for the colorscheme
---@param colors table Complete color palette from palette.get_colors()
---@param config table User configuration options
function M.setup(colors, config)
	vim.cmd("highlight clear")

	-- Apply highlights using modular groups
	require("nox.groups.editor").setup(colors, config)
	require("nox.groups.syntax").setup(colors, config)
	require("nox.groups.treesitter").setup(colors, config)
	require("nox.groups.lsp").setup(colors, config)
	require("nox.groups.integrations").setup(colors, config)

	-- Configure terminal colors if enabled
	if config.terminal_colors then
		require("nox.groups.terminal").setup(colors)
	end
end

return M

-- lua/nox/init.lua
-- Nox colorscheme main API
-- Provides setup() and load() functions for configuring and applying the theme

local M = {}

local config = require("nox.config")
local palette = require("nox.palette")
local highlights = require("nox.highlights")

---@class NoxConfig
---@field theme "dark" | "light" | "umbra" Theme variant to use
---@field transparent boolean Enable transparent background for terminal transparency
---@field terminal_colors boolean Configure terminal colors for integrated terminal
---@field dim_inactive boolean Dim inactive windows for better focus
---@field styles table<string, table> Style overrides for syntax groups (e.g., {comments = {italic = true}})

-- Current configuration (merged defaults + user options)
M.config = config.defaults

---Configure the colorscheme with user preferences
---This function merges user options with defaults and should be called before loading
---@param opts? NoxConfig User configuration options
function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "nox"

	-- Generate color palette based on current theme setting
	local colors = palette.get_colors(M.config.theme)
	
	-- Apply all highlight groups using the generated colors
	highlights.setup(colors, M.config)
end

return M

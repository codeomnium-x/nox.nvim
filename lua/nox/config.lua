-- lua/nox/config.lua
-- Nox colorscheme configuration defaults
-- All options can be overridden in your setup() call for full customization

local M = {}

---Default configuration options for Nox colorscheme
---@type NoxConfig
M.defaults = {
	-- Theme variant: "dark", "light", or "umbra" (warm sepia-toned dark)
	theme = "dark",
	
	-- Enable transparent background 
	transparent = false,
	
	-- Configure terminal colors
	terminal_colors = true,
	
	-- Dim inactive windows to improve focus on the active window
	dim_inactive = false,
	
	-- Style customizations for syntax groups
	-- Add properties like: italic = true, bold = true, underline = true
	styles = {
		comments = { italic = true },    -- Comments (default: italic)
		conditionals = {},               -- if, else, switch statements
		loops = {},                      -- for, while, do loops
		functions = {},                  -- Function names and calls
		keywords = {},                   -- Language keywords (class, return, etc.)
		strings = {},                    -- String literals
		variables = {},                  -- Variable names
		numbers = {},                    -- Numeric literals
		booleans = {},                   -- true, false values
		properties = {},                 -- Object properties and fields
		types = {},                      -- Type names and declarations
	},
}

return M

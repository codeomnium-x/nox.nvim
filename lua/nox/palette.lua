-- lua/nox/palette.lua
-- Nox colorscheme color palette
-- Base colors and semantic mappings for dark and light theme variants

local M = {}

-- Base color definitions for each theme variant
local colors = {
	dark = require("nox.palettes.dark"),
	light = require("nox.palettes.light"),
	umbra = require("nox.palettes.umbra"),
}

-- Semantic color mappings for UI elements and syntax highlighting
local theme_mappings = {
	dark = {
		-- Core theme colors
		primary = colors.dark.darkStep9,        -- Main accent color
		secondary = colors.dark.darkSecondary,  -- Secondary accent (blue)
		accent = colors.dark.darkAccent,        -- Tertiary accent (purple)

		-- Status and feedback colors
		error = colors.dark.darkRed,            -- Error states and diagnostics
		warning = colors.dark.darkOrange,       -- Warning states
		success = colors.dark.darkGreen,        -- Success states and additions
		info = colors.dark.darkCyan,            -- Information and hints

		-- Text hierarchy
		text = colors.dark.darkStep12,          -- Primary text color
		textMuted = colors.dark.darkStep11,     -- Secondary/muted text

		-- Background layers (from back to front)
		background = "#0d1117",                 -- Main editor background
		backgroundPanel = "#161b22",            -- Sidebar and panel backgrounds
		backgroundElement = "#21262d",          -- Floating elements and popups

		-- Border system
		border = colors.dark.darkStep7,         -- Default borders
		borderActive = colors.dark.darkStep8,   -- Active/focused borders
		borderSubtle = colors.dark.darkStep6,   -- Subtle dividers

		-- Syntax highlighting colors
		syntaxComment = colors.dark.darkStep11,     -- Comments and documentation
		syntaxKeyword = colors.dark.darkAccent,     -- Language keywords
		syntaxFunction = colors.dark.darkStep9,     -- Function names
		syntaxVariable = colors.dark.darkRed,       -- Variable names
		syntaxString = colors.dark.darkGreen,       -- String literals
		syntaxNumber = colors.dark.darkOrange,      -- Numeric literals
		syntaxType = colors.dark.darkYellow,        -- Type names
		syntaxOperator = colors.dark.darkCyan,      -- Operators and symbols
		syntaxPunctuation = colors.dark.darkStep12, -- Punctuation marks
	},
	light = {
		-- Core theme colors
		primary = colors.light.lightStep9,       -- Main accent color
		secondary = colors.light.lightSecondary, -- Secondary accent (purple)
		accent = colors.light.lightAccent,       -- Tertiary accent (orange)

		-- Status and feedback colors
		error = colors.light.lightRed,           -- Error states and diagnostics
		warning = colors.light.lightOrange,      -- Warning states
		success = colors.light.lightGreen,       -- Success states and additions
		info = colors.light.lightCyan,           -- Information and hints

		-- Text hierarchy
		text = colors.light.lightStep12,         -- Primary text color
		textMuted = colors.light.lightStep11,    -- Secondary/muted text

		-- Background layers (from back to front)
		background = "#fefefe",                  -- Main editor background (warm white)
		backgroundPanel = "#f8f9fa",             -- Sidebar and panel backgrounds
		backgroundElement = "#f1f3f4",           -- Floating elements and popups

		-- Border system
		border = colors.light.lightStep7,        -- Default borders
		borderActive = colors.light.lightStep8,  -- Active/focused borders
		borderSubtle = colors.light.lightStep6,  -- Subtle dividers

		-- Syntax highlighting colors
		syntaxComment = colors.light.lightStep11,     -- Comments and documentation
		syntaxKeyword = colors.light.lightAccent,     -- Language keywords
		syntaxFunction = colors.light.lightStep9,     -- Function names
		syntaxVariable = colors.light.lightRed,       -- Variable names
		syntaxString = colors.light.lightGreen,       -- String literals
		syntaxNumber = colors.light.lightOrange,      -- Numeric literals
		syntaxType = colors.light.lightYellow,        -- Type names
		syntaxOperator = colors.light.lightCyan,      -- Operators and symbols
		syntaxPunctuation = colors.light.lightStep12, -- Punctuation marks
	},
	umbra = {
		-- Core theme colors
		primary = colors.umbra.umbraStep9,        -- Main accent color
		secondary = colors.umbra.umbraSecondary,  -- Secondary accent (blue)
		accent = colors.umbra.umbraAccent,        -- Tertiary accent (purple)

		-- Status and feedback colors
		error = colors.umbra.umbraRed,            -- Error states and diagnostics
		warning = colors.umbra.umbraOrange,       -- Warning states
		success = colors.umbra.umbraGreen,        -- Success states and additions
		info = colors.umbra.umbraCyan,            -- Information and hints

		-- Text hierarchy
		text = colors.umbra.umbraStep12,          -- Primary text color
		textMuted = colors.umbra.umbraStep11,     -- Secondary/muted text

		-- Background layers (from back to front) - warm, sepia-toned
		background = "#1a1612",                   -- Main editor background (warm dark)
		backgroundPanel = "#252017",              -- Sidebar and panel backgrounds
		backgroundElement = "#2f2a1f",            -- Floating elements and popups

		-- Border system
		border = colors.umbra.umbraStep7,         -- Default borders
		borderActive = colors.umbra.umbraStep8,   -- Active/focused borders
		borderSubtle = colors.umbra.umbraStep6,   -- Subtle dividers

		-- Syntax highlighting colors
		syntaxComment = colors.umbra.umbraStep11,     -- Comments and documentation
		syntaxKeyword = colors.umbra.umbraAccent,     -- Language keywords
		syntaxFunction = colors.umbra.umbraStep9,     -- Function names
		syntaxVariable = colors.umbra.umbraRed,       -- Variable names
		syntaxString = colors.umbra.umbraGreen,       -- String literals
		syntaxNumber = colors.umbra.umbraOrange,      -- Numeric literals
		syntaxType = colors.umbra.umbraYellow,        -- Type names
		syntaxOperator = colors.umbra.umbraCyan,      -- Operators and symbols
		syntaxPunctuation = colors.umbra.umbraStep12, -- Punctuation marks
	},
}

---Generate complete color palette for the specified theme
---@param theme "dark" | "light" | "umbra" Theme variant to generate colors for
---@return table Complete color palette with all colors for highlighting
function M.get_colors(theme)
	local base = theme_mappings[theme]

	if not base then
		error(string.format("Unknown theme '%s'. Available themes: %s",
			theme, table.concat(vim.tbl_keys(theme_mappings), ", ")))
	end

	-- Header names in #include statements (cyan vs purple #include keyword)
	local header_name = theme == "dark" and colors.dark.darkCyan
		or theme == "light" and colors.light.lightCyan
		or colors.umbra.umbraCyan

	return vim.tbl_extend("force", base, {
		-- Language-specific enhancements
		syntaxHeaderName = header_name,         -- C++ header names in #include

		-- Syntax element aliases
		preprocessor = base.accent,             -- #define, #include, etc.
		keyword = base.accent,                  -- class, return, if, etc.
		type = base.syntaxType,                 -- int, string, custom types
		["function"] = base.syntaxFunction,     -- Function names and calls
		variable = base.syntaxVariable,         -- Variable identifiers
		string = base.syntaxString,             -- String literals
		number = base.syntaxNumber,             -- Numeric literals (standard)
		operator = base.syntaxOperator,         -- +, -, =, etc.
		punctuation = base.syntaxPunctuation,   -- Brackets, semicolons
		comment = base.syntaxComment,           -- Comments and documentation

		-- UI color aliases
		bg = base.background,                   -- Main background
		bg_alt = base.backgroundPanel,          -- Alternative background
		bg_element = base.backgroundElement,    -- Element background
		fg = base.text,                         -- Primary foreground
		fg_alt = base.textMuted,                -- Muted foreground

		-- Standard color names
		red = base.error,
		orange = base.warning,
		yellow = theme == "dark" and colors.dark.darkYellow
			or theme == "light" and colors.light.lightYellow
			or colors.umbra.umbraYellow,
		green = base.success,
		cyan = base.info,
		blue = base.secondary,
		purple = base.accent,
		magenta = base.accent,

		-- Git diff colors
		diff_add = "#4fd6be",                   -- Added lines (teal)
		diff_delete = "#c53b53",                -- Deleted lines (red)
		diff_change = "#828bb8",                -- Changed lines (blue)
		diff_text = "#b8db87",                  -- Changed text (green)
	})
end

return M

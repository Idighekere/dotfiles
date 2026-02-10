-- YOu can add your colorscheme plugins here
-- Make sure to set the colorscheme in the config function
-- Example:
return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		local bg = "#011628"
	-- 		local bg_dark = "#011423"
	-- 		local bg_highlight = "#143652"
	-- 		local bg_search = "#0A64AC"
	-- 		local bg_visual = "#275378"
	-- 		local fg = "#CBE0F0"
	-- 		local fg_dark = "#B4D0E9"
	-- 		local fg_gutter = "#627E97"
	-- 		local border = "#547998"
	--
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			on_colors = function(colors)
	-- 				colors.bg = bg
	-- 				colors.bg_dark = bg_dark
	-- 				colors.bg_float = bg_dark
	-- 				colors.bg_highlight = bg_highlight
	-- 				colors.bg_popup = bg_dark
	-- 				colors.bg_search = bg_search
	-- 				colors.bg_sidebar = bg_dark
	-- 				colors.bg_statusline = bg_dark
	-- 				colors.bg_visual = bg_visual
	-- 				colors.border = border
	-- 				colors.fg = fg
	-- 				colors.fg_dark = fg_dark
	-- 				colors.fg_float = fg
	-- 				colors.fg_gutter = fg_gutter
	-- 				colors.fg_sidebar = fg_dark
	-- 			end,
	-- 		})
	-- 		-- load the colorscheme here
	-- 		vim.cmd([[colorscheme tokyonight]])
	--
	-- 		vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#555555", italic = true })
	-- 	end,
	-- },

	-- ONE DARK THEME
	{
		"navarasu/onedark.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("onedark").setup({
				style = "deep", -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
				highlights = {
					-- Change #3e4451 to something brighter like #5c6370 or a custom tint
					-- "bg" is the background color of the selection
					["Visual"] = { bg = "#4a5264" },
				},
			})
			require("onedark").load()
			vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#555555", italic = true })
		end,
	},
}

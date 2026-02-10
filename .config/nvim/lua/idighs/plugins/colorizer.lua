return {
	"NvChad/nvim-colorizer.lua",
	event = "BufReadPre", -- Load when you open a file
	opts = {
		filetypes = { "*" }, -- Enable for all filetypes
		user_default_options = {
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = true, -- "Red", "Blue" etc.
			RRGGBBAA = true, -- #RRGGBBAA hex codes
			AARRGGBB = true, -- 0xAARRGGBB hex codes
			rgb_fn = true, -- CSS rgb() and rgba() functions
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = true, -- Enable all CSS functions: rgb_fn, hsl_fn
			-- Available modes: foreground, background,  virtualtext
			mode = "background", -- Set the display mode
			tailwind = true, -- Enable tailwind colors (if you use it)
			sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
			virtualtext = "■",
		},
	},
}

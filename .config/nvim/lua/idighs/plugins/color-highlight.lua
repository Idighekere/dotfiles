return {
	-- {
	-- 	"brenoprata10/nvim-highlight-colors",
	-- 	event = { "BufReadPre", "BufNewFile" },
	-- 	opts = {
	-- 		---@usage 'background'|'foreground'|'virtualtext'
	-- 		render = "background",
	--
	-- 		-- Enable Tailwind CSS color resolution (reads your project config)
	-- 		enable_tailwind = true,
	--
	-- 		-- Virtual text icon
	-- 		virtual_symbol = "■",
	--
	-- 		-- Highlight named CSS colors like "Red", "Blue"
	-- 		enable_named_colors = true,
	--
	-- 		-- Highlight short hex codes like #fff
	-- 		enable_short_hex = true,
	--
	-- 		--Highlight var usage
	-- 		enable_var_usage = true,
	--
	-- 		custom_colors = {
	-- 			{ label = "oklch%s*%(.-%)", color = "#000000" }, -- Fallback helper
	-- 		},
	--
	-- 		exclude_filetypes = { "lazy", "mason", "help" },
	-- 		exclude_buftypes = { "terminal" },
	-- 	},
	-- 	config = function(_, opts)
	-- 		require("nvim-highlight-colors").setup(opts)
	-- 	end,
	-- },
	{
		"catgoose/nvim-colorizer.lua",
		event = "BufReadPre",
		opts = { -- set to setup table
			filetypes = { "*" }, -- Filetype options.  Accepts table like `user_default_options`
			buftypes = {}, -- Buftype options.  Accepts table like `user_default_options`
			-- Boolean | List of usercommands to enable.  See User commands section.
			user_commands = true, -- Enable all or some usercommands
			lazy_load = false, -- Lazily schedule buffer highlighting setup function
			user_default_options = {
				names = true, -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
				names_opts = { -- options for mutating/filtering names.
					lowercase = true, -- name:lower(), highlight `blue` and `red`
					camelcase = true, -- name, highlight `Blue` and `Red`
					uppercase = false, -- name:upper(), highlight `BLUE` and `RED`
					strip_digits = false, -- ignore names with digits,
					-- highlight `blue` and `red`, but not `blue3` and `red4`
				},
				-- Expects a table of color name to #RRGGBB value pairs.  # is optional
				-- Example: { cool = "#107dac", ["notcool"] = "ee9240" }
				-- Set to false to disable, for example when setting filetype options
				names_custom = {}, -- Custom names to be highlighted: table|function|false
				RGB = true, -- #RGB hex codes
				RGBA = true, -- #RGBA hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				AARRGGBB = true, -- 0xAARRGGBB hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				oklch_fn = true, -- CSS oklch() function
				css = true, -- Enable all CSS *features*:
				-- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn, oklch_fn
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn, oklch_fn
				-- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  True sets to 'normal'
				tailwind = "lsp", -- Enable tailwind colors
				tailwind_opts = { -- Options for highlighting tailwind names
					update_names = true, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
				},
				-- parsers can contain values used in `user_default_options`
				sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
				xterm = false, -- Enable xterm 256-color codes (#xNN, \e[38;5;NNNm)
				-- Highlighting mode.  'background'|'foreground'|'virtualtext'
				mode = "background", -- Set the display mode
				-- Virtualtext character to use
				virtualtext = "■",
				-- Display virtualtext inline with color.  boolean|'before'|'after'.  True sets to 'after'
				virtualtext_inline = false,
				-- Virtualtext highlight mode: 'background'|'foreground'
				virtualtext_mode = "foreground",
				-- update color values even if buffer is not focused
				-- example use: cmp_menu, cmp_docs
				always_update = false,
				-- hooks to invert control of colorizer
				hooks = {
					-- called before line parsing.  Accepts boolean or function that returns boolean
					-- see hooks section below
					disable_line_highlight = false,
				},
			},
		},

		config = function(_, opts)
			require("colorizer").setup(opts)
		end,
	},
}

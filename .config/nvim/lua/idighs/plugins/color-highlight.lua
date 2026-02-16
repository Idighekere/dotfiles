return {
	"brenoprata10/nvim-highlight-colors",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		---@usage 'background'|'foreground'|'virtualtext'
		render = "background",

		-- Enable Tailwind CSS color resolution (reads your project config)
		enable_tailwind = true,

		-- Virtual text icon
		virtual_symbol = "■",

		-- Highlight named CSS colors like "Red", "Blue"
		enable_named_colors = true,

		-- Highlight short hex codes like #fff
		enable_short_hex = true,
	},
	config = function(_, opts)
		require("nvim-highlight-colors").setup(opts)
	end,
}

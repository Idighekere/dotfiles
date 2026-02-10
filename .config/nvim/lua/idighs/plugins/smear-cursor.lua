return {
	"sphamba/smear-cursor.nvim",
	event = "VeryLazy", -- Load late to avoid slowing down startup
	cond = function()
		-- Only load if not using Neovide (Neovide has this built-in)
		return vim.g.neovide == nil
	end,
	opts = {
		-- Smear cursor color. Defaults to Cursor GUI color if not set.
		-- Set to "none" to match the text color at the target position.
		cursor_color = "#d3cdc3",

		-- Smear behavior
		smear_between_buffers = true, -- Smear when switching buffers
		smear_between_neighbor_lines = true, -- Smear even for small movements
		scroll_buffer_space = true, -- Draw in buffer space (smoother for scrolling)

		-- Animation speed (0 to 1)
		stiffness = 0.6, -- Higher = faster/snappier
		trailing_stiffness = 0.3, -- Higher = shorter trail
		damping = 0.85, -- Lower = more "bouncy"

		-- Visual quality
		legacy_computing_symbols_support = false, -- Set true if your font supports block symbols
	},
}

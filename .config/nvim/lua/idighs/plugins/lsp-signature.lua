return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {
		bind = true,
		handler_opts = {
			border = "rounded",
		},
		-- Toggle signature with Ctrl+k (easiest way to close the popup)
		toggle_key = "<C-k>",
		-- Auto-close signature popup on cursor movement or typing
		close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
		-- Floating window options
		floating_window = true,
		floating_window_above_cur_line = true,
		-- Hint options
		hint_enable = true,
		hint_prefix = "🐼 ",
		-- Max dimensions for the floating window
		max_height = 12,
		max_width = 80,
	},
	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,
}

return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {
		bind = true,
		handler_opts = {
			border = "rounded",
		},
		floating_window = true,
		floating_window_above_cur_line = true,
		hint_enable = false, -- disable virtual text hints
		close_timeout = 4000, -- close floating window after 4 seconds of inactivity
		toggle_key = "<C-q>", -- toggle signature help with Ctrl+q
		select_signature_key = "<C-n>", -- cycle to next signature
	},
	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,
}

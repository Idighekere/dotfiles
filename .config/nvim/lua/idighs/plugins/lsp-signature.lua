return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {
		bind = true,
		handler_opts = {
			border = "rounded",
		},
		-- Add toggle key to close/open signature with Ctrl+k
		toggle_key = "<C-k>",
		-- Auto-close signature popup on cursor movement or typing
		close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
		-- Floating window options
		floating_window = true,
		floating_window_above_cur_line = true,
		-- Hint options
		hint_enable = true,
		hint_prefix = "🐼 ",
	},
	config = function(_, opts)
		require("lsp_signature").setup(opts)
		
		-- Add keymap to close signature window with 'q' when it's focused
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "lsp_signature_help",
			callback = function(event)
				vim.keymap.set("n", "q", function()
					vim.api.nvim_win_close(0, true)
				end, { buffer = event.buf, silent = true, desc = "Close signature help" })
			end,
		})
	end,
}

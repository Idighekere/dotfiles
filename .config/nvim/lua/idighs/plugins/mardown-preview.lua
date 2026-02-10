return {
	"toppair/peek.nvim",
	event = { "VeryLazy" },
	build = "deno task --quiet build:fast",
	config = function()
		local peek = require("peek")

		peek.setup({
			-- CHANGED: Setting this to false allows the browser preview
			-- to stay alive even if you :q or :bd the markdown file.
			close_on_bdelete = false,

			auto_load = true,
			syntax = true,
			theme = "dark",
			update_on_change = true,
			app = "browser",
			filetype = { "markdown" },
			throttle_at = 200000,
			throttle_interval = 300,
		})

		-- Create User Commands
		vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
		vim.api.nvim_create_user_command("PeekClose", peek.close, {})

		-- Keybindings
		-- <leader>mo to Open
		vim.keymap.set("n", "<leader>mo", peek.open, { desc = "Peek: Open Markdown Preview" })

		-- <leader>mc to Close (Use this when you finally want the browser tab to shut)
		vim.keymap.set("n", "<leader>mc", peek.close, { desc = "Peek: Close Markdown Preview" })
	end,
}

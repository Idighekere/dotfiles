return {
	"Zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "VeryLazy",
	opts = {
		-- Retain LSPs for 10 mins of inactivity, then kill them to free RAM
		grace_period = 60 * 10,
		wakeup_delay = 0,
		aggressive_mode = true, -- Stop LSPs as soon as you leave a buffer
		excluded_lsp_clients = { "lua_ls", "ts_ls", "tsserver", "tailwindcss", "emmet_ls", "html", "css" }, -- Keep basic stuff, kill the heavy ones
	},
}

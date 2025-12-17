return {
	"barrett-ruth/live-server.nvim",
	-- The 'build' command will run after cloning to ensure live-server is installed
	-- Adjust 'npm install -g live-server' if you used a different package manager like pnpm or yarn
	build = "npm install -g live-server",
	cmd = {
		"LiveServerStart",
		"LiveServerStop",
		"LiveServerToggle",
	},
	config = function()
		require("live-server").setup({
			-- Optional: Customize settings here
			-- For example, to change the default port:
			port = 8080,
			-- open_target = "folder", -- or "file"
		})
	end,
	-- Optional: Set up a keymap for convenience
	keys = {
		{ "<leader>ls", "<cmd>LiveServerToggle<cr>", desc = "Toggle Live Server" },
	},
}

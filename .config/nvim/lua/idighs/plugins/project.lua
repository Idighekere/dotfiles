return {
	"charludo/projectmgr.nvim",
	lazy = false, -- important!

	config = function()
		-- set keymaps
		local map = vim.keymap.set -- for conciseness

		require("projectmgr").setup({
			-- optional: your settings here
			session = { enabled = true },
			autogit = { enabled = false },
			scripts = { enabled = true },
		})

		vim.api.nvim_set_keymap("n", "<leader>p", ":ProjectMgr<CR>", {})
	end,
}

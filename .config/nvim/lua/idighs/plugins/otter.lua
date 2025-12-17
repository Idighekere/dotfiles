return {
	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"neovim/nvim-lspconfig",
		},
		opts = {
			buffers = {
				-- set rendered font size
				-- (useful for high-res screens)
				set_filetype = true,
			},
			handle_leading_whitespace = true,
		},
		config = function(_, opts)
			local otter = require("otter")
			otter.setup(opts)
		end,
	},
}

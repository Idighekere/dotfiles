return {
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			-- import nvim-autopairs
			local autopairs = require("nvim-autopairs")

			-- configure autopairs
			autopairs.setup({
				check_ts = true, -- enable treesitter
				ts_config = {
					lua = { "string" }, -- don't add pairs in lua string treesitter nodes
					javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
					java = false, -- don't check treesitter on java
				},
			})

			-- import nvim-autopairs completion functionality
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			-- import nvim-cmp plugin (completions plugin)
			local cmp = require("cmp")

			-- make autopairs and completion work together
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false, -- Use 'false' for the latest features, or '*' for stable
		config = function()
			require("mini.surround").setup({
				-- Custom mappings (default shown here)
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding
					find = "sf", -- Find surrounding (to the right)
					find_left = "sF", -- Find surrounding (to the left)
					highlight = "sh", -- Highlight surrounding
					replace = "sr", -- Replace surrounding
					update_n_lines = "sn", -- Update `n_lines`
				},
			})
		end,
	},
}

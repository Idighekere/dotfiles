return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")
		local keymap = vim.keymap

		-- Set keymaps
		keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })

		-- Configure setup with custom anchors
		todo_comments.setup({
			keywords = {
				FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },

				-- YOUR CUSTOM ANCHORS
				SECTION = { icon = "󰉬 ", color = "#FF00FF" }, -- Bright Magenta
				REFACTOR = { icon = " ", color = "warning" },
				ANCHOR = { icon = "⚓", color = "info" },
			},
			highlight = {
				multiline = true, -- enable multiline todo comments
				before = "", -- "fg" or "bg" or empty
				keyword = "wide", -- "fg", "bg", "wide" (wide is similar to VS Code)
				after = "fg", -- "fg" or "bg" or empty
				pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlighting (labels like SECTION:)
			},
		})
	end,
}

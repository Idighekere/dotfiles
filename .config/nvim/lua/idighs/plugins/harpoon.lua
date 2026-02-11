return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
			},
		})

		local keymap = vim.keymap

		-- Add/remove current file from harpoon
		keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Harpoon: Add file" })

		keymap.set("n", "<leader>hr", function()
			harpoon:list():remove()
		end, { desc = "Harpoon: Remove file" })

		-- Toggle harpoon menu
		keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon: Toggle menu" })

		-- Navigate to harpooned files (1-5)
		keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon: Go to file 1" })

		keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon: Go to file 2" })

		keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon: Go to file 3" })

		keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon: Go to file 4" })

		keymap.set("n", "<leader>5", function()
			harpoon:list():select(5)
		end, { desc = "Harpoon: Go to file 5" })

		-- Navigate prev/next in harpoon list
		keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Harpoon: Previous file" })

		keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Harpoon: Next file" })
	end,
}

return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- These keybinds will trigger the plugin to load
	keys = {
		-- Add these to your 'keys' table in the obsidian.nvim file
		{ "<leader>oc", "<cmd>ObsidianToggleCheckbox<cr>", desc = "Toggle Checkbox" },
		{ "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Note (Task)" },
		{ "<leader>ot", "<cmd>ObsidianToday<cr>", desc = "Obsidian Today" },
		{ "<leader>os", "<cmd>ObsidianSearch<cr>", desc = "Obsidian Search" },
		{ "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian Quick Switch" },
		{ "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Obsidian Backlinks" },
	},
	opts = {
		workspaces = {
			{
				name = "notes",
				path = "~/Documents/Obsidian/Notes",
			},
			{
				name = "projects",
				path = "~/Documents/Obsidian/Projects",
			},
			{
				name = "resources",
				path = "~/Documents/Obsidian/Resources",
			},
			{
				name = "archives",
				path = "~/Documents/Obsidian/Archive",
			},
		},

		-- Optional: This makes following links work like 'gd' in code
		follow_url_func = function(url)
			vim.fn.jobstart({ "xdg-open", url }) -- Works on Fedora
		end,

		-- This helper configures how you want the daily notes to look
		daily_notes = {
			folder = "Daily Notes", -- Make sure this matches your Obsidian GUI folder name
			date_format = "%Y-%m-%d",
		},

		-- UI settings (makes checkboxes look nice in the terminal)
		ui = {
			enable = true,
			update_debounce = 200,
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "󰭹", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
			},
		},
	},
}

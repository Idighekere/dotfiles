return {
	"jake-stewart/multicursor.nvim",
	event = "VeryLazy",
	config = function()
		local mc = require("multicursor-nvim")
		mc.setup()

		local set = vim.keymap.set

		-- Add or skip cursor above/below the main cursor
		set({ "n", "x" }, "<up>", function() mc.lineAddCursor(-1) end, { desc = "MC: Add cursor above" })
		set({ "n", "x" }, "<down>", function() mc.lineAddCursor(1) end, { desc = "MC: Add cursor below" })
		set({ "n", "x" }, "<leader><up>", function() mc.lineSkipCursor(-1) end, { desc = "MC: Skip cursor above" })
		set({ "n", "x" }, "<leader><down>", function() mc.lineSkipCursor(1) end, { desc = "MC: Skip cursor below" })

		-- Add or skip adding a new cursor by matching word/selection
		-- Using <leader>m prefix (m = multicursor) to avoid conflicts
		set({ "n", "x" }, "<leader>mn", function() mc.matchAddCursor(1) end, { desc = "MC: Add next match" })
		set({ "n", "x" }, "<leader>mN", function() mc.matchAddCursor(-1) end, { desc = "MC: Add prev match" })
		set({ "n", "x" }, "<leader>ms", function() mc.matchSkipCursor(1) end, { desc = "MC: Skip next match" })
		set({ "n", "x" }, "<leader>mS", function() mc.matchSkipCursor(-1) end, { desc = "MC: Skip prev match" })

		-- Add all matches in the file
		set({ "n", "x" }, "<leader>ma", mc.matchAllAddCursors, { desc = "MC: Add all matches" })

		-- Add and remove cursors with control + left click
		set("n", "<c-leftmouse>", mc.handleMouse)
		set("n", "<c-leftdrag>", mc.handleMouseDrag)
		set("n", "<c-leftrelease>", mc.handleMouseRelease)

		-- Disable and enable cursors
		set({ "n", "x" }, "<leader>mt", mc.toggleCursor, { desc = "MC: Toggle cursor" })

		-- Keymap layer only applies when multiple cursors exist
		mc.addKeymapLayer(function(layerSet)
			-- Select a different cursor as the main one
			layerSet({ "n", "x" }, "<left>", mc.prevCursor)
			layerSet({ "n", "x" }, "<right>", mc.nextCursor)

			-- Delete the main cursor
			layerSet({ "n", "x" }, "<leader>mx", mc.deleteCursor)

			-- Enable and clear cursors using escape
			layerSet("n", "<esc>", function()
				if not mc.cursorsEnabled() then
					mc.enableCursors()
				else
					mc.clearCursors()
				end
			end)
		end)

		-- Customize how cursors look
		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { reverse = true })
		hl(0, "MultiCursorVisual", { link = "Visual" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorMatchPreview", { link = "Search" })
		hl(0, "MultiCursorDisabledCursor", { reverse = true })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
	end,
}

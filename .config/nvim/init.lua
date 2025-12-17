require("idighs.core.options")
-- Define the global leader key (must be done before keymaps.lua is loaded)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set(
	{ "n", "v" }, -- Modes: Normal (n) and Visual (v)
	"<leader><leader>", -- The key sequence: Leader followed by Leader
	"<cmd>w<cr>", -- The command: :w (write/save) followed by <Enter>
	{ desc = "Save file (Leader Leader)" }
)

-- Keymap to activate otter for the current buffer
vim.keymap.set("n", "<leader>oa", function()
	-- The list of languages you want otter to look for
	require("otter").activate({ "python", "lua", "bash" })
end, { desc = "Otter Activate" })

require("idighs.core")
require("idighs.core.keymaps")
require("idighs.lazy")

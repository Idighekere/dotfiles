-- Define the global leader key (must be done before lazy.nvim loads)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set(
	{ "n", "v" }, -- Modes: Normal (n) and Visual (v)
	"<leader><leader>", -- The key sequence: Leader followed by Leader
	"<cmd>w<cr>", -- The command: :w (write/save) followed by <Enter>
	{ desc = "Save file (Leader Leader)" }
)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })
-- Keymap to activate otter for the current buffer
vim.keymap.set("n", "<leader>oa", function()
	-- The list of languages you want otter to look for
	require("otter").activate({ "python", "lua", "bash" })
end, { desc = "Otter Activate" })

vim.opt.termguicolors = true -- Enable true color support

require("idighs.core")
require("idighs.lazy")
require("idighs.lsp")

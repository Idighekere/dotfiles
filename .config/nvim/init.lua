-- Define the global leader key (must be done before lazy.nvim loads)
vim.g.maplocalleader = " "
vim.g.mapleader = " "

vim.keymap.set(
	{ "n", "v" }, -- Modes: Normal (n) and Visual (v)
	"<leader><leader>", -- The key sequence: Leader followed by Leader
	"<cmd>w<cr>", -- The command: :w (write/save) followed by <Enter>
	{ desc = "Save file (Leader Leader)" }
)


vim.opt.termguicolors = true -- Enable true color support

require("idighs.core")
require("idighs.lazy")

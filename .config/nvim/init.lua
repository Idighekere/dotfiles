
require("idighs.core.options")
-- Define the global leader key (must be done before keymaps.lua is loaded)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("idighs.core")
require("idighs.core.keymaps")
require("idighs.lazy")

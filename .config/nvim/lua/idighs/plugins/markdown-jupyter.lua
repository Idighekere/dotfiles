-- Single-file lazy.nvim spec for jannis-baum/jupyviv.nvim + jannis-baum/vivify.vim
-- Place this file under ~/.config/nvim/lua/plugins/ and require it from your lazy setup:
--   local specs = require("plugins.vivify_and_jupyviv")
--   require("lazy").setup(specs)

local server_url = "http://localhost:31622/" -- change if your Vivify server is elsewhere

return {
	-- vivify.vim: editor-side plugin that talks to a Vivify server
	{
		"jannis-baum/vivify.vim",
		lazy = true,
		ft = { "markdown", "ipynb", "vimwiki" }, -- load where you typically render
		cmd = { "VivifyOpen", "VivifyRender", "VivifyToggle" }, -- example commands (works if plugin defines them)
		config = function()
			-- try both a Lua setup and a legacy vim global to be compatible with either plugin API
			-- set conservative defaults
			vim.g.vivify_server_url = server_url
			vim.g.vivify_allow_local_files = false
			vim.g.vivify_max_render_bytes = 2 * 1024 * 1024 -- 2MB

			-- if plugin exposes a Lua setup, call it; pcall prevents hard errors
			local ok, viv = pcall(require, "vivify")
			if ok and type(viv.setup) == "function" then
				viv.setup({
					server = server_url,
					allow_local_files = false,
					max_render_bytes = 2 * 1024 * 1024,
				})
			end

			-- handy keymaps to open/refresh preview (adjust to taste)
			vim.api.nvim_set_keymap("n", "<leader>vp", "<cmd>VivifyOpen<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<leader>vr", "<cmd>VivifyRender<CR>", { noremap = true, silent = true })
		end,
	},

	-- jupyviv.nvim: notebook integration (requires a running Jupyviv agent + Vivify server)
	{
		"jannis-baum/jupyviv.nvim",
		lazy = true,
		ft = { "ipynb", "python", "markdown" },
		cmd = {
			"JupyvivStart",
			"JupyvivNew",
			"JupyvivRunHere",
			"JupyvivRunSelection",
			"JupyvivRunAll",
			"JupyvivInterruptKernel",
			"JupyvivRestartKernel",
			"JupyvivKill",
			"JupyvivClearExecution",
			"JupyvivEnumerateExecution",
		},
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- minimal, safe setup. The plugin's README shows `require('jupyviv').setup()`
			local ok, jupy = pcall(require, "jupyviv")
			if not ok then
				-- plugin not loaded yet; leave globals so the plugin can read them on load
				vim.g.jupyviv_server_url = server_url
				return
			end

			-- call setup with safe defaults
			if type(jupy.setup) == "function" then
				jupy.setup({
					server_url = server_url,
					timeout_ms = 20000,
					max_render_bytes = 2 * 1024 * 1024,
					-- do not auto-accept remote kernels by default
					auto_start_agent = true,
				})
			end

			-- useful keymaps to run cells; these call the plugin's commands
			vim.api.nvim_set_keymap("n", "<leader>js", "<cmd>JupyvivRunHere<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap(
				"v",
				"<leader>jj",
				"<cmd>JupyvivRunSelection<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap("n", "<leader>ja", "<cmd>JupyvivRunAll<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>jk",
				"<cmd>JupyvivInterruptKernel<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}

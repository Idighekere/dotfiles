return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		---------------------------------------------------------
		-- Mason
		---------------------------------------------------------
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls",
				"eslint",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
			},
		})

		---------------------------------------------------------
		-- CMP capabilities
		---------------------------------------------------------
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		---------------------------------------------------------
		-- NEW API (required):
		-- vim.lsp.config(server_name, { settings })
		-- vim.lsp.enable(server_name)
		---------------------------------------------------------

		-----------------------------
		-- TypeScript / JavaScript --
		-----------------------------
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
			},
			init_options = {
				preferences = {
					-- importModuleSpecifierPreference = "relative",
				},
			},
			root_markers = { "package.json", "tsconfig.json", ".git" },
		})
		vim.lsp.enable("ts_ls")

		-----------
		-- ESLint --
		-----------
		vim.lsp.config("eslint", {
			capabilities = capabilities,
			root_markers = {
				".eslintrc",
				".eslintrc.js",
				".eslintrc.json",
				"package.json",
			},
		})
		vim.lsp.enable("eslint")

		------------------------
		-- Other simple servers
		------------------------
		local basic_servers = {
			"html",
			"cssls",
			"tailwindcss",
			"lua_ls",
			"graphql",
			"emmet_ls",
			"prismals",
			"pyright",
			"svelte",
		}

		for _, server in ipairs(basic_servers) do
			vim.lsp.config(server, {
				capabilities = capabilities,
			})
			vim.lsp.enable(server)
		end

		---------------------------------------------------------
		-- File operations plugin
		---------------------------------------------------------
		require("lsp-file-operations").setup()
	end,
}

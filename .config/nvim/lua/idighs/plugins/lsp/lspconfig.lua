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
		-- LSP Keymaps (on attach)
		---------------------------------------------------------
		local keymap = vim.keymap

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				keymap.set(
					"n",
					"gd",
					"<cmd>Telescope lsp_definitions<CR>",
					{ buffer = ev.buf, desc = "Go to definition" }
				)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", function()
					vim.diagnostic.goto_prev({ float = true })
				end, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", function()
					vim.diagnostic.goto_next({ float = true })
				end, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		---------------------------------------------------------
		-- Diagnostics signs
		---------------------------------------------------------
		local severity = vim.diagnostic.severity
		vim.diagnostic.config({
			signs = {
				text = {
					[severity.ERROR] = " ",
					[severity.WARN] = " ",
					[severity.HINT] = "󰠠 ",
					[severity.INFO] = " ",
				},
			},
		})

		---------------------------------------------------------
		-- Mason
		---------------------------------------------------------
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"ts_ls", -- vtsls uses ts_ls
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
		-- TypeScript / JavaScript via vtsls
		---------------------------------------------------------
		-- Disable the old tsserver to avoid conflicts
		vim.lsp.config("tsserver", {
			on_attach = function() end,
		})

		-- Use vtsls instead
		vim.lsp.config("vtsls", {
			capabilities = capabilities,
			filetypes = {
				"javascript",
				"javascript.jsx",
				"javascriptreact",
				"typescript",
				"typescript.tsx",
				"typescriptreact",
			},
			settings = {
				typescript = {
					updateImportsOnFileMove = { enabled = "always" },
					inlayHints = { parameterNames = { enabled = "all" } },
				},
				javascript = {}, -- copy TS settings if needed
			},
			root_markers = { "package.json", "tsconfig.json", ".git" },
		})
		vim.lsp.enable("vtsls")

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

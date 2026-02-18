return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd", "prettier", "biome" },
				typescript = { "prettierd", "prettier", "biome" },
				javascriptreact = { "prettierd", "prettier", "biome" },
				typescriptreact = { "prettierd", "prettier", "biome" },
				svelte = { "prettierd", "prettier", "biome" },
				css = { "prettierd", "prettier", "biome" },
				html = { "prettierd", "prettier", "biome" },
				json = { "prettierd", "prettier", "biome" },
				yaml = { "prettierd", "prettier", "biome" },
				markdown = { "prettierd", "prettier", "biome" },
				graphql = { "prettierd", "prettier", "biome" },
				liquid = { "prettierd", "prettier", "biome" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			},
			-- format_after_save = {
			-- 	lsp_fallback = true,
			-- 	timeout_ms = 1000,
			-- },
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

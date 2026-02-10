local keymap = vim.keymap

-- LSP Attach Autocmd
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		-- Replace the standard gd with Telescope's version
		keymap.set("n", "<leader>gs", "<cmd>Telescope lsp_definitions<cr>", { desc = "Show Definition" })

		-- Go to TS source definition using vtsls
		opts.desc = "Go to TS source definition"
		keymap.set("n", "gd", function()
			local success, _ = pcall(function()
				require("lazyvim.util").lsp_execute({
					command = "typescript.goToSourceDefinition",
					arguments = { vim.uri_from_bufnr(0), vim.api.nvim_win_get_cursor(0) },
					open = true,
				})
			end)
			if not success then
				vim.lsp.buf.definition() -- fallback if vtsls not available
			end
		end, opts)

		-- Keep gD for normal declaration
		opts.desc = "Go to declaration"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		-- Telescope references / implementations / type definitions
		opts.desc = "Show LSP references"
		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

		opts.desc = "Show LSP implementations"
		keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

		-- Code actions
		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		-- Smart rename
		opts.desc = "Smart rename"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		-- Diagnostics
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

		-- Documentation
		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", vim.lsp.buf.hover, opts)

		-- Restart LSP
		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
	end,
})

-- Diagnostics signs
local severity = vim.diagnostic.severity
vim.diagnostic.config({
	signs = {
		text = {
			[severity.ERROR] = " ",
			[severity.WARN] = " ",
			[severity.HINT] = "󰠠 ",
			[severity.INFO] = " ",
		},
	},
})

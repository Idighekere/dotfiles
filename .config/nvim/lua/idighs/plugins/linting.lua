return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		local function file_in_cwd(file_name)
			return vim.fs.find(file_name, {
				upward = true,
				stop = vim.loop.cwd():match("(.+)/"),
				path = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
				type = "file",
			})[1]
		end

		local function remove_linter(linters, linter_name)
			for k, v in pairs(linters) do
				if v == linter_name then
					linters[k] = nil
					break
				end
			end
		end

		local function linter_in_linters(linters, linter_name)
			for k, v in pairs(linters) do
				if v == linter_name then
					return true
				end
			end
			return false
		end

		local function remove_linter_if_missing_config_file(linters, linter_name, config_file_name)
			if linter_in_linters(linters, linter_name) and not file_in_cwd(config_file_name) then
				remove_linter(linters, linter_name)
			end
		end

		local function try_linting()
			local linters = lint.linters_by_ft[vim.bo.filetype]

			-- if linters then
			--   -- remove_linter_if_missing_config_file(linters, "eslint_d", ".eslintrc.cjs")
			--   remove_linter_if_missing_config_file(linters, "eslint_d", "eslint.config.js")
			-- end

			lint.try_lint(linters)
		end

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				try_linting()
			end,
		})

		vim.keymap.set("n", "<leader>ll", function()
			try_linting()
		end, { desc = "Trigger linting for current file" })

		vim.diagnostic.config({
			virtual_text = {
				-- Set to true to display the error/warning message inline next to the code
				enabled = true,
				-- Optional: configure how the text is rendered
				severity = { min = "HINT", max = "ERROR" },
				source = true, -- Show the source (e.g., "eslint_d")
			},
			-- Show signs in the sign column (which you already see)
			signs = true,
			-- Set how the text is displayed under the problematic code
			underline = true,
			-- Enable the diagnostic pop-up when hovering over an error
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		-- Keymap to show the diagnostic message under the cursor in a floating window
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic error" })
	end,
}

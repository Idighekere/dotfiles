return {
	"okuuva/auto-save.nvim",
	event = { "InsertLeave", "TextChanged" },
	opts = {
		enabled = true,
		trigger_events = {
			immediate_save = { "BufLeave", "FocusLost" },
			defer_save = { "InsertLeave", "TextChanged" },
		},
		condition = function(buf)
			-- Don't auto-save if buffer is not modifiable or is a special buffer
			if not vim.bo[buf].modifiable then
				return false
			end
			-- Don't auto-save special buffer types
			local buftype = vim.bo[buf].buftype
			if buftype ~= "" then
				return false
			end
			-- Don't auto-save if file is too large (> 1MB)
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > 1024 * 1024 then
				return false
			end
			return true
		end,
		write_all_buffers = false,
		debounce_delay = 1000, -- Wait 1 second after last change before saving
		noautocmd = false,
		lockmarks = false,
		debug = false,
	},
}

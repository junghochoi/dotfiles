return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	opts = {

		left = {
			{
				ft = "Trouble",
				title = "Diagnostics",
				size = { width = 40 },
				filter = function(buf)
					return vim.bo[buf].filetype == "Trouble" and vim.api.nvim_buf_get_name(buf):match(".*diagnostics.*")
				end,
			},
			{
				ft = "Trouble",
				title = "Document Symbols",
				size = { width = 40 },
				filter = function(buf)
					return vim.bo[buf].filetype == "Trouble"
						and vim.api.nvim_buf_get_name(buf):match(".*document_symbols.*")
				end,
			},
		},
	},
}

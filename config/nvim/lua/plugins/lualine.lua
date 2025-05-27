return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "ayu_dark",
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "filename" },
			lualine_c = {},
			lualine_x = { "branch", "diff", "diagnostics" },
			lualine_y = { "lsp_status" },
			lualine_z = {},
		},

		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
}

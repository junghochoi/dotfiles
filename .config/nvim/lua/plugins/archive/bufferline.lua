return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons"  },
	lazy = false,
  enabled = false,
	-- priority = 500,
	opts = {
		options = {
			show_close_icon = false,
			show_buffer_close_icons = false, -- ADD THIS TOO
			separator_style = "slant",
			offsets = {
				{
					filetype = "neo-tree",
          text = "FileTree",
					-- text = function()
					-- 	return vim.fn.getcwd()
					-- end,
					highlight = "Directory",
					text_align = "left",
				},
			},
		},
	},
}

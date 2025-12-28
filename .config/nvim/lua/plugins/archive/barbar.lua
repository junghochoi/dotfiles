return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
  enabled = false,
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		animation = false,
		-- insert_at_start = true,
		-- …etc.
		separator = { left = "", right = "" },
		sidebar_filetypes = {
			-- Offset when neo-tree is open
			["neo-tree"] = {
				text = "Directory",
				event = "BufWinLeave",
				align = "left",
			},
		},
	},

	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}

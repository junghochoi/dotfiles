return {
	"folke/edgy.nvim",
	opts = {
    animate ={
      enabled = false
    },
		left = {
			-- Neo-tree at the top
			{
				ft = "neo-tree",
				title = "Neo-Tree",
				size = { height = 0.6 }, -- 60%
			},
			-- Any Trouble window at the bottom
			{
				ft = "trouble",
				title = "Trouble",
				size = { height = 0.4 }, -- 40%
			},
		},
	},
}


return {
	"folke/edgy.nvim",
	opts = {
		keys = {
			-- This section maps your preferred keys to edgy's resize functions.
			-- When an edgebar window is active, these functions are called.
			-- You can use these same mappings for regular windows too!
			-- They override the defaults like <C-w>+.

			-- Increase height (Equivalent to edgy's <C-w>+)
			["<C-Up>"] = function(win)
				win:resize("height", 2)
			end,
			-- Decrease height (Equivalent to edgy's <C-w>-)
			["<C-Down>"] = function(win)
				win:resize("height", -2)
			end,
			-- Increase width (Equivalent to edgy's <C-w>>)
			["<C-Right>"] = function(win)
				win:resize("width", 2)
			end,
			-- Decrease width (Equivalent to edgy's <C-w><)
			["<C-Left>"] = function(win)
				win:resize("width", -2)
			end,
		},
		animate = {
			enabled = false,
		},
		left = {
			-- Neo-tree at the top
			{
				ft = "neo-tree",
				title = "Neo-Tree",
				size = { height = 0.5, width = 0.15 }, -- 60%
			},
			-- Any Trouble window at the bottom
			{
				ft = "trouble",
				-- pinned = true,
				title = "Trouble",
				filter = function(_buf, win)
					return vim.w[win].trouble.mode == "lsp_document_symbols"
				end,
				-- open = "Trouble symbols position=left focus=false filter.buf=0",
				size = { height = 0.6 },
			},
		},
		bottom = {
			{
				ft = "trouble",
				title = "Trouble",

				filter = function(_buf, win)
					return vim.w[win].trouble.mode == "lsp_references"
				end,

				size = { height = 15 }, -- 40%
			},
		},
	},
}

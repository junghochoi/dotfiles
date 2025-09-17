-- return {
--   "folke/edgy.nvim",
--   event = "VeryLazy",
--   -- You must set this option for edgy to manage all windows
--   init = function()
--     vim.opt.laststatus = 3 -- global statusline, required for full screen control
--   end,
--   opts = {
--     -- 1. Configure the Left Edgebar
--     left = {
--       -- Neo-Tree: The File Explorer (positioned at the top of the left bar)
--       {
--         ft = "neo-tree",
--         title = "Neo-Tree",
--         -- size is specified as a fraction of the left edgebar's height
--         size = { height = 0.5 },
--         -- 'open' is the command to run if the window isn't open
--         open = "Neotree toggle",
--         pinned = true,
--       },
--       -- Trouble (Document Symbols): Symbol outline (positioned at the bottom of the left bar)
--       {
--         ft = "Trouble",
--         title = "Document Symbols",
--         -- size is specified as a fraction of the left edgebar's height
--         size = { height = 0.5 },
--         -- Filter to ensure this slot only manages the 'document_symbols' view
--         filter = function(buf)
--           return vim.b[buf].trouble == "lsp_document_symbols"
--         end,
--         -- The command to open the 'document_symbols' list
--         open = function()
--           require("trouble").toggle("lsp_document_symbols", { auto_preview = false, auto_close = true })
--         end,
--         pinned = false, -- Only open when explicitly called
--       },
--     },
--
--     -- 2. Configure the Bottom Edgebar
--     -- By default, Edgy only spans the full window width. To have the bottom bar
--     -- **not** go under the left sidebar, you need to configure the `bottom` bar
--     -- to have an `options` property that sets its `win_config` to be placed
--     -- relative to the main editor area. Edgy handles this segmentation automatically
--     -- when both a side and bottom bar are configured.
--     -- bottom = {
--     --   -- Trouble (LSP References): Jump/Reference list (positioned on the bottom bar)
--     --   {
--     --     ft = "Trouble",
--     --     title = "LSP References",
--     --     size = { height = 15 }, -- Size is specified as a fixed height (10 lines)
--     --     -- Filter to ensure this slot only manages the 'lsp_references' view
--     --     filter = function(buf)
--     --       return vim.b[buf].trouble == "lsp_references"
--     --     end,
--     --     -- The command to open the 'lsp_references' list
--     --     open = function()
--     --       require("trouble").toggle("lsp_references", { auto_preview = false, auto_close = true })
--     --     end,
--     --     pinned = false, -- Only open when explicitly called
--     --   },
--     -- },
--
--     -- Overall Options (e.g., set default width for the side bar)
--     options = {
--       left = {
--         size = 30, -- 30 columns wide for the left edgebar
--       },
--       bottom = {
--         size = 10, -- Default height for the bottom edgebar if no view specifies size
--       }
--     }
--   },
-- }

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

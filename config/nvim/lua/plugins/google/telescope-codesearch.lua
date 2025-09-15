-- return {
-- 	-- This is the correct, standard way to specify a GitHub plugin.
-- 	-- lazy.nvim automatically infers the URL (https://github.com/vintharas/...)
-- 	"vintharas/telescope-codesearch.nvim",
--
-- 	-- The 'url' and 'sso://' line should be completely removed.
-- 	-- url = "sso://user/vintharas/telescope-codesearch.nvim",
--   opts = {
--
--
-- 	keys = {
-- 		{
-- 			"<leader>fc",
-- 			"<cmd>Telescope codesearch find_files<cr>",
-- 			desc = "Find codesearch files",
-- 		},
-- 		{
-- 			"<leader>fcc",
-- 			"<cmd>Telescope codesearch find_query<cr>",
-- 			desc = "Find codesearch query",
-- 		},
-- 	},
-- 	config = function()
-- 		require("telescope").load_extension("codesearch")
-- 	end,
-- }

return {
	{
		-- "vintharas/telescope-codesearch.nvim",
		url = "sso://user/vintharas/telescope-codesearch.nvim",
		-- lazy.nvim relies on a declarative api (LazySpec) to configure your
		-- plugins. See https://github.com/folke/lazy.nvim#-plugin-spec for
		-- more information about the available options.
		keys = {
			{
				"<leader>fc",
				"<cmd>Telescope codesearch find_files<cr>",
				desc = "Find codesearch files",
			},
			{
				"<leader>fcc",
				"<cmd>Telescope codesearch find_query<cr>",
				desc = "Find codesearch query",
			},
		},
		config = function()
			-- This asks telescope to load the codesearch extension and makes
			-- the 'codesearch' picker available through the `Telescope` command.
			require("telescope").load_extension("codesearch")
		end,
	},
}

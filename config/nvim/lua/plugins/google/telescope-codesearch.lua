return {
	{
		-- "vintharas/telescope-codesearch.nvim",
		url = "sso://user/vintharas/telescope-codesearch.nvim",
		-- lazy.nvim relies on a declarative api (LazySpec) to configure your
		-- plugins. See https://github.com/folke/lazy.nvim#-plugin-spec for
		-- more information about the available options.
		keys = {
			{
				"<leader>cs",
				"<cmd>Telescope codesearch find_files<cr>",
				desc = "Find codesearch files",
			},
			{
				"<leader>cg",
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

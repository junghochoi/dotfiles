return {
	{
		-- "vintharas/telescope-codesearch.nvim",
		url = "sso://user/vintharas/telescope-codesearch.nvim",
    enabled=false,
		-- lazy.nvim relies on a declarative api (LazySpec) to configure your
		-- plugins. See https://github.com/folke/lazy.nvim#-plugin-spec for
		-- more information about the available options.
		config = function()
			-- This asks telescope to load the codesearch extension and makes
			-- the 'codesearch' picker available through the `Telescope` command.
			require("telescope").load_extension("codesearch")
		end,
	},
}

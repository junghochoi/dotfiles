return {
	"nvim-treesitter/nvim-treesitter",
  enabled=true,

	-- The 'build' command is crucial. It tells lazy.nvim to run the
	-- ':TSUpdate' command automatically after a fresh installation or update,
	-- which is what compiles the necessary language parsers.
	build = ":TSUpdate",

	-- Run the configuration function when Neovim starts.
	config = function()
		local configs = require("nvim-treesitter.config")

		configs.setup({
			-- Specify which parsers to automatically install (language names).
			-- This is what you were working on with 'vim' and 'vimdoc'.
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"go", -- Added since you are interested in Go
				"json",
				"html",
				"css",
			},

			-- Install parsers synchronously (recommended).
			sync_install = false,

			-- Enable the Tree-sitter modules you want:
			highlight = {
				enable = true, -- Enables syntax highlighting
			},
			indent = {
				enable = true, -- Enables smart indentation
			},

			-- autotag = {
			-- 	enable = true,
			-- },
			-- Optional: Enable the 'textobjects' module, which is another plugin.
			-- You would usually configure this in a separate plugin entry,
			-- but this shows how to integrate it if you had the dependency.
			-- textobjects = { enable = true },
		})
	end,
}

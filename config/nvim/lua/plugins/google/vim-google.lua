-- lua/plugins/vim-google.lua

-- Define the helper function for your local Google plugins
local function goog(plugin, config)
	-- The 'dir' key tells lazy.nvim to load the plugin from this local path.
	-- Note: We omit the 'dependencies' key in the helper, as it seems only 'maktaba' needs it explicitly
	-- or we would need to check if all these plugins need 'maktaba'.
	-- Based on your original, we'll assume the explicit maktaba dependency on the first item handles the dependency chain.
	return {
		-- 1. Use 'name' to identify the plugin (useful for commands, status, etc.)
		name = "google-vim-" .. plugin,

		-- 2. Crucially, set the local directory path
		dir = "/usr/share/vim/google/" .. plugin,

		-- 3. Set 'lazy = false' to ensure they load on startup, similar to how they would in a traditional vim environment.
		lazy = false,

		-- 4. Apply the configuration function if provided
		config = config,
	}
end

return {
	------------------------------------------------
	-- Core Dependencies and Bootstrapping (maktaba)
	------------------------------------------------
	{
		-- 1. Core Maktaba setup
		name = "google-vim-maktaba",
		dir = "/usr/share/vim/google/maktaba",
		lazy = false, -- Must load early

		-- 2. The 'init' function runs *before* the plugin is loaded (i.e., before runtimepath is processed)
		-- This is the best place for your source command.
		init = function()
			-- Use pcall for safer execution, just in case the file doesn't exist.
			pcall(vim.cmd, "source /usr/share/vim/google/glug/bootstrap.vim")
		end,
	},

	------------------------------------------------
	-- Core Google Plugins
	------------------------------------------------
	-- goog("core"),
	-- goog("glaive"),

	------------------------------------------------
	-- Filetype & Syntax Plugins
	------------------------------------------------
	goog("google-filetypes"),
	-- goog("ft-cpp"),
	-- goog("ft-go"),
	-- goog("ft-java"),
	-- goog("ft-kotlin"),
	-- goog("ft-proto"),
	-- goog("ft-python"),

	------------------------------------------------
	-- Other Tools/Utilities
	------------------------------------------------
	-- goog("ultisnips-google"),
	-- goog("autogen"),
	-- goog("blaze"),
	-- goog("codefmt"),
	-- goog("codefmt-google"),
	-- goog("googlestyle"),

}

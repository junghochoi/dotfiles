return {
	"nvim-telescope/telescope.nvim",
  enabled=false,
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			-- layout_strategy = "vertical",
			path_display = function(opts, path)
				-- Do common substitutions
				path = path:gsub("^/google/src/cloud/[^/]+/[^/]+/google3/", "g3/", 1)
				path = path:gsub("^google3/java/com/google/", "g3/j/c/g/", 1)
				path = path:gsub("^google3/javatests/com/google/", "g3/jt/c/g/", 1)
				path = path:gsub("^google3/third_party/", "g3/3rdp/", 1)
				path = path:gsub("^google3/", "g3/", 1)
				path = path:gsub("contentads/", "ca/", 1)

				-- Do truncation. This allows us to combine our custom display formatter
				-- with the built-in truncation.
				-- `truncate` handler in transform_path memoizes computed truncation length in opts.__length.
				-- Here we are manually propagating this value between new_opts and opts.
				-- We can make this cleaner and more complicated using metatables :)
				local new_opts = {
					path_display = {
						truncate = true,
					},
					__length = opts.__length,
				}
				path = require("telescope.utils").transform_path(new_opts, path)
				opts.__length = new_opts.__length
				return path
			end,
		},
	},
}

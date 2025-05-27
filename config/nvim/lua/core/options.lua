local o = vim.o
local d = vim.diagnostic
local cmd = vim.cmd
local fn = vim.fn

o.shiftwidth = 2
o.expandtab = true
o.tabstop = 2

o.relativenumber = true
o.number = true

d.config({
	underline = true,
	virtual_text = {
		prefix = "",
		severity = nil,
		source = "if_many",
		format = nil,
	},

	signs = {
		-- Define icons for each severity level
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "",
		},
		-- Optional: define highlight groups
		linehl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
	severity_sort = true,
	update_in_insert = false,
})


-- Color Scheme
cmd("colorscheme catppuccin-mocha")

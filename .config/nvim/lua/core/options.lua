local o = vim.o
local d = vim.diagnostic
local cmd = vim.cmd
local fn = vim.fn
local opt = vim.opt

-- vim.cmd('source /usr/share/vim/google/google.vim')
opt.termguicolors = true -- required for bufferline.nvim to work

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


-- Python specific settings
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		opt.shiftwidth = 2
		opt.tabstop = 2
		opt.softtabstop = 2
		opt.expandtab = true
	end,
})


-- Color Scheme
cmd("colorscheme catppuccin-frappe")

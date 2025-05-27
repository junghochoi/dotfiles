return {
	"mfussenegger/nvim-lint",
  -- enabled = false,
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	linters_by_ft = {
		-- markdown = { "vale" },
		-- terraform = { "tflint" },
		-- yaml = { "yamllint" },
		-- helm = { "yamllint" }, -- could use custom helm linters if available
		-- k8s = { "kubeval" },
		-- python = { "flake8", "mypy", "pylint" },
		-- java = { "checkstyle" }, -- optionally 'pmd', 'spotbugs'
		-- javascript = { "eslint" },
		-- typescript = { "eslint" },
		-- cpp = { "cpplint" },
		-- json = { "jsonlint" },
		-- sh = { "shellcheck" },
		-- dockerfile = { "hadolint" },
		-- html = { "tidy" },
		-- css = { "stylelint" },
    bash = { "bash" },
    tflint = { "tflint" }
	},
}

local lspconfig = require("lspconfig")
local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, noremap = true, silent = true }
	local map = vim.keymap.set

	map("n", "<leader>k", vim.lsp.buf.hover, opts)
	map("n", "gd", vim.lsp.buf.definition, opts)
	map("n", "gD", vim.lsp.buf.declaration, opts)
	map("n", "gi", vim.lsp.buf.implementation, opts)
	map("n", "go", vim.lsp.buf.type_definition, opts)
	map("n", "<leader>r", vim.lsp.buf.references, opts)
	map("n", "gs", vim.lsp.buf.signature_help, opts)
	map("n", "<leader>R", vim.lsp.buf.rename, opts)
	map("n", "<leader>co", vim.lsp.buf.code_action, opts)
	map("n", "<leader>D", vim.lsp.buf.type_definition, opts)
end

local on_init = function(client, _)
	-- Disable semantic tokens if supported
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local servers = {
	"html",
	"lua_ls",
	"cssls",
	"ts_ls",
	"jsonls",
	"pylsp",
	"gopls",
	"tailwindcss",
	"helm_ls",
	"yamlls",
	"terraformls",
  "bashls"
}

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

-- configuring single server: lua_ls
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime
			},
		},
	},
})

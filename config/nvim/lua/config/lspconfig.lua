local on_init = function(client, _)
	-- Disable semantic tokens if supported
	if client.supports_method("textDocument/semanticTokens") then
		client.server_capabilities.semanticTokensProvider = nil
	end
end

local capabilities = require("blink.cmp").get_lsp_capabilities()

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
	"bashls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
	vim.lsp.config(lsp, {
		on_init = on_init,
		capabilities = capabilities,
	})
end

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
		},
	},
})

vim.lsp.enable(servers)


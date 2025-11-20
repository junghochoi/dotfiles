-- local on_attach = function(_, bufnr)
-- 	local opts = { buffer = bufnr, noremap = true, silent = true }
-- 	local map = vim.keymap.set
--
-- 	map("n", "<leader>k", vim.lsp.buf.hover, opts)
-- 	map("n", "gd", vim.lsp.buf.definition, opts)
-- 	map("n", "gD", vim.lsp.buf.declaration, opts)
-- 	map("n", "gi", vim.lsp.buf.implementation, opts)
-- 	map("n", "go", vim.lsp.buf.type_definition, opts)
-- 	map("n", "<leader>r", vim.lsp.buf.references, opts)
-- 	map("n", "gs", vim.lsp.buf.signature_help, opts)
-- 	map("n", "<leader>R", vim.lsp.buf.rename, opts)
-- 	map("n", "<leader>co", vim.lsp.buf.code_action, opts)
-- 	map("n", "<leader>D", vim.lsp.buf.type_definition, opts)
-- end

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
  -- "cssls",
  -- "ts_ls",
  -- "jsonls",
  -- "pylsp",
  -- "gopls",
  -- "tailwindcss",
  -- "helm_ls",
  -- "yamlls",
  -- "terraformls",
  -- "bashls",
  -- "clangd"
}


-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_init = on_init,
    capabilities = capabilities
  })
end

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          'require'
        }
      }
    }
  }
})

vim.lsp.enable(servers)

vim.lsp.config("ciderlsp", {
  cmd = { "/google/bin/releases/cider/ciderlsp/ciderlsp", "--tooltag=nvim-lsp", "--noforward_sync_responses" },
  filetypes = { "c", "cpp", "java", "kotlin", "objc", "proto", "textpb", "go", "python", "bzl", "typescript" },
  offset_encoding = "utf-8",
  -- root_dir = function(bufnr)
  --   return vim.fs.root(bufnr, { ".citc" })
  -- end,
  settings = {},
})
vim.lsp.enable({ "ciderlsp" })




-- DEPRECATED reqiure("lspconfig.config") configuration
-- require("lspconfig.configs").ciderlsp = {
--   default_config = {
--     cmd = { "/google/bin/releases/cider/ciderlsp/ciderlsp", "--tooltag=nvim-lsp", "--noforward_sync_responses" },
--     filetypes = { "c", "cpp", "java", "kotlin", "objc", "proto", "textpb", "go", "python", "bzl", "typescript" },
--     offset_encoding = "utf-8",
--     root_dir = lspconfig.util.root_pattern(".citc"),
--     settings = {},
--   },
-- }
-- lspconfig.ciderlsp.setup {}

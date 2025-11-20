vim.g.mapleader = " "

local map = vim.keymap.set
local fzf_lua = require('fzf-lua')
local custom_funcs = require('core.custom_functions')

map({ "n", "v" }, ";", ":", { desc = "CMD enter command mode" })
map({ "n", "v" }, "K", "5k")
map({ "n", "v" }, "J", "5j")
map({ "n", "v" }, "L", "5l")
map({ "n", "v" }, "H", "5h")

map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
map("n", "<leader>bp", custom_funcs.copy_google3_path, { desc = "Copy google3 path to clipboard" })


--neo-tree

map("n", "<C-m>", ":Neotree filesystem toggle<CR>")
map("n", "<C-n>", ":Neotree filesystem reveal<CR>")

-- fzf-lua
map("n", "<leader>ff", fzf_lua.files, { desc = "fzf_lua files" })
map("n", "<leader>fb", fzf_lua.buffers, { desc = "fzf_lua buffers" })


-- tmux navigator
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- conform.nvim
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "Format current file with conform" })

-- linting
map("n", "<leader>ll", function()
  print("Linting current file")
  require("lint").try_lint()
end, { desc = "Trigger linting for the current file" })

-- Harpoon!
local harpoonUi = require("harpoon.ui")
local harpoonMark = require("harpoon.mark")
map("n", "<leader>e", function()
  harpoonUi.toggle_quick_menu()
end, { desc = "Open Harpoon Quickselect menu" })
map("n", "<C-a>", function()
  harpoonMark.add_file()
end, { desc = "Open Harpoon Quickselect menu" })

-- Trouble and LSP nvim
map("n", "<leader>tt", "<cmd>Trouble diagnostics toggle focus=true<cr>", { desc = "Trouble Diagnostics" })
map(
  "n",
  "<leader>ts",
  "<cmd>Trouble lsp_document_symbols toggle focus=true win.position=left<cr>",
  { desc = "Trouble Document Symobls" }
)
map("n", "<leader>td", "<cmd>Trouble lsp_definitions toggle focus=true  <cr>", { desc = "Trouble LSP definitions" })
map("n", "<leader>tr", "<cmd>Trouble lsp_references toggle focus=true <cr>", { desc = "Trouble LSP References" })
map("n", "<leader>th", function() vim.lsp.buf.hover({ border = "rounded" }) end, { desc = "lsp hover" })


-- cider-agent nvim
local agent = require("cider-agent")
agent.setup({ server_name = "ciderlsp" })
map({ "n", "v" }, "<leader>cc", function()
  vim.ui.input({ prompt = "Cider Chat: " .. agent.refs() .. "\n" }, agent.chat)
end, { desc = "[C]ider [C]chat" })
map({ "n", "v" }, "<leader>ce", function()
  vim.ui.input({ prompt = "Cider Edit: " .. agent.refs() .. "\n" }, agent.simple_coding)
end, { desc = "[C]ider [E]edit" })
map({ "n", "v" }, "<leader>cE", function()
  vim.ui.input({ prompt = "Cider Complex Tasks: " .. agent.refs() .. "\n" }, agent.complex_task)
end, { desc = "[C]ider Compl[E]x" })
--
--


-- Google Snacks
local gs = require('google-snacks')

-- CITC (Google-specific Version Control/Workspace) Commands
map("n", "<leader>hw", function() gs.citc.workspaces() end, { desc = "Fig Workspaces" })
-- map("n", "<leader>cw", function() gs.citc.create() end, { desc = "Create Workspace" })

-- FIG (Google-specific Version Control) Commands
map("n", "<leader>hx", function() gs.fig.xl() end, { desc = "Fig XL" })
-- map("n", "<leader>hm", function() gs.fig.pstatus() end, { desc = "Hg Parent Diff" })
map("n", "<leader>hs", function() gs.fig.status() end, { desc = "Fig Diff" })
-- map("n", "<leader>hr", function() gs.fig.revstatus() end, { desc = "Fig Rev Status" })
-- map("n", "<leader>fg", function() gs.fig.grep() end, { desc = "Fig Grep" })
-- map("n", "<leader>co", function() gs.fig.commit() end, { desc = "Commit" })
--
-- Navigation and Utilities
-- map("n", "<leader>rl", function() gs.nav.related_files() end, { desc = "Related Files" })

-- Code Search Commands
-- map("n", "<leader>cq", function() gs.codesearch.query() end, { desc = "codesearch query" })
-- map("n", "<leader>cf", function() gs.codesearch.query({ files = true, title = "codesearch - files" }) end, { desc = "codesearch files" })
-- map("n", "<leader>cqw", function() gs.codesearch.word() end, { desc = "codesearch word" })
-- map("v", "<leader>cqv", function() gs.codesearch.visual() end, { desc = "codesearch visual" }) -- Visual Mode Only (note the "v")
-- map("n", "<leader>cwf", function() gs.codesearch.word({ files = true, title = "codesearch - word - files" }) end, { desc = "codesearch word-file" })
--
-- Comments
map("n", "<leader>cl", function() gs.comments.list() end, { desc = "Comments" })
map("n", "<leader>clu", function() gs.comments.list({ resolved = false }) end, { desc = "Comments (unresolved)" })

-- Blaze (Google-specific Build System) Commands
map("n", "<leader>b", function() gs.blaze.build() end, { desc = "blaze build" })
map("n", "<leader>ba", function() gs.blaze.build({ on_pkg = true }) end, { desc = "blaze build current package" })
map("n", "<leader>bu", function() gs.blaze.build({ under_cursor = true }) end, { desc = "blaze build under cursor" })
map("n", "<leader>ib", function() gs.blaze.build({ exec = "iblaze" }) end, { desc = "iblaze build" })
map("n", "<leader>it", function() gs.blaze.test({ exec = "iblaze" }) end, { desc = "iblaze test" })
map("n", "<leader>bt", function() gs.blaze.test() end, { desc = "blaze test" })
map("n", "<leader>bta", function() gs.blaze.test({ on_pkg = true }) end, { desc = "blaze test current package" })
map("n", "<leader>ut", function() gs.blaze.test({ under_cursor = true }) end, { desc = "blaze test under cursor" })
map("n", "<leader>tl", function() gs.blaze.targets() end, { desc = "blaze targets" })
map("n", "<leader>bc", function() gs.blaze.commands() end, { desc = "blaze commands" })
map("n", "<leader>bcl", function() gs.blaze.build_cleaner() end, { desc = "build cleaner" })

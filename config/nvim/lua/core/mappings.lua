vim.g.mapleader = " "

local map = vim.keymap.set
local delmap = vim.keymap.del
local telescope = require("telescope.builtin")

-- map("n", "-", vim.cmd.Ex)



delmap("n", "grr", { desc = "Delete lsp references" })

-- 

map("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map("n", "K", "5k")
map("n", "J", "5j")
map("n", "L", "5l")
map("n", "H", "5h")

map("v", "K", "5k")
map("v", "J", "5j")
map("v", "L", "5l")
map("v", "H", "5h")

map("n", "<C-n>", ":Neotree filesystem reveal left<CR>")

-- tmux navigator
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")

-- conform.nvim
map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "Format current file with conform" })


-- diagnostics
map("n", "<leader>dt", function()
  local config = vim.diagnostic.config()
  vim.diagnostic.config({
    virtual_text = not config.virtual_text,
    underline = not config.underline
  })
  print("Diagnostics toggled")
end, { desc = "Toggle inline diagnostics" })


map("n", "<leader>dl", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end)



-- linting
map("n", "<leader>ll", function()
  print("Linting current file")
  require('lint').try_lint()

end, {desc = "Trigger linting for the current file"})



-- Harpoon!
local harpoonUi = require("harpoon.ui")
local harpoonMark = require("harpoon.mark")
map("n", "<leader>hh", function() harpoonUi.toggle_quick_menu() end, {desc = "Open Harpoon Quickselect menu"})
map("n", "<leader>hm", function() harpoonMark.add_file()  end, {desc = "Open Harpoon Quickselect menu"})



-- Bufferline  
-- map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
-- map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
-- map("n", "<leader>x", function() Snacks.bufdelete() end, { desc = "Close buffer" })
--
-- map("n", "<Tab>", "<cmd>BufferNext<CR>", { desc = "Next buffer" })
-- map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
-- map("n", "<leader>x", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })


map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "<leader>x", function() Snacks.bufdelete() end, { desc = "Close buffer" })

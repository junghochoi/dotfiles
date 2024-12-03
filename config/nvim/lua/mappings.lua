require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "K", "5k")
map("n", "J", "5j")
map("n", "L", "5l")
map("n", "H", "5h")

-- tmux navigator
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>" )
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>" )
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>" )
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>" )

map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>") -- change live_grep keybinding
nomap("n","<leader>fw") -- remove original keybinding

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- nomap("n", "<leader>v") -- disable vertical terminal
-- nomap("n", "<leader>h") -- disable horizontal terminal
-- nomap("n", "<C-v>") -- disable vertical terminal
-- nomap("n", "<C-h>") -- disable horizontal terminal
nomap("n", "<M-v>") -- disable vertical terminal
nomap("n", "<M-h>") -- disable horizontal terminal
nomap("n", "<M-i>") -- disable floating terminal


map("n", "<C-n>", ":Neotree filesystem reveal left<CR>")


map("n", "<C-t>", function()
  require("nvchad.themes").open()
end, {})


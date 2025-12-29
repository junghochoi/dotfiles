return {
  "yairhochner/google-snacks.nvim",
  url = "sso://user/yairhochner/google-snacks.nvim",
  lazy = false,
  dependencies = {
    "folke/snacks.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      picker = { enabled = true }, -- needed for pickers
      terminal = { enabled = true, },                          -- needed for submit terminal
      input = { enabled = true }, -- needed for commit
    }
  },
  config = {}, -- add your config and customize here !
}

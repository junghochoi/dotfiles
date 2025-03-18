return {
  {
    "windwp/nvim-ts-autotag", -- Plugin name
    lazy = false, -- Ensures the plugin is loaded immediately
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- nvim-ts-autotag depends on treesitter
    config = function()
      require("nvim-ts-autotag").setup {
        filetypes = { "html", "xml", "javascript", "typescript", "tsx", "jsx" }, -- Specify supported filetypes
      }
    end,
  },
}

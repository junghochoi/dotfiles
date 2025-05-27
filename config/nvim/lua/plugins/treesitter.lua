return   {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    auto_install = true,
    highlight = { enable = true },
    ensure_installed = {
      "terraform",
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "json",
      "javascript",
      "typescript",
      "tsx",
      "yaml",
      "helm",
    },
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  opts = {
    -- popup_border_style = "rounded",
    default_component_configs = {
       file_size = {
         enabled = false,
      },
      type = {
        enabled = false,
      },
      last_modified = {
        enabled = false,
      },
    },
  },
}

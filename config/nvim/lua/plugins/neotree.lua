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
    popup_border_style = "rounded",
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
    -- filesystem = {
      -- bind_to_cwd = false,
      -- cwd_target = {
      --   sidebar = "global", -- Use the global cwd, which aligns with telescope
      --   current = "window",
      -- },
      -- follow_current_file = {
      --   enabled = true,          -- This will find and focus the file in the active buffer every time
      --   --               -- the current file is changed while the tree is open.
      --   leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
      -- },
    -- }
  },
}

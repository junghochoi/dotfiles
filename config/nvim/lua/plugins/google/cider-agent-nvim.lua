return {
  name = "cider-agent",
  url = "sso://user/idk/cider-agent.nvim",
  event = "VeryLazy",
  dependencies = {
    "MeanderingProgrammer/render-markdown.nvim",
  },
  config = function()
    local agent = require("cider-agent")
    -- the name of ciderlsp in my configuration is ciderlsp
    agent.setup({ server_name = "ciderlsp" })
    -- optional
    vim.keymap.set({ "n", "v" }, "<leader>cc", function()
      vim.ui.input({ prompt = "Cider Chat: " .. agent.refs() .. "\n" }, agent.chat)
    end, { desc = "[C]ider [C]chat" })
    vim.keymap.set({ "n", "v" }, "<leader>ce", function()
      vim.ui.input({ prompt = "Cider Edit: " .. agent.refs() .. "\n" }, agent.simple_coding)
    end, { desc = "[C]ider [E]edit" })
    vim.keymap.set({ "n", "v" }, "<leader>cE", function()
      vim.ui.input({ prompt = "Cider Complex Tasks: " .. agent.refs() .. "\n" }, agent.complex_task)
    end, { desc = "[C]ider Compl[E]x" })
  end,
}

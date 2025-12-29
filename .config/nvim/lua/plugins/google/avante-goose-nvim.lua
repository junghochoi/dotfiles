---@module "avante"
-- AI related plugins
return {
  {
    "yetone/avante.nvim",
    build = "make",
    enable = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- Add vintharas/avante-goose.nvim as a dependecy to avante.nvim
      -- That'll ensure that you'll load avante-goose when you load avante.
      {
        "vintharas/avante-goose.nvim",
        url = "sso://user/vintharas/avante-goose.nvim",
        opts = {
          -- Add your options here
          -- These are the defaults
          auto_start_backend = true, -- Whether to automatically start go/devai-api-http-proxy. If false you can use :AvanteGooseServerStart to start the server
          auto_start_silent = true, -- Whether to have a silent auto start (don't log status messages)
          model = 'gemini-for-google-2.5-pro',    -- Select model from go/goose-models.
          temperature = 0.1,         -- Model temperature
          max_decoder_steps = 8192, -- Maximum decoder steps (This affects the token limit of the output. More decoder steps -> higher limit in output tokens)
          endpoint = 'http://localhost:8080/predict', -- Endpoint to start/listen to go/devai-api-http-proxy
          debug = false, -- Enables debug mode (outputs lots of logs for troubleshooting issues)
          debug_backend = false, -- Whether to start the backend in debug mode. This logs backend output information under stdpath('cache')/devai-http-wrapper.log
          use_turn_marking = true, -- Add <ctrl99>user\nMessage<ctrl100> markings to clearly separate system, user, model in context.
          tool_start_marker = '<ctrl97>tool_code', -- default for gemini-for-google-2.5-pro, use "```tool_code" for Gemini 1p
          tool_end_marker = '<ctrl98>', -- default for gemini-for-google-2.5-pro, use "```" for Gemini 1p
          -- This is how messages presented to model.
          -- The default works well both for goose models like gemini-for-google-2.5-pro
          -- and gemini 1p. To switch back to original version change to '{role}:' and ''
          turn_start = '<ctrl99>{role}\n',
          turn_end = '<ctrl100>',
          -- The tools are enabled by default, but can be disabled.
          -- Even if tools disabled avante prompt still mentions them,
          -- so model may try call them regardless using an arbitrary format.
          -- This option can be used to examine what is the most comfortable
          -- calling conventions for the model and adjust tool markers.
          disable_tools = false,
        },
      },
    },
    opts = {
      provider = "google-goose", -- Select goose as provider
      providers = {}, -- Makes sure there's a vendors table
    },
    config = function(_, opts)
      -- Load provider from the plugin
      opts.providers["google-goose"] = require("avante-goose").getProvider()
      require("avante").setup(opts)
    end,
  },
}

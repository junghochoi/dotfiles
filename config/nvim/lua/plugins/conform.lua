-- Keep track of which formatters take too long, to format them async.
local slow_format_filetypes = {}
local conform_opts = {}
local codefmt = {}
local codefmt_opts = {}

local function formatting_configured_for_ft(ft)
  return conform_opts.formatters_by_ft and conform_opts.formatters_by_ft[ft]
end

local function formatting_enabled_in_plugin_for_ft(ft, plugin_opts)
  return plugin_opts.auto_format and (plugin_opts.auto_format[ft] or
    plugin_opts.formatters_by_ft and not plugin_opts.formatters_by_ft[ft])
end

local function formatting_enabled_for_ft(ft)
  return formatting_configured_for_ft(ft) and
      formatting_enabled_in_plugin_for_ft(ft, conform_opts) and
      (not codefmt or formatting_enabled_in_plugin_for_ft(ft, codefmt_opts))
end

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo", "Format", "FormatDisable", "FormatEnable" },
  opts = function(_, opts)
    local formatters_by_ft = {
      borg            = { "gclfmt" },
      gcl             = { "gclfmt" },
      patchpanel      = { "gclfmt" },
      bzl             = { "buildifier" },
      c               = { "clang_format" },
      cpp             = { "clang_format" },
      javascript      = { "prettier" },
      typescript      = { "prettier" },
      javascriptreact = { "prettier", lsp_format = "never" },
      typescriptreact = { "prettier" },
      css             = { "prettier" },
      scss            = { "prettier" },
      html            = { "prettier" },
      json            = { "prettier" },
      dart            = { "tidy_dart", "dartfmt" },
      go              = { "gofmt" },
      java            = { "google-java-format" },
      kotlin          = { "ktfmt" },
      jslayout        = { "jslfmt" },
      markdown        = { "mdformat" },
      ncl             = { "nclfmt" },
      python          = function(bufnr)
        if string.match(vim.api.nvim_buf_get_name(bufnr), "%.cfg$") then
          return { lsp_format = "never" }
        else
          return { "pyformat" }
        end
      end,
      piccolo         = { "pyformat" },
      soy             = { "soyfmt" },
      textpb          = { "txtpbfmt", lsp_format = "never" },
      proto           = { "protofmt" },
      sql             = { "format_sql" },
      googlesql       = { "format_sql" },
      terraform       = { "terraform" },
      qflow           = { "qfmt" },
    }
    local auto_format = {}
    for filetype in pairs(formatters_by_ft) do
      auto_format[filetype] = true
    end
    return vim.tbl_deep_extend("force", opts, {
      default_format_opts = {
        lsp_format = "prefer",
      },
      notify_on_error = true,
      notify_no_formatters = true,
      formatters_by_ft = formatters_by_ft,
      auto_format = auto_format,
      -- Format synchronously at first. But if the LSP or formatter takes too long,
      -- add the filetype to `slow_format_filetypes` and use async formatting.
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        if slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        if not formatting_enabled_for_ft(vim.bo[bufnr].filetype) then
          return
        end
        local function on_format(err)
          if err and err:match("timeout$") then
            slow_format_filetypes[vim.bo[bufnr].filetype] = true
          end
        end

        return { timeout_ms = 500 }, on_format
      end,
      format_after_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        if not slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        if not formatting_enabled_for_ft(vim.bo[bufnr].filetype) then
          return
        end
        return {}
      end,
      formatters = {
        gclfmt = {
          command = "/google/data/ro/projects/borg/gclfmt",
          args = {},
          stdin = true,
        },
        mdformat = {
          command = "/google/bin/releases/corpeng-engdoc/tools/mdformat",
          args = { "-" },
          range_args = function(_, ctx)
            return { "-", "--lines", ctx.range.start[1], ":", ctx.range["end"][1] }
          end,
          stdin = true,
        },
        nclfmt = {
          command = "/google/src/head/depot/google3/configlang/ncl/release/nclfmt.k8",
          args = { "-" },
          stdin = true,
        },
        jslfmt = {
          command = "/google/data/ro/projects/gws/tools/direct/jslayout_builder",
          args = { "--mode=format", "-" },
          stdin = true,
        },
        txtpbfmt = {
          command = "/google/bin/releases/text-proto-format/public/fmt",
          args = function(_, ctx)
            local args = {}
            if string.match(ctx.filename, "%.ppp$") then
              table.insert(args, "-preserve_angle_brackets")
            elseif string.match(ctx.filename, "/borgspec%.prod%.auto$") then
              table.insert(args, "-sort_repeated_fields_by_subfield=name,cell,user")
            end
            return args
          end,
          stdin = true,
        },
        protofmt = {
          command = "/google/bin/releases/client-proto-wg/protofmt/protofmt",
          args = {},
          stdin = true,
        },
        format_sql = {
          command = "/google/data/ro/teams/googlesql-formatter/fmt",
          args = {},
          stdin = true,
        },
        pyformat = {
          command = "pyformat",
          args = { "--assume_filename", "$FILENAME", },
          stdin = true,
          range_args = function(_, ctx)
            return { "--lines", ctx.range.start[1] .. "-" .. ctx.range["end"][1] }
          end,
        },
        soyfmt = {
          command = "/google/data/rw/teams/frameworks-web-tools/soy/format/live/bin_deploy.jar",
          args = { "--assume_filename", "$FILENAME", },
          stdin = true,
          range_args = function(_, ctx)
            return { "--lines", ctx.range.start[1] .. "-" .. ctx.range["end"][1] }
          end,
        },
        tidy_dart = {
          command = "/google/data/ro/teams/tidy_dart/tidy_dart",
          args = { "--stdinFilename", "$FILENAME" },
          stdin = true,
        },
        dartfmt = {
          command = "/usr/lib/google-dartlang/bin/dart",
          args = { "format" },
          stdin = true,
        },
        terraform = {
          command = "/google/data/ro/teams/terraform/bin/terraform",
          args = {},
          stdin = true,
        },
        prettier = {
          command = "/google/data/ro/teams/prettier/prettier",
          args = { "--stdin-filepath", "$FILENAME" },
          stdin = true,
        },
        ktfmt = {
          command = "/google/bin/releases/kotlin-google-eng/ktfmt/ktfmt",
          args = { "--google-style" },
          stdin = true,
        },
        clang_format = {
          command = "/usr/bin/clang-format",
          args = function(_, ctx)
            local style = string.find(ctx.filename, "/google/src/cloud/") == 1 and "Google" or "file"
            return { "-assume-filename", "$FILENAME", "-style", style }
          end,
          stdin = true,
          range_args = function(_, ctx)
            return { "-lines", ctx.range.start[1] .. ":" .. ctx.range["end"][1] }
          end,
        },
        qfmt = {
          command = "/google/bin/releases/qflow-team/public/qfmt/qfmt",
          args = { "$FILENAME" },
          stdin = false,
        },
      },
    })
  end,
  config = function(_, opts)
    vim.api.nvim_set_option_value("formatexpr", "v:lua.require'conform'.formatexpr()", {})

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({
        async = true,
        -- CiderLSP doesn't support range formatting.
        lsp_format = range and "never" or "prefer",
        range = range,
      })
    end, { range = true })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
        vim.notify("Formatting on save disabled for buffer", vim.log.levels.INFO, { title = "nvgoog" })
      else
        vim.g.disable_autoformat = true
        vim.notify("Formatting on save disabled", vim.log.levels.INFO, { title = "nvgoog" })
      end
    end, {
      desc = "Disable autoformat on save",
      bang = true,
    })

    vim.api.nvim_create_user_command("FormatEnable", function(args)
      if args.bang then
        vim.b.disable_autoformat = false
        vim.notify("Formatting on save enabled for buffer", vim.log.levels.INFO, { title = "nvgoog" })
      else
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
        vim.notify("Formatting on save enabled", vim.log.levels.INFO, { title = "nvgoog" })
      end
      if not formatting_configured_for_ft(vim.bo[0].filetype) then
        vim.notify("Formatting enabled but no formatters configured for this filetype", vim.log.levels.WARN,
          { title = "nvgoog" })
      elseif not formatting_enabled_for_ft(vim.bo[0].filetype) then
        vim.notify("Formatting enabled but `opts.auto_format` not set for this filetype", vim.log.levels.WARN,
          { title = "nvgoog" })
      end
    end, {
      desc = "Re-enable autoformat on save",
      bang = true,
    })

    conform_opts = opts
    codefmt = require("lazy.core.config").plugins["codefmt-google"]
    codefmt_opts = require("lazy.core.plugin").values(codefmt or {}, "opts", false)

    if codefmt and not codefmt_opts.auto_format or not conform_opts.auto_format then
      -- If codefmt is enabled but its `opts.auto_format` disabled,
      -- or if conform.nvim's `opts.formatters_by_ft` is disabled,
      -- disable auto formatting for conform.nvim
      vim.g.disable_autoformat = true
    elseif opts.auto_format and (opts.format_on_save or opts.format_after_save) then
      -- If auto formatting is enabled for conform.nvim, disable it on codefmt.
      vim.g._use_conform_auto_format = true
    end

    require("conform").setup(opts)
  end,
}

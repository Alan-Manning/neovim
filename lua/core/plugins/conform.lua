return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local util = require("conform.util")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "yamlfix" },
        markdown = { "prettier" },
        lua = { "stylua" },
        -- python = { "black", "isort", "docformatter" },
        python = { "ruff_fix", "ruff_format", "isort", "docformatter" },
        rust = { "rustfmt", lsp_fallback = "fallback" },
      },
      formatters = {

        docformatter = {
          command = "docformatter",
          args = {
            "$FILENAME",
            "--in-place",
          },
          cwd = util.root_file({
            -- https://docformatter.readthedocs.io/en/latest/configuration.html
            "pyproject.toml",
            "setup.cfg",
            "tox.ini",
          }),
        },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = false,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Conform format file or range" })
  end,
}

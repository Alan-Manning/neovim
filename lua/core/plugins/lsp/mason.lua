return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        border = "rounded",
        width = 0.7,
        height = 0.7,

        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "html",
        "htmx",
        "cssls",
        "tailwindcss",
        "jsonls",
        "yamlls",
        "lua_ls",
        "pyright",
        -- "pylsp",
        "rust_analyzer",
        "lemminx",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    -- This is the mason tool installer plugin config that ensures the linters
    -- and formatters are correctly installed through mason.
    mason_tool_installer.setup({
      ensure_installed = {
        --lua
        "selene", -- lua linter
        "stylua", -- lua formatter

        --Js
        "eslint_d", -- js linter
        "prettier", -- prettier formatter

        --Yaml
        "yamlfix", -- Yaml formatter

        -- python
        "rstcheck", -- ReStructuredText linter
        "mypy",     -- python linter static type checking
        "ruff",     -- python linter
        "isort",    -- python formatter
        "black",    -- python formatter
        "docformatter", -- python formatter

        --xml
        "xmlformatter",
      },
    })
  end,
}

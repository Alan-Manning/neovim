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
				"cssls",
				"tailwindcss",
        "yamlls",
				"lua_ls",
				"pyright",
				-- "pylsp",
				"rust_analyzer",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		-- This is the mason tool installer plugin config that ensures the linters
		-- and formatters are correctly installed through mason.
		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"selene", -- lua linter
				"isort", -- python formatter
				"black", -- python formatter
				"docformatter", -- python formatter
				-- "pylint", -- python linter
				"ruff", -- python linter
				"eslint_d", -- js linter
			},
		})
	end,
}

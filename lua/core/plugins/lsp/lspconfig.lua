return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		-- "nvimdev/lspsaga.nvim",
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = { noremap = true, silent = true }

		---@diagnostic disable-next-line: unused-local
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds

			-- show definition, references
			opts.desc = "Show LSP references"
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

			-- go to declaration
			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)

			-- show lsp definitions
			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gD", "<cmd>Telescope lsp_definitions<CR>", opts)

			-- show lsp implementations
			opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

			-- show lsp type definitions
			opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)


      opts.desc = "Show signature_help"
      vim.keymap.set('n', '<leader>gs', vim.lsp.buf.signature_help, opts)

			-- see available code actions, in visual mode will apply to selection
			opts.desc = "See available code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			-- opts.desc = "See available code actions"
			-- vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions, in visual mode will apply to selection -- LSPSAGA

			-- smart rename
			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			-- show  diagnostics for file
			opts.desc = "Show buffer diagnostics"
			vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

			-- show diagnostics for line
			opts.desc = "Show line diagnostics"
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

			-- jump to previous diagnostic in buffer
			opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			-- jump to next diagnostic in buffer
			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

			-- show documentation for what is under cursor
			opts.desc = "Show documentation under cursor"
			vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
			-- opts.desc = "Show documentation for what is under cursor"
			-- vim.keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor -- LSPSAGA

			-- mapping to restart lsp if necessary
			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure yaml server
		lspconfig["yamlls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure python server
		-- lspconfig["ruff_lsp"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })
		-- lspconfig["pyright"].setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure rust server
		lspconfig["rust_analyzer"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure rust server
		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- setting the LspInfo window color scheme changes
    require('lspconfig.ui.windows').default_options.border = 'single'
		-- local win = require("lspconfig.ui.windows")
		-- local _default_opts = win.default_opts
		--
		-- win.default_opts = function(options)
		-- 	local opts = _default_opts(options)
		-- 	opts.border = "single"
		-- 	return opts
		-- end
	end,
}

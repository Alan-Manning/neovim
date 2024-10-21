return {
	"mrcjkb/rustaceanvim",
	version = "^4", -- Recommended
	ft = { "rust" },
	config = function()
		-- local mason_registry = require("mason-registry")
		--
		-- local codelldb = mason_registry.get_package("codelldb")
		-- local extension_path = codelldb:get_install_path() .. "/extension/"
		-- local codelldb_path = extension_path .. "adapter/codelldb"
		-- local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

		vim.g.rustaceanvim = {
			-- Plugin configuration
			-- LSP configuration
			server = {
				tools = {
          executor = "toggleterm",
					hover_actions = {
						auto_focus = true,
					},
				},
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				on_attach = function(_, bufnr)
					-- you can also put keymaps in here

					local opts = { buffer = bufnr }

					-- Formatting here becuase nonels does not get loaded for formatring rust.
					vim.keymap.set({ "n", "v" }, "<leader>mp", function()
						vim.lsp.buf.format({ timeout_ms = 10000 })
					end, { desc = "Format File" })
					-- Code Actions
					opts.desc = "See available code actions"
					vim.keymap.set("n", "<leader>ca", function()
						vim.cmd.RustLsp("codeAction")
					end, opts)

					-- Show Documentation for what is under cursor
					opts.desc = "Show documentation under cursor"
					vim.keymap.set("n", "<leader>k", function()
						vim.cmd.RustLsp({ "hover", "actions" })
					end, opts)

					-- Explain Error
					opts.desc = "Explain Error"
					vim.keymap.set("n", "<leader>ex", function()
						vim.cmd.RustLsp("explainError")
					end, opts)

					-- Render Diagnostic
					opts.desc = "Render diagnostics"
					vim.keymap.set("n", "<leader>d", function()
						vim.cmd.RustLsp("renderDiagnostic")
					end, opts)

					-- SECTION BELOW IS COPIED FROM lspconfig.lua

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
					-- opts.desc = "Show LSP implementations"
					-- vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

					-- show lsp type definitions
					opts.desc = "Show LSP type definitions"
					vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

					-- see type hinting information
					opts.desc = "Show signature_help"
					vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, opts)

					-- smart rename
					opts.desc = "Smart rename"
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					-- show  diagnostics for file
					opts.desc = "Show buffer diagnostics"
					vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

					-- jump to previous diagnostic in buffer
					opts.desc = "Go to previous diagnostic"
					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

					-- jump to next diagnostic in buffer
					opts.desc = "Go to next diagnostic"
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

					-- mapping to restart lsp if necessary
					opts.desc = "Restart LSP"
					vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
				end,
			},
			-- DAP configuration
			-- dap = {
			-- 	-- adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
			-- },
		}
	end,
}

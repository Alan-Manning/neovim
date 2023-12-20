return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			python = { "ruff" },
		}

		-- setting specific overrides for linting python files
		-- local pylint = require("lint").linters.pylint
		-- pylint.args = {
		-- 	"-f",
  --     "--disable=C,R",
		-- }

		-- Setting up an autogroup and autocmd to trigger linting of file.
		local lint_augroup_py = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd(
			{ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, -- or "TextChanged" could also be added
			{
        pattern = { "*.py" },
        group = lint_augroup_py,
				callback = function()
					lint.try_lint()
				end,
			}
		)

		local lint_augroup_lua_js = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd(
			{ "BufEnter", "BufWritePost", "InsertLeave" }, -- or "TextChanged" could also be added
			{
        pattern = { "*.js", "*.lua"},
				group = lint_augroup_lua_js,
				callback = function()
					lint.try_lint()
				end,
			}
		)

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}

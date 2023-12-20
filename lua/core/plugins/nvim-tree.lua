return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		-- configure nvim-tree
		nvimtree.setup({
			-- hijack_cursor = true, -- keeps cursor on first letter of filename when moving in tree
			view = {
				adaptive_size = true,
				signcolumn = "no",
				preserve_window_proportions = true,
				width = {
					padding = 0,
				},
				float = {
					enable = false,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 30,
						height = 30,
						row = 1,
						col = 1,
					},
				},
			},
			renderer = {
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
			},
		})

		-- set keymaps
		vim.keymap.set("n", "<leader>ee", ":NvimTreeFindFileToggle<CR>", { desc = "File Tree Toggle" })
	end,
}

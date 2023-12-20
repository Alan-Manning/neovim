return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-tree/nvim-web-devicons" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				extensions = {
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
				},
			},
		})

		-- set the keymaps
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "telescope oldfiles" })
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "telescope help tags" })

		-- To get fzf loaded and working with telescope, you need to call
		-- load_extension, somewhere after setup function:
		require("telescope").load_extension("fzf")
	end,
}

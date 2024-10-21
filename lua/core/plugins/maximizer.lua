return {
	"0x00-ketsu/maximizer.nvim",
	config = function()
		require("maximizer").setup()

		vim.keymap.set(
			"n",
			"<leader>mx",
			'<cmd>lua require("maximizer").toggle()<CR>',
			{ desc = "Maximizer toggle", silent = true, noremap = true }
		)

		vim.keymap.set(
			"n",
			"<leader>mr",
			'<cmd>lua require("maximizer").restore()<CR>',
			{ desc = "Maximizer restore", silent = true, noremap = true }
		)
	end,
}

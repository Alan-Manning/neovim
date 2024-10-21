return {
	"ahmedkhalf/project.nvim",
	-- dependencies = {
	-- 	"nvim-tree/nvim-tree.lua",
	-- },
	config = function()
		require("project_nvim").setup({
			manual_mode = true, -- doesnt change to root dir unless i use cmd ":ProjectRoot"
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			detection_methods = { "lsp", "pattern" },
			patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

			show_hidden = false, -- Show hidden files in telescope
      silent_chdir = true, -- Message when project.nvim changes your directory.
		})

		-- making the cd work with nvim tree.
		--
		-- require("nvim-tree").setup({
		-- 	sync_root_with_cwd = true,
		-- 	respect_buf_cwd = true,
		-- 	update_focused_file = {
		-- 		enable = false,
		-- 		update_root = true,
		-- 	},
		-- })
	end,
}

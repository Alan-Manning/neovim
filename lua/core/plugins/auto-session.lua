return {
	"rmagatti/auto-session",
	config = function()
		-- Recomended vim.o.sessionoptions for use with auto-session in options.lua.
		require("auto-session").setup({
			log_level = "error",

			auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
			auto_save_enabled = true,

			cwd_change_handling = {
				restore_upcoming_session = true,
				pre_cwd_changed_hook = nil,
				post_cwd_changed_hook = function()
					require("lualine").refresh()
				end,
			},

			-- Telescope integration for switching sessions
			session_lens = {
				load_on_setup = true,
				theme = "dropdown",
				theme_conf = { border = true, winblend = 0 },
				previewer = false,
			},
		})

		-- Set the keymap for telescope view of sessions.
		vim.keymap.set("n", "<leader>fs", require("auto-session.session-lens").search_session, {
			noremap = true,
			desc = "Sessions switch",
		})
	end,
}

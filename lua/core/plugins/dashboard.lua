return {
	"nvimdev/dashboard-nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "ahmedkhalf/project.nvim" },
	},
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			-- config
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{
						icon = "󰒲 ",
						icon_hl = "@variable",
						desc = "Lazy",
						group = "@property",
						action = "Lazy",
						key = "l",
					},
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Mason",
						group = "@property",
						action = "Mason",
						key = "m",
					},
					{
						icon = "󱉛 ",
						icon_hl = "@variable",
						desc = "Lazy update",
						group = "@property",
						action = "Lazy update",
						key = "u",
					},
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Recent Files",
						group = "Label",
						action = "Telescope oldfiles",
						key = "f",
					},
					{
						desc = " Projects",
						group = "DiagnosticHint",
						action = "Telescope projects",
						key = "p",
					},
				},
        footer = {},
			},
		})
	end,
}

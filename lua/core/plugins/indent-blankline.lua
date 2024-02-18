return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}

		local C = require("catppuccin.palettes").get_palette("mocha")
		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = C.red })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = C.yellow })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = C.blue })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = C.peach })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = C.green })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = C.mauve })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = C.teal })
		end)

		vim.g.rainbow_delimiters = { highlight = highlight }
		require("ibl").setup({
			scope = {
				enabled = true,
				show_start = true,
				show_end = true,
				show_exact_scope = true,
				highlight = highlight,
				include = {
					node_type = {
						lua = { "return_statement", "table_constructor" },
						python = { "expression_statement", "if_statement", "while_statement", "for_statement" },
					},
				},
			},
			indent = {
				char = "▏",
			},
		})

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}

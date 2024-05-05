return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"famiu/bufdelete.nvim",
	},
	version = "*",
	config = function()
		local bufferline = require("bufferline")
		local mocha = require("catppuccin.palettes").get_palette("mocha")

		bufferline.setup({
			highlights = {
				fill = {
					fg = mocha.text,
					bg = mocha.base,
				},
				tab = {
					fg = mocha.blue,
					bg = mocha.rosewater,
				},
				tab_selected = {
					fg = mocha.blue,
					bg = mocha.rosewater,
				},
				background = {
					fg = mocha.text,
					bg = mocha.surface1,
				},
				buffer_visible = {
					fg = mocha.text,
					bg = mocha.surface1,
				},
				buffer_selected = {
					fg = mocha.base,
					bg = mocha.blue,
					bold = false,
					italic = false,
				},
				close_button = {
					fg = mocha.blue,
					bg = mocha.base,
				},
				close_button_visible = {
					fg = mocha.blue,
					bg = mocha.surface1,
				},
				close_button_selected = {
					fg = mocha.base,
					bg = mocha.blue,
				},
        duplicate = {
					fg = mocha.red,
					bg = mocha.surface1,
        },
				duplicate_selected = {
					fg = mocha.text,
					bg = mocha.blue,
				},
				duplicate_visible = {
					fg = mocha.lavender,
					bg = mocha.surface1,
				},
				indicator_visible = {
					fg = mocha.surface1,
					bg = mocha.surface1,
				},
				indicator_selected = {
					fg = mocha.base,
					bg = mocha.blue,
				},
				modified = {
					fg = mocha.blue,
					bg = mocha.surface1,
				},
				modified_visible = {
					fg = mocha.blue,
					bg = mocha.surface1,
				},
				modified_selected = {
					fg = mocha.base,
					bg = mocha.blue,
				},
				numbers = {
					fg = mocha.blue,
					bg = mocha.surface1,
				},
				numbers_visible = {
					fg = mocha.blue,
					bg = mocha.surface1,
				},
				numbers_selected = {
					fg = mocha.base,
					bg = mocha.blue,
					bold = false,
					italic = false,
				},
				offset_separator = {
					fg = mocha.blue,
					bg = mocha.base,
				},
				separator_selected = {
					fg = mocha.base,
					bg = mocha.blue,
				},
				separator_visible = {
					fg = mocha.base,
					bg = mocha.surface1,
				},
				separator = {
					fg = mocha.base,
					bg = mocha.surface1,
				},
			},
			options = {
				themable = true,
				numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
				close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"

				-- indicator = {
				-- 	icon = "",
				-- 	style = "icon", -- | 'underline' | 'none',
				-- },
				indicator = {
					style = "none",
				},
				buffer_close_icon = "",
				modified_icon = "+",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				max_name_length = 30,
				max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
				truncate_names = false,
				tab_size = 1,
				diagnostics = false, -- | "nvim_lsp" | "coc",
				diagnostics_update_in_insert = false,
				offsets = {
					{ filetype = "NvimTree", text = "Nvim Tree", separator = false },
					{ filetype = "undotree", text = "Undo Tree", separator = false },
				},
				show_buffer_icons = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = false,
				show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist

				-- separator_style = { "", "" },
				-- separator_style = { "  ", "  " },
				-- separator_style = { " ", " " },
				-- separator_style = { " ", " " },
				separator_style = "slope",
				-- separator_style = "thin",
				-- separator_style = "padded_slope",
				-- separator_style = { "", "" }, --"slope", --{ "  ", "  " }, -- {"",""}, -- "slope" | "thick" | "thin" | { 'any', 'any' },
				enforce_regular_tabs = false,
				always_show_bufferline = true,
				hover = {
					enabled = true,
					delay = 150,
					reveal = { "close" },
				},
				-- sort_by = 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
				--   -- add custom logic
				--   return buffer_a.modified > buffer_b.modified
				-- end
				style_preset = {
					bufferline.style_preset.no_italic,
					bufferline.style_preset.no_bold,
				},
			},
		})
	end,
}

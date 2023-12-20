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
			options = {
				themable = true,
				numbers = "buffer_id", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
				close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
				middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"

				indicator = {
					style = "none", -- | 'underline' | 'none',
				},
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				--- name_formatter can be used to change the buffer's label in the bufferline.
				--- Please note some names can/will break the
				--- bufferline so use this at your discretion knowing that it has
				--- some limitations that will *NOT* be fixed.
				-- name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
				--   -- remove extension from markdown files for example
				--   if buf.name:match('%.md') then
				--     return vim.fn.fnamemodify(buf.name, ':t:r')
				--   end
				-- end,
				max_name_length = 30,
				max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
				truncate_names = false,
				tab_size = 21,
				diagnostics = false, -- | "nvim_lsp" | "coc",
				diagnostics_update_in_insert = false,
				-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
				--   return "("..count..")"
				-- end,
				-- NOTE: this will be called a lot so don't do any heavy processing here
				-- custom_filter = function(buf_number)
				--   -- filter out filetypes you don't want to see
				--   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
				--     return true
				--   end
				--   -- filter out by buffer name
				--   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
				--     return true
				--   end
				--   -- filter out based on arbitrary rules
				--   -- e.g. filter out vim wiki buffer from tabline in your work repo
				--   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
				--     return true
				--   end
				-- end,
				offsets = {
					{ filetype = "NvimTree", text = "Nvim Tree", padding = 1 },
					{ filetype = "undotree", text = "Undo tree", padding = 1 },
				},
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist

				separator_style = "thick", -- {"",""}, -- "slope" | "thick" | "thin" | { 'any', 'any' },
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
				},
				highlights = {
					fill = { bg = mocha.sky },
					background = { bg = mocha.flamingo, fg = mocha.text },
					modified = { fg = mocha.rosewater, bg = mocha.maroon },
					modified_selected = { fg = mocha.rosewater, bg = mocha.peach },
				},
				-- vim.cmd [[
				-- hi BufferLineFill guibg='#191724'
				-- hi BufferLineSeparator guibg='#191724'
				-- hi BufferLineSeparatorVisible guibg='#191724'
				-- ]]
			},
		})

    -- vim.cmd(string.gsub([[ hi BufferLineFill guibg='$COL' ]], "%$(%w+)", { COL = mocha.sky }))
    vim.cmd(string.gsub([[ hi BufferLineSeparator guibg='$COL' ]], "%$(%w+)", { COL = mocha.blue }))
		vim.cmd(string.gsub([[ hi BufferLineSeparatorVisible guibg='$COL' ]], "%$(%w+)", { COL = mocha.blue }))
		-- vim.cmd(string.gsub([[ hi BufferLineFill guibg='$COL' ]], "%$(%w+)", { COL = mocha.sky }))
	end,
}

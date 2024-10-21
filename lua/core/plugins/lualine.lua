return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")
		local C = require("catppuccin.palettes").get_palette("mocha")
		-- local O = require("catppuccin").options
		local catppuccin_theme_overweite = {}

		-- local transparent_bg = O.transparent_background and "NONE" or C.mantle

		catppuccin_theme_overweite.normal = {
			a = { bg = C.blue, fg = C.mantle, gui = "bold" },
			b = { bg = C.surface1, fg = C.blue },
			c = { bg = C.base, fg = C.sky },
		}

		catppuccin_theme_overweite.insert = {
			a = { bg = C.green, fg = C.base, gui = "bold" },
			b = { bg = C.surface1, fg = C.green },
		}

		catppuccin_theme_overweite.terminal = {
			a = { bg = C.green, fg = C.base, gui = "bold" },
			b = { bg = C.surface1, fg = C.green },
		}

		catppuccin_theme_overweite.command = {
			a = { bg = C.peach, fg = C.base, gui = "bold" },
			b = { bg = C.surface1, fg = C.peach },
		}

		catppuccin_theme_overweite.visual = {
			a = { bg = C.mauve, fg = C.base, gui = "bold" },
			b = { bg = C.surface1, fg = C.mauve },
		}

		catppuccin_theme_overweite.replace = {
			a = { bg = C.red, fg = C.base, gui = "bold" },
			b = { bg = C.surface1, fg = C.red },
		}

		catppuccin_theme_overweite.inactive = {
			a = { bg = C.base, fg = C.blue },
			b = { bg = C.base, fg = C.surface1, gui = "bold" },
			c = { bg = C.base, fg = C.overlay0 },
		}

		-- Lsp server name .
		local function add_LSP_name()
			local msg = "No Active Lsp"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return " LSP: " .. client.name
				end
			end
			return msg
		end

		local function show_macro_recording()
			local recording_register = vim.fn.reg_recording()
			if recording_register == "" then
				return ""
			else
				return "Recording @" .. recording_register
			end
		end

		lualine.setup({
			options = {
				icons_enabled = true,
				theme = catppuccin_theme_overweite,
				component_separators = "",
				-- component_separators = "|",
				section_separators = { left = "", right = "" },
				-- section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = false,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
						padding = { left = 1, right = 1 },
						fmt = function()
							return ""
						end,
					},
				},
				lualine_b = {
					{ "branch" },
					{ "diff" },
					{
						"swenv",
						icon = "󰆧",
						cond = function()
							return vim.bo.filetype == "python"
						end,
					},
					{ "filetype", icon_only = true },
					{ "filename", path = 1, symbols = { readonly = "󰈈", modified = "+" } },
				},
				lualine_c = {
					{ "diagnostics" },
					{ "macro-recording", fmt = show_macro_recording },
				},
				lualine_x = {
					{ "searchcount" },
					{ "mason" },
					{ "lazy" },
				},
				lualine_y = {
					{
						add_LSP_name,
						on_click = function()
							vim.cmd([[LspInfo]])
						end,
					},
				},
				lualine_z = {
					{ "progress" },
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
				-- 	lualine_y = {
				-- 		"progress",
				-- 		"location",
				-- 	},
				-- 	lualine_z = {
				-- 		{ "datetime", style = "%a %d" },
				-- 		{ "datetime", style = "%H:%M", separator = { right = "" }, left_padding = 2 },
				-- 	},
			},

			inactive_sections = {
				lualine_a = {
					{ "filetype", icon_only = true },
					{ "filename", path = 1, symbols = { readonly = "󰈈", modified = "+" } },
				},
				lualine_b = {
					-- { "filename" },
					{ "diff" },
				},
				lualine_c = {
					-- "location"
				},
				lualine_x = {
					{ "searchcount" },
				},
				lualine_y = {
					-- "diff"
				},
				lualine_z = { "progress", "location" },
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "nvim-tree", "nvim-dap-ui", "lazy", "toggleterm", "mason" },
		})
	end,
}

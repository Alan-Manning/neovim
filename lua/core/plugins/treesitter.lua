return {
	"nvim-treesitter/nvim-treesitter",
	-- event = { "BufReadPre", "BufNewFile" },
  ft = { "lua", "rust", "vim", "markdown", "markdown_inline" },
	build = ":TSUpdate",
	dependencies = {
		-- "p00f/nvim-ts-rainbow",
    -- "nvim-treesitter/playground",
	},
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			-- A list of parser names, or "all"
			ensure_installed = { "lua", "rust", "vim", "markdown", "markdown_inline" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			auto_install = true,
			ignore_install = { "python" },
			autopairs = {
				enable = true,
			},
			highlight = {
				enable = true,
				disable = { "python" },
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
				disable = { "yaml", "python"},
			},
			-- rainbow = {
			-- 	enable = true,
			-- 	-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
			-- 	extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			-- 	max_file_lines = nil, -- Do not enable for files with more than n lines, int
			-- 	-- colors = {}, -- table of hex strings
			-- 	-- termcolors = {} -- table of colour name strings
			-- },
			-- playground = {
			-- 	enable = true,
			-- 	disable = {},
			-- 	updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			-- 	persist_queries = false, -- Whether the query persists across vim sessions
			-- 	keybindings = {
			-- 		toggle_query_editor = "o",
			-- 		toggle_hl_groups = "i",
			-- 		toggle_injected_languages = "t",
			-- 		toggle_anonymous_nodes = "a",
			-- 		toggle_language_display = "I",
			-- 		focus_language = "f",
			-- 		unfocus_language = "F",
			-- 		update = "R",
			-- 		goto_node = "<cr>",
			-- 		show_help = "?",
			-- 	},
			-- },
		})
	end,
}

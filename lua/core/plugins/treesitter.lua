return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  -- ft = { "python", "lua", "rust", "vim", "markdown", "markdown_inline" },
  build = ":TSUpdate",
  dependencies = {
    "HiPhish/rainbow-delimiters.nvim",
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/playground",
  },
  config = function()
    local configs = require("nvim-treesitter.configs")

    vim.treesitter.language.register("html", "htmldjango")

    configs.setup({
      -- A list of parser names, or "all"
      ensure_installed = {
        "lua",
        "vim",
        "markdown",
        "markdown_inline",
        "python",
        "rust",
        "toml",
        "yaml",
        "json",
        "html",
        "htmldjango",
        "javascript",
        "typescript",
        "http",
        "css",
        "comment",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      auto_install = true,

      autopairs = {
        enable = true,
      },

      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = {
          "html",
          "xml",
          "htmldjango",
        },
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      playground = {
      	enable = true,
      	disable = {},
      	updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      	persist_queries = false, -- Whether the query persists across vim sessions
      	keybindings = {
      		toggle_query_editor = "o",
      		toggle_hl_groups = "i",
      		toggle_injected_languages = "t",
      		toggle_anonymous_nodes = "a",
      		toggle_language_display = "I",
      		focus_language = "f",
      		unfocus_language = "F",
      		update = "R",
      		goto_node = "<cr>",
      		show_help = "?",
      	},
      },
    })
  end,
}

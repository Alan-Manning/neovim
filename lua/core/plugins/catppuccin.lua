return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local catppuccin = require("catppuccin")

    catppuccin.setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {     -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
      term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false,             -- dims the background color of inactive window
        shade = "light",
        percentage = 1.00,           -- percentage of the shade to apply to the inactive window
      },
      no_italic = false,             -- Force no italic
      no_bold = false,               -- Force no bold
      no_underline = false,          -- Force no underline
      styles = {                     -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = {},               -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {
        all = {
          -- base colors in mocha palette
          -- rosewater = "#f5e0dc",
          -- flamingo = "#f2cdcd",
          -- pink = "#f5c2e7",
          -- mauve = "#cba6f7",
          -- red = "#f38ba8",
          -- maroon = "#eba0ac",
          -- peach = "#fab387",
          -- yellow = "#f9e2af",
          -- green = "#a6e3a1",
          -- teal = "#94e2d5",
          -- sky = "#89dceb",
          -- sapphire = "#74c7ec",
          -- blue = "#89b4fa",
          -- lavender = "#b4befe",
          -- text = "#cdd6f4",
          -- subtext1 = "#bac2de",
          -- subtext0 = "#a6adc8",
          -- overlay2 = "#9399b2",
          -- overlay1 = "#7f849c",
          -- overlay0 = "#6c7086",
          -- surface2 = "#585b70",
          -- surface1 = "#45475a",
          -- surface0 = "#313244",
          -- base = "#1e1e2e",
          -- mantle = "#181825",
          -- crust = "#11111b",

          -- Overriding to the oxocarbon colors
          rosewater = "#f5e0dc",
          flamingo = "#f2cdcd",
          pink = "#ff7eb6",  -- base0C
          mauve = "#ce55ff", --
          red = "#e05c5c",   --
          maroon = "#eba0ac",
          peach = "#ff6f00",
          yellow = "#f9e2af",
          green = "#42be65",    -- base0D
          teal = "#3ddbd9",     -- base08
          sky = "#82cfff",      -- base0F
          sapphire = "#74c7ec",
          blue = "#33b1ff",     -- base0B
          lavender = "#be95ff", --base0E
          text = "#ddedff",
          subtext1 = "#bac2de",
          subtext0 = "#a6adc8",
          overlay2 = "#9399b2",
          overlay1 = "#7f849c",
          overlay0 = "#6c7086",
          surface2 = "#585b70",
          surface1 = "#45475a",
          surface0 = "#313244",
          base = "#1e1e2e",
          mantle = "#181825",
          crust = "#11111b",

          -- -- this 16 colors are changed to onedark
          -- base = "#282c34",
          -- mantle = "#353b45",
          -- surface0 = "#3e4451",
          -- surface1 = "#545862",
          -- surface2 = "#565c64",
          -- text = "#ddedff",
          -- rosewater = "#b6bdca",
          -- lavender = "#c8ccd4",
          -- red = "#e06c75",
          -- peach = "#fbff00",
          -- yellow = "#e5c07b",
          -- green = "#00c8ff",
          -- teal = "#56b6c2",
          -- blue = "#61afef",
          -- mauve = "#ee00ff",
          -- flamingo = "#be5046",
          --
          -- -- now patching extra palettes
          -- maroon = "#e06c75",
          -- sky = "#ee00ff",
          --
          -- -- extra colors not decided what to do
          -- pink = "#F5C2E7",
          -- sapphire = "#74C7EC",
          --
          -- subtext1 = "#BAC2DE",
          -- subtext0 = "#A6ADC8",
          -- overlay2 = "#9399B2",
          -- overlay1 = "#7F849C",
          -- overlay0 = "#6C7086",
          --
          -- crust = "#11111B",

          -- python
          -- Normal text: #ddedff
          -- comment: #5a83a4
          -- String: #00c8ff
          -- Number: #fbff00
          -- keywords: #ee00ff
          -- Builtin: #fabc02
          -- Defonitions: #88e63c
          -- Instances: #ff3b18
        },
      },
      custom_highlights = function(C)
        return {

          CursorLine = { bg = C.base },
          CursorLineNr = { bg = C.base, fg = C.blue },
          LineNr = { bg = C.base, fg = C.surface1 },
          SignColumn = { bg = C.base, fg = C.surface1 },
          VertSplit = { fg = C.blue, bg = C.base },
          WinSeparator = { fg = C.blue, bg = C.base },
          ColorColumn = { bg = C.base },
          FloatBorder = { fg = C.blue, bg = C.base },
          NormalFloat = { fg = C.blue, bg = C.base },

          DiagnosticSignHint = { fg = C.teal, bg = C.base },
          DiagnosticSignInfo = { fg = C.sky, bg = C.base },
          DiagnosticSignWarn = { fg = C.yellow, bg = C.base },
          DiagnosticSignErrors = { fg = C.red, bg = C.base },
          DiagnosticSignError = { fg = C.red, bg = C.base },

          -- Syntax overrides
          -- spyder_Normal = "#ddedff",
          -- spyder_comment = "#5a83a4",
          -- spyder_String = "#00c8ff",
          -- spyder_Number = "#fbff00",
          -- spyder_keywords = "#ee00ff",
          -- spyder_Builtin = "#fabc02",
          -- spyder_Defonitions = "#88e63c",
          -- spyder_Instances = "#ff3b18",
          --
          comments = { fg = "#5a83a4" },    -- just comments
          Constant = { fg = C.peach },      -- (preferred) any constant
          String = { fg = "#00c8ff" },      -- a string constant: "this is a string"
          Character = { fg = C.teal },      --  a character constant: 'c', '\n'
          Number = { fg = "#fbff00" },      --   a number constant: 234, 0xff
          Float = { link = "Number" },      --    a floating point constant: 2.3e10
          Boolean = { fg = "#fabc02" },     --  a boolean constant: TRUE, false
          Identifier = { fg = C.flamingo }, -- (preferred) any variable name
          Function = { fg = "#88e63c" },    -- function name (also: methods for classes)
          Statement = { fg = C.mauve },     -- (preferred) any statement
          Conditional = { fg = "#ee00ff" }, --  if, then, else, endif, switch, etc.
          Repeat = { fg = "#ee00ff" },      --   for, do, while, etc.
          Label = { fg = C.sapphire },      --    case, default, etc.
          Operator = { fg = "#ee00ff" },    -- "sizeof", "+", "*", etc.
          Keyword = { fg = "#ee00ff" },     --  any other keyword
          Exception = { fg = "#ee00ff" },   --  try, catch, throw

          -- Nvim Tree overrides
          NvimTreeWinSeparator = { fg = C.blue, bg = C.base },
          NvimTreeNormal = { bg = C.base },
          NvimTreeCursorLine = { fg = C.text, bg = C.blue },

          -- code completions color changes term_colors
          CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
          CmpItemKindKeyword = { fg = C.base, bg = C.red },
          CmpItemKindText = { fg = C.base, bg = C.teal },
          CmpItemKindMethod = { fg = C.base, bg = C.blue },
          CmpItemKindConstructor = { fg = C.base, bg = C.blue },
          CmpItemKindFunction = { fg = C.base, bg = C.blue },
          CmpItemKindFolder = { fg = C.base, bg = C.blue },
          CmpItemKindModule = { fg = C.base, bg = C.blue },
          CmpItemKindConstant = { fg = C.base, bg = C.peach },
          CmpItemKindField = { fg = C.base, bg = C.green },
          CmpItemKindProperty = { fg = C.base, bg = C.green },
          CmpItemKindEnum = { fg = C.base, bg = C.green },
          CmpItemKindUnit = { fg = C.base, bg = C.green },
          CmpItemKindClass = { fg = C.base, bg = C.yellow },
          CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
          CmpItemKindFile = { fg = C.base, bg = C.blue },
          CmpItemKindInterface = { fg = C.base, bg = C.yellow },
          CmpItemKindColor = { fg = C.base, bg = C.red },
          CmpItemKindReference = { fg = C.base, bg = C.red },
          CmpItemKindEnumMember = { fg = C.base, bg = C.red },
          CmpItemKindStruct = { fg = C.base, bg = C.blue },
          CmpItemKindValue = { fg = C.base, bg = C.peach },
          CmpItemKindEvent = { fg = C.base, bg = C.blue },
          CmpItemKindOperator = { fg = C.base, bg = C.blue },
          CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
          CmpItemKindCopilot = { fg = C.base, bg = C.teal },

          -- Mason overrides
          MasonHeader = { fg = C.teal, bg = C.blue, style = { "bold" } },
          MasonHighlightBlock = { fg = C.base, bg = C.green },
          MasonHighlightSecondary = { fg = C.teal, bg = C.blue },
          MasonHighlightBlockBold = { fg = C.base, bg = C.teal, bold = true },
          MasonMuted = { fg = C.overlay0 },
          MasonMutedBlock = { bg = C.overlay0, fg = C.teal },
          MasonMutedBlockBold = { bg = C.yellow, fg = C.overlay0, bold = true },

          -- Telescope overrides
          TelescopePreviewTitle = { fg = C.base, bg = C.green },
          TelescopePreviewLine = { fg = C.green, bg = C.base },
          TelescopePromptTitle = { fg = C.base, bg = C.peach },
          TelescopePromptBorder = { fg = C.peach, bg = C.base },
          TelescopeResultsTitle = { fg = C.base, bg = C.blue },
          TelescopeBorder = { fg = C.blue, bg = C.base },
          TelescopeSelection = { fg = C.base, bg = C.peach },

          -- Gitsigns overrides
          GitSignsAdd = { fg = C.green, bg = C.base },     -- diff mode: Added line |diff.txt|
          GitSignsChange = { fg = C.yellow, bg = C.base }, -- diff mode: Changed line |diff.txt|
          GitSignsDelete = { fg = C.red, bg = C.base },    -- diff mode: Deleted line |diff.txt|
          GitSignsCurrentLineBlame = { fg = C.surface1, bg = C.base },
          GitSignsAddPreview = { fg = C.green, bg = C.base } or { link = "DiffAdd" },
          GitSignsDeletePreview = { fg = C.red, bg = C.base } or { link = "DiffDelete" },

          -- treesitter color changeDiagnosticSignOk                                                󰀫 Variable │nction names
          --
          -- python
          -- Normal text: #ddedff
          -- comment: #5a83a4
          -- String: #00c8ff
          -- Number: #fbff00
          -- keywords: #ee00ff
          -- Builtin: #fabc02
          -- Defonitions: #88e63c
          -- Instances: #ff3b18
          ["@variable.python"] = { fg = "#ddedff", style = {} },

          ["@comment.python"] = { fg = "#5a83a4", style = {} },

          ["@string.python"] = { fg = "#00c8ff", style = {} },
          ["@string_content.python"] = { fg = "#00c8ff", style = {} },
          ["@string.documentation.python"] = { fg = "#00c8ff", style = {} },

          ["@float.python"] = { fg = "#fbff00", style = {} },
          ["@number.python"] = { fg = "#fbff00", style = {} },

          ["@repeat.python"] = { fg = "#ee00ff", style = {} },           -- for statement
          ["@keyword.operator.python"] = { fg = "#ee00ff", style = {} }, -- for statement
          ["@keyword.function.python"] = { fg = "#ee00ff", style = {} }, -- for def of functions
          ["@include.python"] = { fg = "#ee00ff", style = {} },          -- for imports

          ["@function.builtin.python"] = { fg = "#fabc02", style = {} }, -- for builtin functions

          ["@function.python"] = { fg = "#88e63c", style = {} },         -- for function names

          ["@variable.builtin.python"] = { fg = "#ff3b18", style = {} }, -- for self of function
        }
      end,
      integrations = {
        -- barbecue = {
        --   dim_dirname = true, -- directory name is dimmed by default
        --   bold_basename = true,
        --   dim_context = false,
        --   alt_background = false,
        -- },
        cmp = true,
        dashboard = true,
        dap = {
          enabled = true,
          enable_ui = true, -- enable nvim-dap-ui
        },
        gitsigns = true,
        harpoon = true,
        mason = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "bold" },
            hints = {},
            warnings = {},
            information = {},
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
        nvimtree = true,
        telescope = {
          enabled = true,
        },
        treesitter = true,
        rainbow_delimiters = true,
        which_key = true,
        window_picker = true,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}

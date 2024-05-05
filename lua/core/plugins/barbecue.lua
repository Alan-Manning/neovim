return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  -- opts = {
  --   -- configurations go here
  --   -- theme = "catppuccin"
  --
  -- },
  config = function()
    local C = require("catppuccin.palettes").get_palette("mocha")
    require("barbecue").setup({
      theme = {
        -- this highlight is used to override other highlights
        -- you can take advantage of its `bg` and set a background throughout your winbar
        -- (e.g. basename will look like this: { fg = "#c0caf5", bold = true })
        normal = { bg = C.base, fg = C.subtext1 },

        -- these highlights correspond to symbols table from config
        ellipsis = { fg = C.overlay1 },
        separator = { fg = C.overlay1 },
        modified = { fg = C.overlay1 },

        -- these highlights represent the _text_ of three main parts of barbecue
        dirname = { fg = C.overlay1 },
        basename = { bold = true },
        context = {},

        -- Same keys as navic
        context_file = { fg = C.blue },
        context_module = { fg = C.blue },
        context_namespace = { fg = C.blue },
        context_package = { fg = C.blue },
        context_class = { fg = C.yellow },
        context_method = { fg = C.blue },
        context_property = { fg = C.green },
        context_field = { fg = C.green },
        context_constructor = { fg = C.blue },
        context_enum = { fg = C.green },
        context_interface = { fg = C.yellow },
        context_function = { fg = C.blue },
        context_variable = { fg = C.flamingo },
        context_constant = { fg = C.peach },
        context_string = { fg = C.green },
        context_number = { fg = C.peach },
        context_boolean = { fg = C.peach },
        context_array = { fg = C.blue },
        context_object = { fg = C.blue },
        context_key = { fg = C.flamingo },
        context_null = { fg = C.peach },
        context_enum_member = { fg = C.red },
        context_struct = { fg = C.blue },
        context_event = { fg = C.blue },
        context_operator = { fg = C.blue },
        context_type_parameter = { fg = C.blue },
      }
    })
  end
}

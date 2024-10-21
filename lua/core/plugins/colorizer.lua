return {
  "NvChad/nvim-colorizer.lua", -- This is for making hex codes show thier color.
  ft = { "html", "css", "htmldjango", "lua" },
  config = function()
    require("colorizer").setup {
      filetypes = { "*" },
      user_default_options = {
        RGB = true,          -- #RGB hex codes
        RRGGBB = true,       -- #RRGGBB hex codes
        names = false,       -- "Name" codes like Blue or blue
        RRGGBBAA = true,     -- #RRGGBBAA hex codes
        rgb_fn = true,       -- CSS rgb() and rgba() functions
        hsl_fn = true,       -- CSS hsl() and hsla() functions
        css = true,          -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,       -- Enable all CSS *functions*: rgb_fn, hsl_fn
        tailwind = "both",     -- Enable tailwind colors
        mode = "background", -- Set the display mode. Available modes: foreground, background, virtualtext
        always_update = false
        -- virtualtext = "■",

      },
      -- buftypes = {},
    }
  end,
}

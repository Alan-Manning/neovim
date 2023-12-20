return {
	"norcalli/nvim-colorizer.lua", -- This is for making hex codes show thier color.
  cmd = { "Colorizer" },
	config = function()
    local colorizer = require("colorizer")
    colorizer.setup()
  end,
}

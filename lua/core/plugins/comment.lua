return {
 "numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
    local comment = require("Comment")
    local ft = require("Comment.ft")
    ft.set("ini", ";%s")
    comment.setup()
  end
}


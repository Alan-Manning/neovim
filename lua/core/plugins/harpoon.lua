return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    require("telescope").load_extension('harpoon')

    vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "harpoon add file" })
    vim.keymap.set("n", "<leader>hm", ":Telescope harpoon marks <CR>", { desc = "harpoon quick menu" })

    vim.keymap.set("n", "<leader>hp", ui.nav_next, { desc = "harpoon next" })
    vim.keymap.set("n", "<leader>hn", ui.nav_prev, { desc = "harpoon prev" })

    vim.keymap.set("n", "<leader>h1", function() ui.nav_file(1) end, { desc = "harpoon file 1" })
    vim.keymap.set("n", "<leader>h2", function() ui.nav_file(2) end, { desc = "harpoon file 2" })
    vim.keymap.set("n", "<leader>h3", function() ui.nav_file(3) end, { desc = "harpoon file 3" })
    vim.keymap.set("n", "<leader>h4", function() ui.nav_file(4) end, { desc = "harpoon file 4" })

  end
}

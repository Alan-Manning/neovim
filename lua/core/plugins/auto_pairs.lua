return {
  "windwp/nvim-autopairs",
  dependencies = {
    -- "nvim-treesitter/nvim-treesitter",
    "hrsh7th/nvim-cmp",
  },
	event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")
    -- local Rule = require('nvim-autopairs.rule')

    autopairs.setup({
      check_ts = true,
      ts_config = {
        lua = {"string"},
        javascript = {"template_string"},
      },
      disable_filetype = {"TelescopePrompt", "vim"},

    })

   --  local ts_conds = require('nvim-autopairs.ts-conds')
   -- -- press % => %% only while inside a comment or string
   --  autopairs.add_rules({
   --    Rule("%", "%", "lua")
   --      :with_pair(ts_conds.is_ts_node({'string','comment'})),
   --    Rule("$", "$", "lua")
   --      :with_pair(ts_conds.is_not_ts_node({'function'}))
   --  })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done()
    )


  end
}

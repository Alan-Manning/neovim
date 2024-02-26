return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",         -- source for text in buffer
    "hrsh7th/cmp-path",           -- source for file system paths
    "hrsh7th/cmp-cmdline",        -- source for cmdline
    "L3MON4D3/LuaSnip",           -- snippet engine
    "saadparwaiz1/cmp_luasnip",   -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful snippets
    "onsails/lspkind.nvim",       -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    --custom luasnip snippet for python docstring in numpy format
    local s = luasnip.snippet
    local t = luasnip.text_node
    local i = luasnip.insert_node

    luasnip.add_snippets("python", {
      s("docstring", {
        t('"""docstring short line. """'),
      }),
    })

    luasnip.add_snippets("python", {
      s("plot", {
        t({'title = "figure_title"',
          'fig = plt.figure(title)',
          'plt.clf()',
          'rows = 7',
          'cols = 6',
          'grid = plt.GridSpec(',
          '    rows, cols, top=0.97, bottom=0.03, left=0.05, right=0.99, hspace=0.19, wspace=0.17',
          ')',
          '',
          'ax_dict = {}',
          'for row in range(rows):',
          '    for col in range(cols):',
          '        ax_dict[f"{row}_{col}"] = plt.subplot(grid[row, col])',
          '',
          'ax_dict["0_0"].set_xlable("x_lab     (unit)")',
          'ax_dict["0_0"].set_ylable("y_lab     (unit)")',
          'ax_dict["0_0"].set_title("Title of plot")',
        }),
      }),
    })



    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(), --({ behavior = cmp.SelectBehavior, count = 1 }) next suggestion
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-d>"] = cmp.mapping.open_docs(-4),  -- open documentation for completion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        -- ["<C-i>"] = cmp.mapping.complete(), -- show completion suggestions !!! this now fucks with tab and thats not on !!!

        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({ -- order of the completions
        { name = "nvim_lsp" },    -- lsp sources
        { name = "luasnip" },     -- snippets
        { name = "buffer" },      -- text within current buffer
        { name = "path" },        -- file system paths
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 60,
          ellipsis_char = "...",
        }),
      },
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      sources = cmp.config.sources({
        { name = "cmdline" },
      }, {
        { name = "path" },
      }),
      mapping = cmp.mapping.preset.cmdline({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
      }),
    })
  end,
}

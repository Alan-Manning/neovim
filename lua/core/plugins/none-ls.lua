return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")

    local code_actions = null_ls.builtins.code_actions
    local completion = null_ls.builtins.completion
    local diagnostics = null_ls.builtins.diagnostics
    local formatting = null_ls.builtins.formatting
    local hover = null_ls.builtins.hover

    null_ls.setup({
      -- sources = my_sources,
      sources = {
        -- General
        code_actions.refactoring,
        hover.dictionary,

        -- ReStucuredText
        diagnostics.rstcheck.with({
          filetypes = { "rst" },
        }),

        -- Python
        -- diagnostics.ruff,
        -- diagnostics.ruff.with({
        -- 	filetypes = { "python" },
        -- }),
        diagnostics.mypy.with({
          filetypes = { "python" },
        }),
        -- formatting.ruff,
        -- formatting.ruff.with({
        -- 	filetypes = { "python" },
        -- }),
        formatting.black.with({
          filetypes = { "python" },
        }),
        formatting.isort.with({
          filetypes = { "python" },
        }),
        formatting.docformatter,
        -- formatting.docformatter.with({
        -- 	filetypes = { "python" },
        -- }),

        -- Lua
        formatting.stylua.with({
          filetypes = { "lua" },
        }),

        -- YAML
        formatting.yamlfix,
        -- formatting.yamlfix.with({
        --   filetypes = { "yaml" },
        -- }),

        -- Javascript
        diagnostics.eslint_d,

        completion.spell.with({
          filetypes = { "md", "rst" },
        }),
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      vim.lsp.buf.format({ timeout_ms = 10000 })
    end, { desc = "Format File" })
  end,
}
--
-- Supported source(s)
-- * diagnostics: bandit | flake8 | mypy | pycodestyle | pydocstyle | pylama | pylint | pyproject_flake8 | ruff | semgrep | vulture
-- * formatting: autoflake | autopep8 | black | blackd | blue | docformatter | dprint | isort | isortd | pyflyby | pyink | reorder_python_imports | ruff | ruff_format | usort | yapf
-- * code_actions: refactoring

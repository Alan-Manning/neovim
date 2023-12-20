return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "nvimdev/lspsaga.nvim",
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }

    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      -- opts.desc = "See available code actions"
      -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions, in visual mode will apply to selection -- LSPSAGA

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      -- opts.desc = "Show documentation for what is under cursor"
      -- keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "<leader>k", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor -- LSPSAGA

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    local on_attach_python_specific = function (client, bufnr)
      -- client.server_capabilities.documentFormattingProvider = false
      -- client.server_capabilities.hoverProvider = false
      -- client.server_capabilities.renameProvider = false

      on_attach(client, bufnr)
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure css server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure yaml server
    lspconfig["yamlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure python server
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- -- configure python server
    -- lspconfig["pylsp"].setup({
    --   capabilities = capabilities,
    --   settings = {
    --     pylsp = {
    --       plugins = {
    --         pylint = {
    --
    --         },
    --         pycodestyle = {
    --           ignore = {
    --             "E121", -- continuation line under-indented for hanging indent
    --             "E123", -- closing bracket does not match indentation of opening brackets line
    --             "E124", -- closing bracket does not match visual indentation
    --             "E126", -- continuation line over-indented for hanging indent
    --             "E127", -- continuation line over-indented for visual indent
    --             "E128", -- continuation line under-indented for visual indent
    --             "E201", -- whitespace after "[", "("
    --             "E202", -- whitespace before "]", ")"
    --             "E203", -- whitespace before ":"
    --             "E221", -- multiple spaces before operator
    --             "E226", -- missing whitespace around arithmetic operator
    --             "E228", -- missing whitespace around modulo operator
    --             "E231", -- mising whitespace after ","
    --             "E225", -- missing whitespace around operator
    --             "E241", -- multiple spaces after ","
    --             "E261", -- atleat two spaces before inline comment
    --             "E262", -- inline comment should start with '# '
    --             "E303", -- t
    --             "E501", -- line too long
    --             "E741", -- ambigous variable name
    --             "W503", -- line break before binary operator
    --
    --           },
    --           maxLineLength = 100
    --         },
    --       }
    --     }
    --   },
    --   on_attach = on_attach_python_specific,
    --   -- on_attach = on_attach,
    -- })

    -- configure rust server
    lspconfig["rust_analyzer"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

  end,
}

return {
	"wookayin/semshi",
	ft = "python",
	build = ":UpdateRemotePlugins",
	version = "*", -- Recommended to use the latest release
	init = function() -- example, skip if you're OK with the default config
		vim.g["semshi#error_sign"] = false
    vim.g["semshi#excluded_hl_groups"] = {}

	end,
	config = function()

		-- python
		-- Normal text: #ddedff
		-- comment: #5a83a4
		-- String: #00c8ff
		-- Number: #fbff00
		-- keywords: #ee00ff
		-- Builtin: #fabc02
		-- Defonitions: #88e63c
		-- Instances: #ff3b18

		-- Setting up an autogroup and autocmd.
		local semshi_custom_highlights = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd(
			{ "BufEnter" },
			{
        pattern = { "*.py" },
        group = semshi_custom_highlights,
				callback = function()
          vim.cmd([[set colorcolumn=80]])

          vim.cmd([[highlight semshiLocal           ctermfg=209 guifg=#ddedff]])
          vim.cmd([[highlight semshiGlobal          ctermfg=214 guifg=#ddedff]])
          vim.cmd([[highlight semshiImported        ctermfg=214 guifg=#ddedff]])
          vim.cmd([[highlight semshiParameter       ctermfg=117 guifg=#BBDBFF]])
          vim.cmd([[highlight semshiParameterUnused ctermfg=75  guifg=#5fafff cterm=underline gui=underline]])
          vim.cmd([[highlight semshiFree            ctermfg=218 guifg=#ffafd7]])
          vim.cmd([[highlight semshiBuiltin         ctermfg=207 guifg=#fabc02]])
          vim.cmd([[highlight semshiAttribute       ctermfg=49  guifg=#88e63c]])
          vim.cmd([[highlight semshiSelf            ctermfg=249 guifg=#ff3b18]])
          vim.cmd([[highlight semshiUnresolved      ctermfg=226 guifg=#d70000 cterm=underline gui=underline]])
          vim.cmd([[highlight semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#1a72bb]])

          vim.cmd([[highlight semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000]])
          vim.cmd([[highlight semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000]])

          -- vim.cmd([[highlight semshiLocal           ctermfg=209 guifg=#BBDBFF]])
          -- vim.cmd([[highlight semshiGlobal          ctermfg=214 guifg=#BBDBFF]])
          -- vim.cmd([[highlight semshiImported        ctermfg=214 guifg=#ddedff]])
          -- vim.cmd([[highlight semshiParameter       ctermfg=117 guifg=#BBDBFF]])
          -- vim.cmd([[highlight semshiParameterUnused ctermfg=75  guifg=#5fafff cterm=underline gui=underline]])
          -- vim.cmd([[highlight semshiFree            ctermfg=218 guifg=#ffafd7]])
          -- vim.cmd([[highlight semshiBuiltin         ctermfg=207 guifg=#fabc02]])
          -- vim.cmd([[highlight semshiAttribute       ctermfg=49  guifg=#9BCAF9]])
          -- vim.cmd([[highlight semshiSelf            ctermfg=249 guifg=#ff3b18]])
          -- vim.cmd([[highlight semshiUnresolved      ctermfg=226 guifg=#d70000 cterm=underline gui=underline]])
          -- vim.cmd([[highlight semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#1a72bb]])
          --
          -- vim.cmd([[highlight semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000]])
          -- vim.cmd([[highlight semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000]])
				end,
			}
		)

  end,
}

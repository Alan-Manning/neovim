return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = { --[[ things you want to change go here]]
  },
  config = function()
    local toggleterm = require("toggleterm")
    local mocha = require("catppuccin.palettes").get_palette("mocha")


    -- Setting the shell to powershell options
    local powershell_options = {
      shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
      shellcmdflag =
      "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
      shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
      shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
      shellquote = "",
      shellxquote = "",
    }
    -- Applying the shell options
    for option, value in pairs(powershell_options) do
      vim.opt[option] = value
    end

    -- Auto command to remove sign column on terminal
    vim.api.nvim_create_autocmd("TermOpen", {
      callback = function()
        vim.cmd [[setlocal signcolumn=no]]
      end,
      group = vim.api.nvim_create_augroup("lsp_document_format", { clear = true }),
    })

    toggleterm.setup({
      size = 100,
      open_mapping = [[<c-t>]],
      hide_numbers = true,
      -- shade_filetypes = {},
      start_in_insert = true,
      insert_mappings = true,
      direction = "vertical", -- "vertical", "float"
      highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        Normal = {
          guibg = mocha.base,
        },
        NormalFloat = {
          guibg = mocha.base
        },
        FloatBorder = {
          guibg = mocha.base,
          guifg = mocha.blue,
        },
      },
      float_opts = {
        border = "none", -- "double",
        width = function()
          return math.floor(vim.o.columns * 0.7)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.9)
        end,
        winblend = 3,
      },
      -- winbar = {
      -- 	enabled = true,
      -- 	name_formatter = function(term) --  term: Terminal
      -- 		return term.name
      -- 	end,
      -- },
    })

    -- Setting the keymaps

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jf", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    local Terminal = require("toggleterm.terminal").Terminal

    local python = Terminal:new({ cmd = "ipython", direction = "vertical", name = "ipython REPL" })

    function _PYTHON_TOGGLE()
      python:toggle()
    end

    function _RUN_FILE_IN_IPYTHON()
      -- local filename_and_path = vim.api.nvim_buf_get_name(0)
      local file_path = vim.fn.expand("%:p:h")
      local file_name = vim.fn.expand("%:p:t")
      local cd_cmd = '%cd "' .. file_path .. '"'
      local run_cmd = '%run "' .. file_name .. '"'
      require("toggleterm").exec(cd_cmd)
      require("toggleterm").exec(run_cmd)
    end

    -- GET THE VISUAL LINES AS A TABLE
    local function get_visual_selection()
      local vpos = vim.fn.getpos("v")
      local begin_pos = { row = vpos[2], col = vpos[3] - 1 }

      local cursor = vim.api.nvim_win_get_cursor(0)
      local end_pos = { row = cursor[1], col = cursor[2] }

      local vis_range = {}

      if (begin_pos.row < end_pos.row) or ((begin_pos.row == end_pos.row) and (begin_pos.col <= end_pos.col)) then
        vis_range["start"] = begin_pos
        vis_range["end"] = end_pos
      else
        vis_range["start"] = end_pos
        vis_range["end"] = begin_pos
      end

      local n_lines = math.abs(vis_range["end"]["row"] - vis_range["start"]["row"]) + 1
      local lines = vim.api.nvim_buf_get_lines(0, vis_range["start"]["row"] - 1, vis_range["end"]["row"], false)

      lines[1] = string.sub(lines[1], vis_range["start"]["col"], -1)
      if n_lines == 1 then
        lines[n_lines] = string.sub(lines[n_lines], 1, vis_range["end"]["col"] - vis_range["start"]["col"] + 1)
      else
        lines[n_lines] = string.sub(lines[n_lines], 1, vis_range["end"]["col"])
      end
      return lines
    end

    -- Send lines to ipython without wierd lines inbetween every line and without
    -- executing each line individually. This will just get each line and then
    -- send them all as one as its written in the py file.
    function _SEND_VIS_SELECTION_TO_IPYTHON()
      -- get each line in visual selection as table elements.
      local message_table = get_visual_selection()
      -- concatinate each table element into one string each element seperated by a new line char.
      local concat_message = table.concat(message_table, "\n")
      require("toggleterm").exec(concat_message)
    end

    -- Set keymaps to open terminal
    vim.keymap.set(
      "n",
      "<leader>th",
      "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
      { desc = "Open term horizontal" }
    )

    vim.keymap.set(
      "n",
      "<leader>tv",
      "<cmd>ToggleTerm size=80 direction=vertical<cr>",
      { desc = "Open term vertical" }
    )

    vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Open term float" })
    vim.keymap.set("n", "<leader>tq", "<cmd>ToggleTerm quit<cr>", { desc = "quit term float" })

    vim.keymap.set("n", "<leader>ipy", "<cmd>lua _PYTHON_TOGGLE()<CR>", { desc = "launch ipython console" })

    vim.keymap.set(
      "v",
      "<F9>",
      "<cmd>'<,'>lua _SEND_VIS_SELECTION_TO_IPYTHON()<CR><cmd>TermExec cmd=<space><CR>",
      { desc = "Term send Visual Line" }
    )

    vim.keymap.set(
      "n",
      "<F9>",
      "<cmd>ToggleTermSendCurrentLine<CR><cmd>TermExec cmd=<space><CR>",
      { desc = "term run current line" }
    )
    vim.keymap.set(
      "n",
      "<F5>",
      "<cmd>lua _RUN_FILE_IN_IPYTHON()<CR><cmd>TermExec cmd=<space><CR>",
      { desc = "term run current file" }
    )
  end,
}

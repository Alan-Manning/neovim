return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    local dappython = require("dap-python")
    -- The Mason install of debugpy
    -- Not currently using that atm dappython.setup('~/AppData/local/nvim-data/mason/packages/debugpy/venv/Scripts/python')

    -- The system install of python
    dappython.setup('~/AppData/local/Programs/Python/Python38/python')

  end
}

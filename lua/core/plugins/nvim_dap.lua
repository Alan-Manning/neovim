return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
	},
	config = function()
		local dapui = require("dapui")
		dapui.setup() -- dapui setup first to make it nice

		local dap = require("dap")

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch In VirtualEnv",
				justMyCode = false,
				program = "${file}",
				pythonPath = function()
					-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
					-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
					-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
					local cwd = vim.fn.getcwd()
					if vim.fn.executable(cwd .. "/venv/Scripts/python") == 1 then
						return cwd .. "/venv/bin/python"
					elseif vim.fn.executable(cwd .. "/.venv/Scripts/python") == 1 then
						return cwd .. "/.venv/bin/python"
					-- elseif os.getenv("VIRTUAL_ENV") then
					--   return os.getenv("VIRTUAL_ENV") .. "Scripts/python"
					else
						local command = os.getenv("VIRTUAL_ENV") .. "\\Scripts\\python"
						print(command)
						return command
						-- else
						-- 	return "/usr/bin/python"
					end
				end,
			},
			{
				type = "python",
				request = "launch",
				name = "Launch In IPython",
				justMyCode = false,
				program = "${file}",
				pythonPath = function()
					local command = "~/AppData/Local/Programs/Python/Python312/Scripts/ipython3"
					print(command)
					return command
				end,
			},
		}

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- Start
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>", { desc = "Dap Continue" })

		-- Toggle breakpoint
		vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>", { desc = "Toggle Dap Breakpoint" })

		-- Stop
		vim.keymap.set("n", "<Leader>dt", ":DapTerminate<CR>", { desc = "Dap Terminate" })

		-- Control step
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>", { desc = "Dap Step Over" })
		vim.keymap.set("n", "<leader>di", ":DapStepInto<CR>", { desc = "Dap Step Into" })
		vim.keymap.set("n", "<leader>dx", ":DapStepOut<CR>", { desc = "Dap Step Out" })

		-- Restart
		vim.keymap.set("n", "<leader>drs", ":DapRestartFarme<CR>", { desc = "Dap Restart Frame" })
	end,
}

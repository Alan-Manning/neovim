-- Navigate vim panes better
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

-- Exit inset mode with jf
-- vim.keymap.set('i', 'jf', '<Esc>')

-- Move to start and end of line nicer
vim.keymap.set("n", "L", "$", { desc = "Move to line end" })
vim.keymap.set("n", "H", "^", { desc = "Move to line start" })

-- Search
vim.keymap.set("n", "<leader>cl", ":nohlsearch<CR>", { desc = "clear search" })
vim.keymap.set(
	"n",
	"<leader>sr",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left><Left>]],
	{ desc = "Search & Replace on word" }
)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "+Height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "-Height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "-Width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "+Width" })

-- Navigate buffers
vim.keymap.set("n", "<C-PageUp>", ":bnext<CR>", { desc = "Buffer Next" })
vim.keymap.set("n", "<C-PageDown>", ":bprevious<CR>", { desc = "Buffer Prev" })

-- Move text up and down
vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv", { desc = "Move Text Down" })
vim.keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv", { desc = "Move Text Up" })

-- Better indent
vim.keymap.set("v", ">", ">gv", { desc = "indent selection" })
vim.keymap.set("v", "<", "<gv", { desc = "deindent selection" })
vim.keymap.set("v", "<Tab>", ">gv", { desc = "indent selection" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "deindent selection" })

-- Keep Cursor in middle of screen
-- when half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "-Half Page Jump" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "+Half Page Jump" })
-- when next/prev search term
vim.keymap.set("n", "n", "nzzzv", { desc = "Next Search Item" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev Search Item" })

-- Don't put overwritten text in buffer on paste
vim.keymap.set("x", "<leader><C-p>", '"_dp', { desc = "Paste Over" })

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank motion to clipboard" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank motion to clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })
-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste after from clipboard" })
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste before from clipboard" })

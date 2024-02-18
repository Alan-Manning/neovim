vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.opt.guicursor = "" -- fat cursor, i dont like it

vim.mousemoveevent = true

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.termguicolors = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.cmd [[ set noswapfile ]]

-- Line numbers
vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes" -- doesnt shift around text when signcolumn shows things

-- Line spaacing
vim.opt.linespace = 0

-- Stop scrolling at end of page
vim.opt.scrolloff = 10

-- Dont show end of buffer characters
vim.opt.fillchars:append('eob: ')

-- Searching options
vim.opt.incsearch = true -- show incrimental search as you type
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

vim.opt.updatetime = 50


-- Split windows open to right and bottom to autotab into the sensible window
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom



-- vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
--   pattern = {"*.py", "*.lua"},
--   -- command = "echo 'Entering a py or lua file'",
--    command = ":set colorcolumn=80 <CR>",
-- })

-- Create autocomand that runs whenever python runs
--vim.api.nvim_create_autocmd({ "python", "lua" }, {
--    command = ":set colorcolumn=80 <CR>",
--})

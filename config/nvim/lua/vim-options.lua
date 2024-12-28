-- Generic Settings
-- vim.cmd("")
vim.opt.shell = "/bin/zsh"
vim.opt.fileformat = "unix"

-- Indentation and Tabs
-- vim.cmd("set smartindent")
vim.opt.expandtab = true -- expand tabs to spaces
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.cmd("set formatoptions+=n") -- support for numbrered/bullet lits

-- Layout Choices
vim.opt.wrap = false -- do not wrap lines
vim.opt.virtualedit = "block" -- allow virtual edits in visual block
vim.opt.showmatch = true -- brackets/braces matching
vim.opt.visualbell = true -- disables flashing bell

-- Search and History
vim.opt.hlsearch = true -- highlight search terms
vim.opt.smartcase = true -- search string with mixed case will be sensitive
vim.opt.ignorecase = true -- ignore case normally while searching
vim.opt.history = 1000

-- Text Wrapping
vim.opt.colorcolumn = { "80" } -- show vertical line at line 80, 160

-- Show invisible chars
vim.opt.list = true
vim.cmd("set listchars=tab:▸-,trail:·,nbsp:*")
vim.opt.number = true
-- vim.wo.relativenumber = true

vim.cmd("set undodir=~/.undodir/")
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

---- FOLDS
---
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart = 1
vim.opt.foldnestmax = 5
-- vim.opt.foldcolumn = "0"

-- za: toggle fold at cursor
-- zM: close all
-- zR: open all
-- zk, zj: fold navigation like k, j


---- KEYMAPS
-- Movement
vim.keymap.set("n", "<leader>n", ":bnext<cr>")
vim.keymap.set("n", "<leader>p", ":bprevious<cr>")
vim.keymap.set("n", "<leader>`", ":bd")

vim.keymap.set("n", "<leader><leader>", "<C-w><C-w>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- fold
vim.keymap.set("n", "<leader>z", "za")
vim.keymap.set("n", "<leader>Z", "zR")

-- clear highlight
vim.keymap.set("n", "<leader><space>", ":nohls<cr>")

-- remove help F1 mistake
vim.keymap.set("i", "<F1>", "<ESC>")
vim.keymap.set("v", "<F1>", "<ESC>")
vim.keymap.set("n", "<F1>", "<ESC>")

---- UI stuff
-- default split dir
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.diagnostic.config({
	virtual_text = {
		source = true,
		format = function(diagnostic)
			if diagnostic.user_data and diagnostic.user_data.code then
				return string.format("%s %s", diagnostic.user_data.code, diagnostic.message)
			else
				return diagnostic.message
			end
		end,
	},
	signs = true,
	float = {
		header = "Diagnostics",
		source = true,
		border = "rounded",
	},
})

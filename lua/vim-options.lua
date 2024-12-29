vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard+=unnamedplus")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Display line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- Allow navigating between panes using only ctrl
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to the left pane" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to the pane below" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to the pane above" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to the right pane" })

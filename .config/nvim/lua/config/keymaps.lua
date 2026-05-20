vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>r", ":source $MYVIMRC<CR>")

vim.keymap.set("n", "<leader>\\", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>")

vim.keymap.set("n", "<leader><Left>",  "<C-w>h")
vim.keymap.set("n", "<leader><Right>", "<C-w>l")
vim.keymap.set("n", "<leader><Up>",    "<C-w>k")
vim.keymap.set("n", "<leader><Down>",  "<C-w>j")

vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>j", "<C-w>j")

vim.keymap.set("n", "<leader>H", "<cmd>vertical resize -5<CR>")
vim.keymap.set("n", "<leader>L", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<leader>K", "<cmd>resize -5<CR>")
vim.keymap.set("n", "<leader>J", "<cmd>resize +5<CR>")

vim.keymap.set("n", "<leader><S-Left>",  "<cmd>vertical resize -5<CR>")
vim.keymap.set("n", "<leader><S-Right>", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<leader><S-Up>",    "<cmd>resize -5<CR>")
vim.keymap.set("n", "<leader><S-Down>",  "<cmd>resize +5<CR>")

require("config.explrfile")


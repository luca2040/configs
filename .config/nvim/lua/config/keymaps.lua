vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>r", ":source $MYVIMRC<CR>")

vim.keymap.set("n", "<leader>\\", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>-", "<cmd>split<CR>")

vim.keymap.set("n", "<leader><Left>", "<C-w>h")
vim.keymap.set("n", "<leader><Right>", "<C-w>l")
vim.keymap.set("n", "<leader><Up>", "<C-w>k")
vim.keymap.set("n", "<leader><Down>", "<C-w>j")
vim.keymap.set("n", "<leader>_", "<C-w>_")
vim.keymap.set("n", "<leader>|", "<C-w>|")
vim.keymap.set("n", "<leader>=", "<C-w>=")

vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>j", "<C-w>j")

vim.keymap.set("n", "<leader>H", "<cmd>vertical resize -5<CR>")
vim.keymap.set("n", "<leader>L", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<leader>K", "<cmd>resize -5<CR>")
vim.keymap.set("n", "<leader>J", "<cmd>resize +5<CR>")

vim.keymap.set("n", "<leader><S-Left>", "<cmd>vertical resize -5<CR>")
vim.keymap.set("n", "<leader><S-Right>", "<cmd>vertical resize +5<CR>")
vim.keymap.set("n", "<leader><S-Up>", "<cmd>resize -5<CR>")
vim.keymap.set("n", "<leader><S-Down>", "<cmd>resize +5<CR>")

vim.keymap.set("n", "dd", function()
	local line = vim.api.nvim_get_current_line()

	if line:match("^%s*$") then
		vim.cmd('normal! "_dd')
	else
		vim.cmd("normal! dd")
	end
end)

vim.keymap.set("i", "<F12>", "~")

local function format_buffer()
	local bufnr = vim.api.nvim_get_current_buf()
	local ft = vim.bo[bufnr].filetype

	if ft == "python" then
		local view = vim.fn.winsaveview()
		vim.cmd("write")
		vim.cmd("silent !black %")
		vim.cmd("edit!")
		vim.fn.winrestview(view)
		return
	end

	vim.lsp.buf.format()
end

-- lsp stuff
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.keymap.set("n", "<C-A-l>", format_buffer)
-- vim.keymap.set("n", "<C-A-l>", vim.lsp.buf.format)
-- vim.keymap.set("n", "<leader>r", vim.lsp.buf.format)
vim.keymap.set("n", "<C-s>", vim.diagnostic.goto_next)
vim.keymap.set("n", "<C-a>", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<C-p>", vim.lsp.buf.code_action)

require("config.explrfile")

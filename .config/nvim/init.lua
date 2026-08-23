vim.cmd([[
call plug#begin()

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' }
Plug 'stevearc/conform.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()
]])

-- imports
-- require("config.options")
require("config.keymaps")
require("config.theme")
require("plugins")
require("conform").setup({
	formatters_by_ft = {
		python = { "black" },
		gdscript = { "gdformat" },
	},
})
require("nvim-treesitter").install({ "python", "gdscript" })

-- numbering and stuff
-- vim.opt.clipboard="unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- tabbing
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.list = true
vim.opt.listchars = {
	tab = "→ ",
	trail = "·",
	nbsp = "␣",
}

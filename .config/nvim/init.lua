-- imports
-- require("config.options")
require("config.keymaps")
require("config.theme")
require("plugins")

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


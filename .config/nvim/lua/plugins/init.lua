vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/mg979/vim-visual-multi.git'
})

require("plugins.lualine")

-- vim visual multi keybinds
vim.g.VM_maps = {
    ["Add Cursor Down"] = "<C-j>",
    ["Add Cursor Up"] = "<C-k>",
}


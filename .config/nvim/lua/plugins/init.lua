vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim',
    'https://github.com/mg979/vim-visual-multi.git',
    'https://github.com/mason-org/mason.nvim.git',

    'https://github.com/hrsh7th/cmp-nvim-lsp.git',
    'https://github.com/hrsh7th/cmp-buffer.git',
    'https://github.com/hrsh7th/cmp-path.git',
    'https://github.com/hrsh7th/cmp-cmdline.git',
    'https://github.com/hrsh7th/nvim-cmp.git',

    'https://github.com/hrsh7th/cmp-vsnip.git',
    'https://github.com/hrsh7th/vim-vsnip.git',

    'https://github.com/nvim-lua/plenary.nvim.git',
    'https://github.com/nvim-telescope/telescope.nvim.git'
})

require("plugins.lualine")
require("plugins.mason")
require("plugins.nvimcmp")
require("plugins.vimlspconfig")
require("plugins.telescope")

-- vim visual multi keybinds
vim.g.VM_maps = {
    ["Add Cursor Down"] = "<C-j>",
    ["Add Cursor Up"] = "<C-k>",
}


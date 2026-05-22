local lsps = {
    {
        "lua_ls",
        capabilities = capabilities
    },
    {
        "clangd",
        {
            cmd = { "clangd" },
            filetypes = { "c", "cpp", "h", "hpp"},
            root_markers = { ".git", "compile_commands.json" },
        },
        capabilities = capabilities
    }
}

for _, lsp in pairs(lsps) do
    local name, config = lsp[1], lsp[2]
    vim.lsp.enable(name)
    if config then
        vim.lsp.config(name, config)
    end
end


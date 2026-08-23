local function set_python_path(command)
	local path = command.args
	local clients = vim.lsp.get_clients({
		bufnr = vim.api.nvim_get_current_buf(),
		name = "pyright",
	})
	for _, client in ipairs(clients) do
		if client.settings then
			client.settings.python =
				vim.tbl_deep_extend("force", client.settings.python --[[@as table]], { pythonPath = path })
		else
			client.config.settings =
				vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = path } })
		end
		client:notify("workspace/didChangeConfiguration", { settings = nil })
	end
end

-- ##########################################################################

local lsps = {
	{
		"lua_ls",
		{
			cmd = { "stylua", "--lsp" },
			filetypes = { "lua" },
			root_markers = { ".stylua.toml", "stylua.toml", ".editorconfig" },
		},
		capabilities = capabilities,
	},
	{
		"clangd",
		{
			cmd = { "clangd", "--header-insertion=never" },
			filetypes = { "c", "cpp" },
			root_markers = { ".git", "compile_commands.json" },
		},
		capabilities = capabilities,
	},
	{
		"pyright",
		{
			cmd = { "pyright-langserver", "--stdio" },
			filetypes = { "python" },
			root_markers = {
				"pyrightconfig.json",
				"pyproject.toml",
				"setup.py",
				"setup.cfg",
				"requirements.txt",
				"Pipfile",
				".git",
			},
			---@type lspconfig.settings.pyright
			settings = {
				python = {
					analysis = {
						autoSearchPaths = true,
						useLibraryCodeForTypes = true,
						diagnosticMode = "openFilesOnly",
						typeCheckingMode = "off",
					},
				},
			},
			on_attach = function(client, bufnr)
				vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightOrganizeImports", function()
					local params = {
						command = "pyright.organizeimports",
						arguments = { vim.uri_from_bufnr(bufnr) },
					}

					-- Using client.request() directly because "pyright.organizeimports" is private
					-- (not advertised via capabilities), which client:exec_cmd() refuses to call.
					-- https://github.com/neovim/neovim/blob/c333d64663d3b6e0dd9aa440e433d346af4a3d81/runtime/lua/vim/lsp/client.lua#L1024-L1030
					---@diagnostic disable-next-line: param-type-mismatch
					client.request("workspace/executeCommand", params, nil, bufnr)
				end, {
					desc = "Organize Imports",
				})
				vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightSetPythonPath", set_python_path, {
					desc = "Reconfigure pyright with the provided python path",
					nargs = 1,
					complete = "file",
				})
			end,
		},
		capabilities = capabilities,
	},
	{
		"zls",
		{
			cmd = { "zls" },
			filetypes = { "zig", "zir" },
			root_markers = { "zls.json", "build.zig", ".git" },
			workspace_required = false,
		},
	},
	{
		"gdscript",
		{
			cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
			filetypes = { "gdscript" },
			root_markers = { "project.godot", ".git" },
			workspace_required = true,
		},
		capabilities = capabilities,
	},
}

-- ##########################################################################

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "gdscript" },
	callback = function()
		vim.treesitter.start()
	end,
})

-- ##########################################################################

for _, lsp in pairs(lsps) do
	local name, config = lsp[1], lsp[2]
	vim.lsp.enable(name)
	if config then
		vim.lsp.config(name, config)
	end
end

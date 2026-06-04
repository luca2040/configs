require("mason").setup({
	ui = {
		check_outdated_packages_on_open = false,
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

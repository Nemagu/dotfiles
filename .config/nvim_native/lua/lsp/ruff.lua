vim.lsp.config("ruff", {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = {
		"pyproject.toml",
		"ruff.toml",
		".ruff.toml",
		".git",
	},
	init_options = {
		settings = {
			logLevel = "error",
		},
	},
})

vim.lsp.enable("ruff")

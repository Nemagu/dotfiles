vim.lsp.config("codebook", {
	cmd = { "codebook-lsp", "serve" },
	filetypes = {
		"c",
		"css",
		"gitcommit",
		"go",
		"haskell",
		"html",
		"java",
		"javascript",
		"javascriptreact",
		"lua",
		"markdown",
		"php",
		"python",
		"ruby",
		"rust",
		"swift",
		"toml",
		"text",
		"typescript",
		"typescriptreact",
		"zig",
	},
	root_markers = { ".git", "codebook.toml", ".codebook.toml" },
})

vim.lsp.enable("codebook")

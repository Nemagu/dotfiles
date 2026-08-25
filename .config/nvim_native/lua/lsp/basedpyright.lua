vim.lsp.config("basedpyright", {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },

	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		".git",
	},

	settings = {
		basedpyright = {
			diagnosticMode = "workspace",
			typeCheckingMode = "standard",
			autoSearchPaths = true,
			indexing = true,
			diagnosticSeverityOverrides = {
				reportUnusedImport = "none",
				reportUnusedVariable = "none",
				reportDuplicateImport = "none",
				reportMissingModuleSource = "none",
				reportGeneralTypeIssues = "warning",
				reportOptionalSubscript = "warning",
				reportOptionalMemberAccess = "warning",
				reportOptionalCall = "warning",
			},
			disableOrganizeImports = true,
		},
	},
})

vim.lsp.enable("basedpyright")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
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
              },
              disableOrganizeImports = true,
            },
          },
        },
      },
    },
  },
}

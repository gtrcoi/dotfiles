local yamlls_settings = {
  settings = {
    yaml = {
      format = {
        singleQuote = false,
      },
    },
  },
}
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      yamlls = yamlls_settings,
    },
  },
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd"
        }, -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.clangd.setup({
        cmd = {
          'clangd',
          '--background-index',
          '--clang-tidy',
          '--suggest-missing-includes',
          '--log=verbose'
        },
        init_options = {
          -- fallbackFlags = { '-std=c++17' },
        },
      })
    end
  }
}

return {
  {
    "vim-pandoc/vim-pandoc",
    dependencies = { "vim-pandoc/vim-pandoc-syntax" },
    init = function()
      -- 1. Prevent hijacking the filetype to "pandoc"
      vim.g["pandoc#filetypes#pandoc_markdown"] = 0

      -- 2. Allow pandoc features to work on standard markdown files
      vim.g["pandoc#filetypes#handled"] = { "markdown", "pandoc" }

      -- 3. Optional: Disable conceal if you want to see your ** and _ marks
      -- vim.g["pandoc#syntax#conceal#use"] = 0
    end,
    config = function()
      -- 4. The Autocmd to ensure pandoc syntax is used for markdown files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.cmd("set syntax=pandoc")
        end,
      })
    end,
  },
}

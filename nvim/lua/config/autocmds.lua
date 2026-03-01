-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_augroup("YamlFrontMatterFix", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = "YamlFrontMatterFix",
  pattern = { "*.yml", "*.yaml" },
  callback = function()
    local first_line = vim.fn.getline(1)

    if not first_line:match("^%s*%-%-%-") then
      vim.api.nvim_buf_set_lines(0, 0, 0, false, { "---" })
    end
  end,
  desc = "Safely inserts '---' marker at the start of a YAML file before saving",
})

-- -- godot tabs fix with :retab
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "gdscript",
--   callback = function()
--     vim.opt_local.expandtab = false -- Use actual tabs, not spaces
--     vim.opt_local.tabstop = 4 -- Visual width of a tab
--     vim.opt_local.shiftwidth = 4 -- Size of an indent
--   end,
-- })

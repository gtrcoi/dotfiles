vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamed,unnamedplus")
vim.cmd("set statusline=+%F")
vim.cmd("set nu")

vim.api.nvim_set_keymap("n", "x", '"_x', {noremap=true})
vim.api.nvim_set_keymap("n", "X", '"_X', {noremap=true})
vim.api.nvim_set_keymap("n", "<Del>", '"_x', {noremap=true})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {}
local opts = {}

require("lazy").setup(plugins, opts)

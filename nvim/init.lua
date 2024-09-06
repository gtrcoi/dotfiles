-- Editor options
local global = vim.g
local o = vim.opt

global.mapleader = " "

o.statusline = "%F %m"
o.number = true
o.relativenumber = true
o.clipboard = "unnamed,unnamedplus"
o.syntax = "on"
o.autoindent = true
o.cursorline = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.encoding = "UTF-8"
o.ruler = true
o.mouse = "a"
o.hidden = true
-- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
-- o.ttimeoutlen = 0 
o.wildmenu = true
o.showcmd = true
o.showmatch = true
o.inccommand = "split"
o.termguicolors = true

-- Send x to void
vim.api.nvim_set_keymap("n", "x", '"_x', {noremap=true})
vim.api.nvim_set_keymap("n", "X", '"_X', {noremap=true})
vim.api.nvim_set_keymap("n", "<Del>", '"_x', {noremap=true})

-- Lazy setup
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

require("lazy").setup("plugins")

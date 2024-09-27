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

vim.g.mapleader = " "

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end


-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Send x to void
vim.api.nvim_set_keymap("n", "x", '"_x', {noremap=true})
vim.api.nvim_set_keymap("n", "X", '"_X', {noremap=true})
vim.api.nvim_set_keymap("n", "<Del>", '"_x', {noremap=true})

-- Exit insert mode
-- map("i", "jk", "<ESC>")

-- NeoTree
map("n", "<leader>t", "<CMD>Neotree toggle<CR>")
-- map("n", "<leader>r", "<CMD>Neotree focus<CR>")
-- map('n', '<leader>t', ':Neotree filesystem reveal left toggle<CR>')

-- Telescope
map('n', '<leader>ff', "<CMD>Telescope find_files<CR>")
map('n', '<leader>fg', "<CMD>Telescope live_grep<CR>")
map('n', '<leader>fb', "<CMD>Telescope buffers<CR>")
map('n', '<leader>fh', "<CMD>Telescope help_tags<CR>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- LSP stuff
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gn', vim.diagnostic.goto_next, {})
vim.keymap.set({ 'n', 'v', }, '<leader>ca', vim.lsp.buf.code_action, {})

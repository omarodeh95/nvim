-- set leader key
vim.g.mapleader = " "


local keymap = vim.keymap


-- general keymap

--  Exit insert mode
-- keymap.set("i", "jk", "<ESC>")

-- hidh highlight
-- keymap.set("n", "<leader>hh", ":nohl<CR>")

-- protect reg when deleting a character 
-- keymap.set("n", "x", "_x")

-- increase and decrease numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- Window splitting
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertical
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontal
keymap.set("n", "<leader>se", "<C-w>=") -- make split equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split windo

-- Tabs navigation
keymap.set("n", "tn", ":tabnew<CR>") -- new tab
keymap.set("n", "tc", ":tabclose<CR>") -- close tab
keymap.set("n", "tt", ":tabn<CR>") -- next tab
keymap.set("n", "TT", ":tabp<CR>") -- prev tab
local function map_tabs()
  for i = 1, 9 do
    local key = 't' .. i
    local command = ':tabn ' .. i .. '<CR>'
    vim.api.nvim_set_keymap('n', key, command, { noremap = true, silent = true })
  end
end
map_tabs()


-- Toggle maximize window 
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")



-- telescope
keymap.set("n", "fs", "<cmd>Telescope find_files<cr>")
keymap.set("n", "ts", "<cmd>Telescope grep_string<cr>")

-- nvim tree
keymap.set("n", "ff", ":NvimTreeToggle<CR>")



-- Move lines up and down in normal, insert and visual mode
keymap.set('n', '<C-J>', ':m .+1<CR>==', { noremap = true, silent = true })
keymap.set('n', '<C-K>', ':m .-2<CR>==', { noremap = true, silent = true })
keymap.set('i', '<C-J>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
keymap.set('i', '<C-K>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
keymap.set('v', '<C-J>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
keymap.set('v', '<C-K>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

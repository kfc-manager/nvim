vim.g.mapleader = " " --global leader for keymaps

-- move text in visual block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- up

-- remove all split windows besides the active one
vim.keymap.set("n", "<leader>t", "<C-w>o")

-- replace every word which is equal to the one under the cusor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

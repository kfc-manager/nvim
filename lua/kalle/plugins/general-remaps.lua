vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move highlighted text down 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move highlighted text up

vim.keymap.set("n", "<leader>t", "<C-w>o")

-- replace every word which is similar to the word you are with the cursor on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) 

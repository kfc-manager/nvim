vim.keymap.set("n", "<leader>n", ":tabnew<CR>") -- open new tab
vim.keymap.set("n", "<leader>x", ":tabclose<CR>") -- close current tab
vim.keymap.set("n", "<leader>j", ":tabn<CR>") -- go to next tab
vim.keymap.set("n", "<leader>k", ":tabp<CR>") -- go to prvious tab

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move highlighted text down 
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move highlighted text up

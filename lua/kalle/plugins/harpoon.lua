local mark_status, mark = pcall(require, "harpoon.mark")
if not mark_status then
    print("couldn't load harpoon.mark")
    return
end

local ui_status, ui = pcall(require, "harpoon.ui")
if not ui_status then
    print("couldn't load harpoon.ui")
end

vim.keymap.set("n", "<leader>a", mark.add_file)

vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>j", ui.nav_next)
vim.keymap.set("n", "<leader>k", ui.nav_prev)

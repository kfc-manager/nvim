local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
    return
end

-- keymap to toggle tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIdentMarker guifg=#E5B567 ]])

nvimtree.setup({
    renderer = {
        icons = {
            glyphs = {
                folder = {
                    arrow_closed = ">", -- arrow when folder is closed
                    arrow_open = "v", -- arrow when folder is open
                },
            },
        },
    },
    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
})

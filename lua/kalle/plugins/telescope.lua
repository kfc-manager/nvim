local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
    print("couldn't load telescope")
    return
end

local actions_status, actions = pcall(require, "telescope.actions")
if not actions_status then
    print("couldn't load telescope.actions")
    return
end

-- telescope keymaps
vim.keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
        },
    },
})

-- telescope.load_extension("fzf")

local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
if not staus then
    print("couldn't find colorscheme tokyonight")
    return
end

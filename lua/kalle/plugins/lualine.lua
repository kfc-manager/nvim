local status, lualine = pcall(require, "lualine")
if not status then
    print("couldn't load lualine")
    return
end

lualine.setup({
    options = {
        theme = "tokyonight",
    },
})

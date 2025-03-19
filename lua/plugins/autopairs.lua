local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
    print("couldn't load autopairs")
    return
end

autopairs.setup{}

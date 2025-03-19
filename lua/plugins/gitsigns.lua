local status, gitsigns = pcall(require, "gitsigns")
if not status then
    print("couldn't load gitsigns")
    return
end

gitsigns.setup()


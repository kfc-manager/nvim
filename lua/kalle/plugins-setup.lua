-- auto install packer if not installed
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)

    -- plugin manager (packer)
    use("wbthomason/packer.nvim")

    -- lua functions that many plugins use
    use("nvim-lua/plenary.nvim")

    -- navigation
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- better sorting performance
    use({ "nvim-telescope/telescope.nvim", branck = "0.1.x" }) -- telescope
    use("theprimeagen/harpoon") -- tag files on a table for quick access

    -- visuals
    use("folke/tokyonight.nvim") -- colorscheme
    use("nvim-treesitter/nvim-treesitter", {run = "TSUpdate"})
    use("nvim-lualine/lualine.nvim") -- statusline
    use("kyazdani42/nvim-web-devicons") -- file icons

    -- auto completion
    use("windwp/nvim-autopairs") -- auto closing ({}, [], (), "", '', ``)
    use ("windwp/nvim-ts-autotag") -- autotags for html
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},
            {
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            {"williamboman/mason-lspconfig.nvim"},

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-nvim-lua"},

            -- Snippets
            {"L3MON4D3/LuaSnip"},
            {"rafamadriz/friendly-snippets"},
        },
    }

    if packer_bootstrap then
        require("packer").sync()
    end
end)

local lsp_status, lsp = pcall(require, "lsp-zero")
if not lsp_status then
    print("couldn't load lsp-zero")
    return
end

lsp.preset("recommended")

lsp.ensure_installed({
    "gopls", -- Go
    "tsserver", -- TypeScript
    "html", -- HTML 
    "cssls", -- CSS
    "dockerls", -- Docker
    "clangd", -- C
    "pylsp", -- Python
    "lua_ls", -- Lua
})

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    print("couldn't load cmp")
    return
end

local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), --show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

local go_status, go = pcall(require, "go")
if not go_status then
    print("couldn't load go.nvim")
end

go.setup({
    gofmt = "golines",
})

lsp.on_attach(
    function(client, bufnr)
        if client.name == "gopls" then
            vim.opt.tabstop = 2
            vim.opt.shiftwidth = 2
            local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
            vim.api.nvim_create_autocmd("BufWritePre", {
                --pattern = "*.go",
                --callback = function()
                    --require("go.format").goimport()
                --end,
                command = "GoFmt",
                group = format_sync_grp,
            })
        end
        lsp.default_keymaps({buffer = bufnr})
    end
)

lsp.setup()

local null_status, null_ls = pcall(require, "null-ls")
if not null_status then
    print("couldn't load null-ls")
    return
end

null_ls.setup({
    debug = false,
    sources = {
        null_ls.builtins.formatting.prettier,
    },
    on_attach = function (client, bufnr)
        if client.supports_method("textDocument/formatting") then
            -- format on save
            vim.opt.tabstop = 2
            vim.opt.shiftwidth = 2
            local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
            local event = "BufWritePre" -- or "BufWritePost"
            local async = event == "BufWritePost"
            vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
            vim.api.nvim_create_autocmd(event, {
                buffer = bufnr,
                group = group,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, async = async })
                end,
                desc = "[lsp] format on save",
            })
        end
    end,
})

local prettier_status, prettier = pcall(require, "prettier")
if not prettier_status then
    print("couldn't load prettier")
    return
end

prettier.setup({
    bin = "prettier",
    filetypes = {
        "css",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "typescript",
        "typescriptreact",
  },
})

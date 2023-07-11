local lsp_status, lsp = pcall(require, "lsp-zero")
if not lsp_status then
    print("couldn't load lsp-zero")
    return
end

lsp.preset("recommended")

lsp.ensure_installed({
    "gopls", -- Go
    "dockerls", -- Docker
    "tsserver", -- TypeScript
    "html", -- HTML 
    "cssls", -- CSS
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

-- lsp.on_attach(function(client, bufnr)
--     lsp.default_keymaps({buffer = bufnr})
-- end)

lsp.setup()

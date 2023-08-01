require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name)  -- default handler (optional)
                require("lspconfig")[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
}
require("mason-null-ls").setup({
        ensure_installed = {
                -- Opt to list sources here, when available in mason.
        },
        automatic_installation = false,
        handlers = {},
})
require("null-ls").setup({
        sources = {
                -- Anything not supported by mason.
        }
})

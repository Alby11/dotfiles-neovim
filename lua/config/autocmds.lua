-- auto-format on save
local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
    group = lsp_fmt_group,
    callback = function()
        -- Get all active LSP clients with formatting capabilities for the current buffer
        local clients = vim.lsp.get_clients()
        local has_formatter = false

        for _, client in pairs(clients) do
            -- Check if the LSP client supports formatting using the updated field
            if client.server_capabilities.documentFormattingProvider then
                has_formatter = true
                break
            end
        end

        -- Only format if a client with formatting capabilities is found
        if has_formatter then
            -- Use vim.lsp.buf.format with the correct parameters for the Neovim version
            vim.lsp.buf.format({
                filter = function(client)
                    -- Use the appropriate method to check for formatting support
                    return client.server_capabilities.documentFormattingProvider
                end,
                timeout = 1000, -- Timeout in milliseconds
                async = true, -- You can choose to wait for the result, but async is recommended
            })
        end
    end,
})

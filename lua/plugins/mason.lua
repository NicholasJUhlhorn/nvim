-- Nicholas J Uhlhorn
-- December 2025
-- Code template from mason git page

return {
    {
        'mason-org/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                'html',
                'cssls',
                'lua_ls',
                'pyright',
                'eslint',
                'golangci-lint',
                'gopls',
                'rust_analyzer'
            },
        },
    },
    {
        'mason-org/mason.nvim',
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            },
        }
    },
    { 'neovim/nvim-lspconfig' }
}

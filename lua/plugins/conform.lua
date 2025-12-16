-- Nicholas J Uhlhorn
-- December 2025
-- Template code grabbed from the conform git page

return {
    {
        'stevearc/conform.nvim',
        event = { "BufReadPre", "BufNewFile"},
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    go = {"gofmt"},
                    html = {"djlint"},
                    lua = { "stylua" },
                    python = { "isort", "black" },
                    rust = { "rustfmt"},
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                },
            })
        end
    }
}

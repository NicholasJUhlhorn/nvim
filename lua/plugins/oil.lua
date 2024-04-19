-- Nicholas J Uhlhorn
-- April 2024

return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
        require('oil').setup({})
    end,
}


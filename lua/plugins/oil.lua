-- Nicholas J Uhlhorn
-- April 2024

return {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    dependencies = {'kyazdani42/nvim-web-devicons'},
    config = function()
        require('oil').setup({})
    end,
}


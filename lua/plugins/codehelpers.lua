-- Nicholas J Uhlhorn
-- April 2024

return {
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({
                event = 'InsertEnter',
                config = true,
            })
        end,
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },
    {'tpope/vim-surround'},
    {'tpope/vim-repeat'},
}


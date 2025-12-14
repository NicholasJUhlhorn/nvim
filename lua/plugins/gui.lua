-- Nicholas J Uhlhorn
-- April 2024

return {
    {
        'akinsho/bufferline.nvim',
        config = function()
            require('bufferline').setup({
                options = {
                    mode = 'buffers',
                    scope = {
                        enabled = false,
                    },
                    offsets = {
                        {filetype = 'NvimTree'},
                    },
                },
                highlights = {
                    buffer_selected = {
                        italic = false,
                    },
                    -- indicator_selected = {
                    --     fg = {attribute = 'fg', highlite = 'true'},
                    --     italic = false,
                    -- },
                }
            })
        end
    },
    {'rebelot/kanagawa.nvim'},
    {'liuchengxu/space-vim-dark'},
    {'sainnhe/gruvbox-material'},
    {'ellisonleao/gruvbox.nvim'},
    {'kyazdani42/nvim-web-devicons'},
    {
        'akinsho/toggleterm.nvim',
        config = function()
            require('toggleterm').setup({
                open_mapping = '<C-g>',
                direction = 'horizontal',
                shade_termials = true,
            })
        end,
    },
}


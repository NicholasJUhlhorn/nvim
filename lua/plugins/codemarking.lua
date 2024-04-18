-- Nicholas J Uhlhorn
-- April 2024

return {
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup({
                options = {
                    icons_enabled = true,
                    section_separators = '|',
                    component_separators = '',
                    disabled_filetypes = {
                        statusline = {'Nvimtree'},
                    },
                },
            })
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                signs = {
                    add = {text = '▎'},
                    change = {text = '▎'},
                    delete = {text = '➤'},
                    topdelete = {text = '➤'},
                    changedelete = {text = '▎'},
                }
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup(
                {
                highlight = {
                    enabled = true,
                },
                indent = {
                    enable = true,
                    disable = {
                        'python',
                        'css',
                        'rust',
                    },
                },
                ensure_installed = {},
                modules = {},
                auto_install = true,
                ignore_install = {},
                sync_install = true,
            })
        end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup({
                enabled = true,
                indent = {
                    char = '▏',
                },
            })
        end,
    },
}


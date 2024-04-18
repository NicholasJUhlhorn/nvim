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
                    indicator_selected = {
                        fg = {attribute = 'fg', highlite = 'Funciton'},
                        italic = false,
                    },
                }
            })
        end
    },
    {'rebelot/kanagawa.nvim'},
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
    {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('nvim-tree').setup({
                hijack_cursor = false,
                auto_close = true,
                on_attach = function(bufnr)
                    local bufmap = function(lhs, rhs, desc)
                        vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
                    end

                    -- See :help nvim-tree.api
                    local api = require('nvim-tree.api')

                    bufmap('L', api.node.open.edit, 'Expand folder or go to file')
                    bufmap('H', api.node.navigate.parent_close, 'Close parent folder')
                    bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
                end
            })
            vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
        end
    },
}


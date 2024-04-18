-- Nicholas J Uhlhorn
-- April 2024

return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
            {'nvim-lua/plenary.nvim'},
        },
        config = function()
            require('telescope').setup({
               fzf = {
                  fuzzy = true,
                  override_generic_sorter = true,
                  override_file_sorter = true,
                  case_mode = 'smart_case',  
               } 
            })
            vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
            vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
            vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
            vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
            vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
            vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
            require('telescope').load_extension('fzf')
        end
    },
}


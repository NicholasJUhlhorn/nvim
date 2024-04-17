local M = {
    {'hrsh7th/nvim-cmp'},
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline', 
        'hrsh7th/cmp-emoji',
        'neovim/nvim-lspconfig',
        'nvim-lualine/lualine.nvim',
        'L3MON4D3/LuaSnip',
    }
}

M.config = function()
    local cmp = require('cmp')
    cmp.setup({
        snippet = {
            expand = function(args) 
                require('luasnip').lsp_expand(args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }), 
        sources = {
            { name = 'buffer' },
            { name = 'ccls'},
            { name = 'clangd' },
            { name = 'crates'},
            { name = 'luasnip' }, -- For luasnip users.
            { name = 'nvim_lsp' },
            { name = 'rust-analyzer' },
        },
        opts = function(_, opts)
            table.insert(opts.sources, {name = 'emoji'})
        end,
    })
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
                { name = 'cmdline' }
            })
    })

    -- require('cmp-nvim-lsp')
    -- local capabilites = require('cmp-nvim-lsp').update_capabilites(vim.lsp.protocal.make_client_capabilites())
    local lspconfig = require('lspconfig')
    lspconfig.ccls.setup({})
    lspconfig.clangd.setup({})
    lspconfig.rust_analyzer.setup({})

    require('lualine').setup({
        options = {
            icons_enabled = true,
            section_separators = '|',
            component_separators = '',
            disabled_filetypes = {
                statusline = {'Nvimtree'},
            }
        }
    })
end

return M

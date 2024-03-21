local lazy = {}

function lazy.install(path)
    if not vim.loop.fs_stat(path) then
        print('Installing lazy.nvim...')
        vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            path,
        })
    end
end

function lazy.setup(plugins)
    if vim.g.plugins_ready then
        return
    end
    
    lazy.install(lazy.path)

    vim.opt.rtp:prepend(lazy.path)
    
    require('lazy').setup(plugins, lazy.opts)
    vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. 'lazy/lazy.nvim'
lazy.opts = {}

-- TODO: plugins to checkout:
		-- wellle/targets.vim

lazy.setup({
    {'akinsho/bufferline.nvim'},
    {'windwp/nvim-autopairs'},
    {'numToStr/Comment.nvim'},

    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'}, 
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-emoji'},

    {'tpope/vim-fugitive'},
    {'lewis6991/gitsigns.nvim'},
    {'lukas-reineke/indent-blankline.nvim'},
    {'rebelot/kanagawa.nvim'},
    {'nvim-lualine/lualine.nvim'},
    {'neovim/nvim-lspconfig'},
    {'kyazdani42/nvim-web-devicons'},
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {'akinsho/toggleterm.nvim'},
    {'kyazdani42/nvim-tree.lua'},
    {'nvim-treesitter/nvim-treesitter'},
    {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip'},
    {'tpope/vim-surround'},
    {'tpope/vim-repeat'},

    -- Gleam Lang
    {'gleam-lang/gleam.vim'},
    -- Rust Lang
    {'simrat39/rust-tools.nvim'},
    {'rust-lang/rust.vim'},
})

-- vim.opt._ settings file
require('options')
-- vim keybinds file
require('keybindings')

require('nvim-autopairs').setup({
    event = 'InsertEnter',
    config = true,
})

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

require('Comment').setup({})

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
	sources = cmp.config.sources(
	{
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, 
	{
		{ name = 'buffer' },
	}),
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
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
--    require('lspconfig')[''].setup {
--    capabilities = capabilities
-- }

require('ibl').setup({
    enabled = true,
    indent = {
        char = '▏',
    },
})

require('gitsigns').setup({
  signs = {
    add = {text = '▎'},
    change = {text = '▎'},
    delete = {text = '➤'},
    topdelete = {text = '➤'},
    changedelete = {text = '▎'},
  }
})

require('lspconfig')

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

require('toggleterm').setup({
    open_mapping = '<C-g>',
    direction = 'horizontal',
    shade_termials = true,
})

require('nvim-tree').setup({
  hijack_cursor = false,
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

require('nvim-treesitter.configs').setup({
    highlite = {
        enabled = true,
    },
})

require('rust-tools').setup({
    server = {
        on_attach = require'cmp'.on_attach,
        settings = {
            ['rust-analyzer'] = {
                assist = {
                    importMergeBehavoir = 'last',
                    importPrefix = 'by_self',
                },
                cargo = {
                    loadOutDirsFromCheck = true,
                },
                procMacro = {
                    enable = true,
                },
            }
        }
    },
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = '<-',
            other_hints_prefix = '=>',
        },
        hover_actions = {
            border = 'single',
        },
    },
})

vim.opt.termguicolors = true
vim.cmd.colorscheme('kanagawa')

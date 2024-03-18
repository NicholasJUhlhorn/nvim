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
    {'numToStr/Comment.nvim'},
    {'tpope/vim-fugitive'},
    {'lewis6991/gitsigns.nvim'},
    {'lukas-reineke/indent-blankline.nvim'},
    {'rebelot/kanagawa.nvim'},
    {'nvim-lualine/lualine.nvim'},
    {'kyazdani42/nvim-web-devicons'},
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
    {'akinsho/toggleterm.nvim'},
    {'kyazdani42/nvim-tree.lua'},
    {'nvim-treesitter/nvim-treesitter'},
    {'tpope/vim-surround'},
    {'tpope/vim-repeat'},

    -- Gleam Lang
    {'gleam-lang/gleam.vim'},
})

-- vim.opt._ settings file
require('options')
-- vim keybinds file
require('keybindings')


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
    open_mapping = true,
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

vim.opt.termguicolors = true
vim.cmd.colorscheme('kanagawa')
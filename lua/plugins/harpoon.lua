-- Nicholas J Uhlhorn
-- April 2024
-- TODO: Get removing harpoon entries from within telescope working, then switch back to telescope version.

return {
    'ThePrimeagen/harpoon',
    event = 'VimEnter',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    branch = 'harpoon2',
    config = function()
        local harpoon = require('harpoon')
        harpoon:setup()

        -- local conf = require("telescope.config").values
        --
        -- local function toggle_telescope(harpoon_files)
        --     local file_paths = {}
        --     for _, item in ipairs(harpoon_files.items) do
        --         table.insert(file_paths, item.value)
        --     end
        --
        --     local make_finder = function()
        --         local paths = {}
        --         for _, item in ipairs(harpoon_files.items) do
        --             table.insert(paths, item.value)
        --         end
        --
        --         return require("telescope.finders").new_table(
        --             {
        --                 results = paths
        --             }
        --         )
        --     end
        --
        --     require("telescope.pickers").new(
        --         {},
        --         {
        --             prompt_title = "Harpoon",
        --             finder = make_finder(),
        --             previewer = conf.file_previewer({}),
        --             sorter = conf.generic_sorter({}),
        --             attach_mappings = function(prompt_buffer_number, map)
        --                 map(
        --                     "i",
        --                     "<C-d>", -- your mapping here
        --                     function()
        --                         local state = require("telescope.actions.state")
        --                         local selected_entry = state.get_selected_entry()
        --                         local current_picker = state.get_current_picker(prompt_buffer_number)
        --
        --                         harpoon:list()(selected_entry.index)
        --                         current_picker:refresh(make_finder())
        --                     end
        --                 )
        --
        --                 return true
        --             end
        --         }
        --     ):find()
        -- end


        vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
        -- vim.keymap.set("n", "<C-y>", function() toggle_telescope(harpoon:list()) end,
        --     { desc = "Open harpoon window" })
        vim.keymap.set("n", "<C-y>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<leader>1>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<leader>2>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<leader>3>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<leader>4>", function() harpoon:list():select(4) end)

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<C-S-K>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<C-S-J>", function() harpoon:list():next() end)
    end,
}


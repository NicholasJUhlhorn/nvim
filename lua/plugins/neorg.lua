return {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = {
        "nvim-neorg/neorg",
        dependencies = { "luarocks.nvim" },
        config = function()
            -- Pick one of ...

            -- a) NO arguments at all to setup
            -- require("neorg").setup()

            -- b) at least load "core.defaults"
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                },
            })
        end,
    },
}

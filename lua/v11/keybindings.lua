-- Nicholas J Uhlhorn
-- April 2024

-- ALT+j and ALT+k, line swapping
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==') -- move current line up(n)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==') -- move current line down(n)

-- CTRL+j and CTRL+k, swap between tabs
vim.keymap.set('n', '<C-j>', ':bprev<CR>')
vim.keymap.set('n', '<C-k>', ':bnext<CR>')
vim.keymap.set('n', '<C-b>', ':bdelete<CR>')

-- LEADER-H, add header to top of file.
vim.keymap.set('n', '<leader>H', 'O <bar> <cmd>lua WriteHeader()<cr><ESC>')

-- LEADER-o, shorthand for :Oil
vim.keymap.set('n', '<leader>o', '<cmd>Oil<cr><ESC>')

-- LEADER-nd, kill notification windows now!
vim.keymap.set('n', '<leader>nd', "<cmd>NoiceDismiss<CR>")

-- Popup error window
vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', {noremap=true, silent=true})

function WriteHeader()
    local pos = vim.api.nvim_win_get_cursor(0)
    local name_string = "Nicholas J Uhlhorn"
    local month_string = os.date("%B %Y")

    vim.api.nvim_set_current_line(name_string)
    vim.api.nvim_buf_set_lines(0, pos[1], pos[1], false, {month_string})
    vim.cmd(':normal gcc')
    vim.cmd('norm! j')
    vim.cmd('norm! o')
    vim.cmd('norm! k')
    vim.cmd(':normal gcc')
    vim.cmd('norm! j')
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.hoverProvider then
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
        end
    end,
})

-- mapping so j and k move visually in text files :)
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.txt", "*.md"},
    command = "noremap <buffer> j gj",
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.txt", "*.md"},
    command = "noremap <buffer> k gk",
})

-- propper auto commands
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.hbs"},
    command = "set filetype=html"
})

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


-- mapping so j and k move visually in text files :)
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.txt", "*.md"},
    command = "noremap <buffer> j gj",
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.txt", "*.md"},
    command = "noremap <buffer> k gk",
})

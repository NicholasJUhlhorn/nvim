-- Nicholas J Uhlhorn
-- April 2024

-- ALT+j and ALT+k, line swapping
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==') -- move current line up(n)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==') -- move current line down(n)

-- CTRL+j and CTRL+k, swap between tabs
vim.keymap.set('n', '<C-j>', ':bprev<CR>')
vim.keymap.set('n', '<C-k>', ':bnext<CR>')

-- LEADER-H, add header to top of file.
vim.keymap.set('n', '<leader>H', 'O <bar> <cmd>lua header()<cr>') 

function header()
    local pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.api.nvim_get_current_line()
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

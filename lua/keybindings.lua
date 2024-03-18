-- ALT+j and ALT+k line swapping
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==') -- move current line up(n)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==') -- move current line down(n)

-- CTRL+/ to toggle comments
-- vim.keymap.set('n', '<C->', 'gcc') -- comment line
-- vim.keymap.set('v', '<C->', 'gcb') -- comment lines

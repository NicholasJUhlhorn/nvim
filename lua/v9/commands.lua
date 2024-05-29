-- Nicholas J Uhlhorn
-- April 2024

vim.api.nvim_create_user_command('Th', 'tab help <args>', {nargs = 1})
-- Was going to add :O for ':Oil .', but that seems to be the case already!

-- Shorthand for enabling en_us spell check on a file.
vim.api.nvim_create_user_command('Sc', 'setlocal spell spelllang=en_us', {nargs = 0})

-- Add autocommand to set handlebar files as html
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile", "BufWinEnter"}, {
    pattern = "*.hbs",
    command = "set filetype=html",
})

vim.keymap.set('n', '<leader>e', 'oif err != nil {<CR>return err<CR>}<ESC>:w<CR>', { buffer = true, desc = 'Check for error' })

vim.bo.tabstop = 4

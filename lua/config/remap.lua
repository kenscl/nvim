vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pf", vim.cmd.Ex)
vim.keymap.set("n", "<leader>z", ":!zathura <C-r>=expand('%:r')<cr>.pdf &<cr>")
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
vim.keymap.set("n", "<leader>en", ":setlocal spell spelllang=en <cr>")
vim.keymap.set("n", "<leader>de", ":setlocal spell spelllang=de <cr>")

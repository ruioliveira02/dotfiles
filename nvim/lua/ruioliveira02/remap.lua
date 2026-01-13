vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Show diagnostic under cursor
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- Jump to next / previous diagnostic
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

-- List all diagnostics in quickfix
vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist)

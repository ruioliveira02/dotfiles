vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Show diagnostic under cursor
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- Jump to next / previous diagnostic
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

-- List all diagnostics in quickfix
vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist)

-- Terminal split presets
vim.keymap.set("n", "<leader>p1", function()
        vim.cmd("silent! only")
        vim.cmd("vsplit")
        vim.cmd("wincmd l")
        vim.cmd("vertical resize " .. math.floor(vim.o.columns * 0.3))

        vim.cmd("terminal")

        vim.cmd("wincmd h")
end, {desc = "Preset: code + terminal (30%)"})


vim.keymap.set("n", "<leader>p2", function()
        vim.cmd("silent! only")

        vim.cmd("vsplit")
        vim.cmd("wincmd l")
        vim.cmd("vertical resize " .. math.floor(vim.o.columns * 0.3))
        vim.cmd("terminal")

        vim.cmd("split")
        vim.cmd("wincmd j")
        vim.cmd("terminal")

        vim.cmd("wincmd h")

end, {desc = "Preset: code + 2 terminals (30%)"})

-- Split navigation

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

local setup = function()
    local telescope = require("telescope.builtin")

    local opts = {
        hidden = true,
        file_ignore_patterns = {
            "^%.git/",   -- ignore .git folder
            "^build/",   -- ignore build folder
        },
    }

    vim.keymap.set("n", "<leader>pf", function()
        telescope.find_files(opts)
    end, { desc = "Telescope find files (hidden, filtered)" })

    vim.keymap.set("n", "<C-p>", function()
        telescope.git_files({
            show_untracked = true,
        })
    end, { desc = "Telescope git files" })

    vim.keymap.set("n", "<leader>ps", function()
        telescope.grep_string({
            search = vim.fn.input("Grep >"),
            additional_args = function()
                return { "--hidden", "--glob", "!.git/*", "--glob", "!build/*" }
            end,
        })
    end)
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = setup
}

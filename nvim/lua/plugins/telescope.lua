local setup = function()
	local telescope = require("telescope.builtin")
	vim.keymap.set("n", "<leader>pf", telescope.find_files, { desc = "Telescope find files" })
	vim.keymap.set("n", "<C-p>", telescope.git_files, { desc = "Telescope find Git files" })
	vim.keymap.set("n", "<leader>ps", function()
		telescope.grep_string({ search = vim.fn.input("Grep >") });
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

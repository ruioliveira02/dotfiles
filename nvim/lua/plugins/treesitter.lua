return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufWinEnter", "BufNewFile" },
  lazy = false,
  dependencies = {"neovim/nvim-lspconfig"},
  opts = {
    ensure_installed = {
      "haskell",
      "lua",
      "vim",
      "vimdoc",
      "c",
      "cpp",      -- FIX: "c++" ❌ → "cpp" ✅
      "query",
      "elixir",
    },
    sync_install = false,
    auto_install = true,

    folds = { enable = true }, 

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = true,
      disable = { "python", "c" },
    },
  },
}


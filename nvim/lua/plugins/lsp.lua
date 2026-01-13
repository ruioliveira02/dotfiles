return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Mason
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "hls",
          "lua_ls",
          "pyright",
          "clangd",
          "bashls",
          "yamlls",
          "jsonls",
          "elixirls"
        },
        automatic_installation = true,
      })

      -- Capabilities
      local capabilities =
        require("cmp_nvim_lsp").default_capabilities()

      -- on_attach
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)

        -- Show error/warning under cursor
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

        -- Jump to next/prev error
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

        -- List all diagnostics in quickfix
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist)
      end

      ------------------------------------------------------------------
      -- NEW API (Neovim 0.11+)
      ------------------------------------------------------------------

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.lsp.config("hls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        on_attach = on_attach,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
        },
      })

      vim.lsp.config("bashls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          yaml = { keyOrdering = false },
        },
      })

      vim.lsp.config("jsonls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })


      vim.lsp.config("elixirls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      -- Enable servers
      vim.lsp.enable({
        "hls",
        "elixirls",
        "lua_ls",
        "pyright",
        "clangd",
        "bashls",
        "yamlls",
        "jsonls",
      })
    end,
  },
}


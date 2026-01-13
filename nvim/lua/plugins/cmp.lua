return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
        -- Navigate completion menu
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),

        -- Scroll docs
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),


        -- Abort completion
        ["<C-e>"] = cmp.mapping.abort(),

        -- Accept suggestion **only with Ctrl+Enter**
        ["<C-Space>"] = cmp.mapping.confirm({ select = true }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })
    end,
  },
}


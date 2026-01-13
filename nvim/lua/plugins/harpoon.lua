return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",

  opts = {}, -- this calls harpoon:setup()

  keys = {
    {
      "<leader>a",
      function()
        require("harpoon"):list():add()
      end,
      desc = "Harpoon add file",
    },
    {
      "<C-e>",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon menu",
    },
    {
      "<C-h>",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "Harpoon file 1",
    },
    {
      "<C-t>",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "Harpoon file 2",
    },
    {
      "<C-n>",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "Harpoon file 3",
    },
    {
      "<C-s>",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "Harpoon file 4",
    },
    {
      "<C-S-P>",
      function()
        require("harpoon"):list():prev()
      end,
      desc = "Harpoon previous",
    },
    {
      "<C-S-N>",
      function()
        require("harpoon"):list():next()
      end,
      desc = "Harpoon next",
    },
  },
}


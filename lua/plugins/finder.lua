return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<c-t>"] = require("telescope.actions").select_tab,
            },
            n = {
              ["<c-t>"] = require("telescope.actions").select_tab,
            },
          },
        },
      })
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
}

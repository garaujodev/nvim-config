return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup({
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden", -- Adicione esta linha para incluir arquivos ocultos
            "--glob=!.git/*",
            -- "--no-ignore", -- Adicione esta linha para ignorar as regras de .gitignore
          },
          mappings = {
            i = {
              ["<c-t>"] = require("telescope.actions").select_tab,
            },
            n = {
              ["<c-t>"] = require("telescope.actions").select_tab,
            },
          },
        },
        opts = {
          pickers = {
            find_files = {
              hidden = true,
              file_ignore_patterns = { ".git" },
            },
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    config = function()
      require("telescope").load_extension("fzy_native")
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

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "", -- this can only be used in the git_status source
            renamed = "", -- this can only be used in the git_status source
            -- Status type
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = { enabled = true },

        filtered_items = {
          visible = true,
          show_hidden_count = false,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".git",
            ".DS_Store",
            "thumbs.db",
          },
          never_show = { ".git", ".DS_Store", "thumbs.db" },
        },
      },
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    },
  },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      detection_methods = { "pattern" },
    },
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "elixir-ls",
        "rubocop",
      })
    end,
  },
}

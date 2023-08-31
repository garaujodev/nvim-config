-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
local set_keymap = vim.api.nvim_set_keymap

-- Helper function to set key mappings for multiple modes
local function multiple_set_keymap(modes, lhs, rhs, opts)
  for mode in string.gmatch(modes, "%a") do
    set_keymap(mode, lhs, rhs, opts)
  end
end

-- navigation
set_keymap("n", "<C-j>", "5j", { desc = "Jump down" })
set_keymap("n", "<C-k>", "5k", { desc = "Jump up" })

set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- tabs
set_keymap("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New tab" })
set_keymap("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "Close tab" })
set_keymap("n", "<leader><tab><tab>", "<cmd>tablast<cr>", { desc = "Last tab" })

-- commands
set_keymap("n", ";", ":", { desc = "Fast command" })

set_keymap("n", "<C-O>", ":Neotree <C-r>=expand('%:p:h')<CR>/", { desc = "Open command in current path" })

set_keymap("c", "<C-e>", "<C-r>=expand('%:p:h')<CR>/", { desc = "Fill current dir" })

-- replace
set_keymap("n", "<leader>:", ":%s/:(w+)(s*=>s*)/\1: /gc<CR>", { desc = "Replace old Ruby hash syntax to new one" })

-- Disable arrow keys in normal mode
-- multiple_set_keymap("n,i", "<Left>", "<Nop>", { noremap = true, silent = true })
-- multiple_set_keymap("n,i", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Disable arrow keys in insert mode
set_keymap("i", "<Up>", "<Nop>", { noremap = true, silent = true })
set_keymap("i", "<Down>", "<Nop>", { noremap = true, silent = true })

local is_maximized = false

vim.toggle_maximize_window = function()
  if is_maximized then
    vim.cmd("wincmd =")
    is_maximized = false
  else
    vim.cmd("wincmd |")
    vim.cmd("wincmd _")
    is_maximized = true
  end
end

-- set_keymap("n", "<Leader>z", ":lua vim.toggle_maximize_window()<CR>", { desc = "Toggle maximize window" })

-- Call Telescope file finder directly with <Ctrl+p> in normal and insert modes
multiple_set_keymap("n,i", "<C-p>", "<Cmd>Telescope find_files<CR>", {
  noremap = true, -- Do not remap nested mappings
  silent = true, -- Do not show the mapping in command-line area
  desc = "Find files", -- Description for the key mapping
})

set_keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" })
set_keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" })
set_keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" })
set_keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" })
set_keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" })
set_keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" })
set_keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" })
set_keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" })
set_keymap("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Buffer 9" })
set_keymap("n", "<leader>0", "<cmd>BufferLineGoToBuffer 0<cr>", { desc = "Buffer 0" })
-- set_keymap("n", "<leader>l", "<cmd>e#<cr>", { desc = "Last Buffer" })

set_keymap("n", "<leader>wo", "<cmd>only<cr>", { desc = "Focus window" })
set_keymap("n", "<leader>wq", "<cmd>q<cr>", { desc = "Quit window" })

set_keymap("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })

-- vim.keymap.set("n", "\\", function()
--   require("window-picker").pick_window({})
-- end, { desc = "Pick a window" })

require("which-key").register({ ["<leader>cj"] = { name = "Code Split/Join" } })

set_keymap(
  "n",
  "[<space>",
  "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>",
  { desc = "Empty line above" }
)
set_keymap("n", "]<space>", "<Cmd>call append(line('.'), repeat([''], v:count1))<CR>", { desc = "Empty line below" })

set_keymap("n", "<leader><space>", "<cmd>Telescope find_files<cr>", { desc = "Find Files, incl hidden (root dir)" })
set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files, incl hidden (root dir)" })
set_keymap("n", "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Find Git Files (root dir)" })

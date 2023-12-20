-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })

local telescope = require("telescope.builtin")
function folder_live_grep(folder)
  telescope.live_grep({
    prompt_title = "Live Grep in Folder " .. folder,
    search_dirs = { folder },
  })
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>(",
  [[:lua folder_live_grep(vim.fn.input("Folder: "))<CR>]],
  { noremap = true, silent = true }
)

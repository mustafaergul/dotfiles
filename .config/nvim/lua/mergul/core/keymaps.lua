local keymap = vim.keymap

-- alt insert mode
keymap.set("n", "ı", "i", { desc = "go insert mode with ı as well" })

-- movement keymaps
keymap.set("n", "j", "jzzzv", { desc = "go down and center the page" })
keymap.set("n", "k", "kzzzv", { desc = "go up and center the page" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll down and center the page" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scroll up and center the page" })

-- yank
keymap.set("v", "<leader>y", '"+y', { desc = "yank and keep" })
keymap.set("n", "<leader>p", '"+p', { desc = "yank and keep pasting" })

-- remap no highlight
keymap.set("n", "<leader>h", ":nohlsearch<CR>")

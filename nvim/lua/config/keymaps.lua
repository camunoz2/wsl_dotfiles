-- Keybindings
local map = vim.keymap.set

-- select all
map("n", "<c-a>", "ggVG")

-- Disable keys used on tmux change windows
map({ "n", "i", "v" }, "<C-l>", "<Nop>")
map({ "n", "i", "v" }, "<C-h>", "<Nop>")

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Splits
map("n", "<leader>\\", ":vsplit<CR><c-w>l", { noremap = true, silent = true })

-- Close window
map("n", "<leader>q", ":q<cr>", { noremap = true, silent = true })

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move Lines
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Netrw
map("n", "<leader>e", ":Ex<cr>", { desc = "Open navigator" })

-- Lazygit
map("n", "<leader>gg", "<cmd>lua require('config.terminal').lazygit_toggle()<CR>", { noremap = true, silent = true })

-- ToggleTerm
map("n", "<c-\\>", ":ToggleTerm<cr>")

-- Yank to clipboard
map("v", "<leader>y", '"+y')

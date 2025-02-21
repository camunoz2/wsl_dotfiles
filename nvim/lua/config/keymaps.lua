-- Keybindings
local map = vim.keymap.set

-- select all
map("n", "<c-a>", "ggVG")

-- Disable keys used on tmux change windows
map({ "n", "i", "v" }, "<C-l>", "<Nop>")
map({ "n", "i", "v" }, "<C-h>", "<Nop>")

-- Harpoon
local harpoon = require("harpoon")

harpoon:setup()

map("n", "<leader>a", function()
	harpoon:list():add()
end)
map("n", "<leader>h", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end) -- Changed from <C-e> to <leader>h

map("n", "<F1>", function()
	harpoon:list():select(1)
end)
map("n", "<F2>", function()
	harpoon:list():select(2)
end)
map("n", "<F3>", function()
	harpoon:list():select(3)
end)
map("n", "<F4>", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
map("n", "<S-F1>", function()
	harpoon:list():prev()
end)
map("n", "<S-F2>", function()
	harpoon:list():next()
end)

-- Code Action
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- Diagnostics
map("n", "<leader>d", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Show diagnostics" })

-- Telescope
local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Telescope browser
local telescope = require("telescope")
telescope.load_extension("file_browser")
map("n", "<leader>E", telescope.extensions.file_browser.file_browser, { desc = "Telescope file browser" })
map("n", "<leader>e", function()
	telescope.extensions.file_browser.file_browser({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Open file browser in current file's directory" })

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

-- Lazygit
map("n", "<leader>gg", "<cmd>lua require('config.terminal').lazygit_toggle()<CR>", { noremap = true, silent = true })

-- ToggleTerm
map("n", "<c-\\>", ":ToggleTerm<cr>")

-- Yank to clipboard
map("v", "<leader>y", '"+y')

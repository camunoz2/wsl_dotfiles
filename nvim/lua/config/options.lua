vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes" --show the sign column on the left for LSP anotations
vim.opt.updatetime = 50 -- updates the cursor and LSP times faster that the defaults 4000ms that nvim has
vim.opt.wrap = true
vim.opt.linebreak = true -- Break lines at word boundaries
vim.opt.textwidth = 80 -- Set text width for wrapping
vim.opt.showbreak = ">>**>> " -- Visual indicator for wrapped lines
vim.opt.breakindent = true -- Indent wrapped lines
vim.opt.breakindentopt = "shift:2"

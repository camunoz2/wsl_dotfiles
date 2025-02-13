local Terminal = require("toggleterm.terminal").Terminal

-- Setup for LazyGit terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",  -- Make sure to set this to your actual git directory or use "git_dir" for the current git repo
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = function(term)
    vim.cmd("startinsert!")
    -- Allow quitting the terminal with 'q'
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
  on_close = function(term)
    -- No need to do anything on close, startinsert is called when opening
    -- vim.cmd("startinsert!")  -- This is not necessary as it will be in insert mode
  end,
})

-- Function to toggle LazyGit terminal
function _lazygit_toggle()
  lazygit:toggle()
end

-- Return the toggle function to use it elsewhere
return {
  lazygit_toggle = _lazygit_toggle
}


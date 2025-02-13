return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      -- You can customize your preferences here
      flavor = "mocha", -- options: latte, frappe, macchiato, mocha
    })
    vim.cmd.colorscheme("catppuccin")
  end
}


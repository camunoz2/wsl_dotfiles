return {
  { 'echasnovski/mini.nvim', version = false,
    config = function ()
      require('mini.comment').setup()
      require('mini.completion').setup()
      require('mini.icons').setup()
      require('mini.pairs').setup()
      require('mini.statusline').setup()
      require('mini.surround').setup()
      require('mini.sessions').setup({
        autowrite = true,
        autoread = true,
      })
    end
  },
}

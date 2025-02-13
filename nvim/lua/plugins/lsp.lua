return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Lua Setup
			lspconfig.lua_ls.setup({
				capabilities = capabilities, -- Attach nvim-cmp capabilities
				settings = {
					Lua = {
						-- config for love2d
						workspace = {
							checkThirdParty = false,
							telemetry = { enable = false },
							library = {
								"${3rd}/love2d/library",
							},
						},
						diagnostics = {
							globals = { "vim" }, -- to avoid diagnostics errors for 'vim'
						},
					},
				},
			})

			-- TsSetup
			lspconfig.ts_ls.setup({
				cmd = { "typescript-language-server", "--stdio" },
				on_attach = function()
					vim.keymap.set("n", "gd", function()
						vim.lsp.buf.definition()
					end, { noremap = true, silent = true, desc = "Go to definition and center line" })
				end,
				settings = {},
			})

			-- Emmet
			lspconfig.emmet_language_server.setup({})

			-- Golang stup
			lspconfig.gopls.setup({
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			})

			-- PHP
			lspconfig.phpactor.setup({})
		end,
	},
}

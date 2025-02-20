return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP completion source
			"hrsh7th/cmp-buffer", -- buffer words completion
			"hrsh7th/cmp-path", -- file path completion
			"hrsh7th/cmp-cmdline", -- command-line completion
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			"onsails/lspkind.nvim", -- VS Code-like icons
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if cmp.get_selected_entry() then
								cmp.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })
							else
								cmp.close() -- if visible but no selection, simply close without newline
							end
						else
							fallback() -- if menu isn’t visible, fallback to default (inserting newline)
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
				experimental = {
					ghost_text = true, -- Similar to VS Code's inline suggestions
				},
			})

			-- Configure completion for command-line mode
			cmp.setup.cmdline(":", {
				sources = cmp.config.sources({
					{ name = "cmdline" },
				}),
			})
		end,
	},
}

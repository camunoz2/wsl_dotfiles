return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			typescript = { "biome" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "biome" },
			json = { "prettierd" },
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)
	end,
}

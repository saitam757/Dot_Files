-- maps command line tools into lsp
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
--				null_ls.builtins.diagnostics.flake8.with({
--					prefer_local = ".venv/bin",
--				}),
				--				null_ls.builtins.completion.spell,
			},
		})
	end
}

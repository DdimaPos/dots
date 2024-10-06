return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				--lua   C/C++ JavaScript  HTML  Css    Python  GO    Markdown   Bash  C#  --
				ensure_installed = {
					"lua_ls",
					"clangd",
					"ts_ls",
					"html",
                    "emmet_ls",
					"cssls",
					"css_variables",
					"pylsp",
					"golangci_lint_ls",
					"markdown_oxide",
					"bashls",
					"csharp_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
            lspconfig.emmet_ls.setup({
				capabilities = capabilities,
                filetypes = {'jsx', 'tsx', 'html', 'css', 'javascriptreact', 'typescriptreact' },
			})
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.css_variables.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})
			lspconfig.golangci_lint_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.markdown_oxide.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			lspconfig.csharp_ls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

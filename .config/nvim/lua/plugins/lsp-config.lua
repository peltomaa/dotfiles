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
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"eslint",
					"html",
					"gopls",
					"pyright",
					"tailwindcss",
					"phpactor",
					"hls",
					"clangd",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			capabilities.textDocument.formatting = false
			capabilities.textDocument.rangeFormatting = false

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,

				root_dir = vim.fs.dirname(vim.fs.find({
					"tsconfig.json",
					"jsconfig.json",
					"package.json",
					"pnpm-workspace.yaml",
					".git",
				}, { upward = true, stop = vim.env.HOME })[1]),
			})
			vim.lsp.enable("ts_ls")

			vim.lsp.config("eslint", {
				capabilities = capabilities,
				settings = {
					format = { enable = false },
					codeActionOnSave = { enable = false },
				},
				root_dir = function(bufnr, on_dir)
					if
						vim.fs.root(
							bufnr,
							".eslintrc.js",
							".eslintrc.cjs",
							".eslintrc.json",
							"package.json",
							"pnpm-workspace.yaml",
							".git"
						)
					then
						on_dir(vim.fn.getcwd())
					end
				end,
			})
			vim.lsp.enable("eslint")

			vim.lsp.config("html", {
				capabilities = capabilities,
			})
			vim.lsp.enable("html")

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("lua_ls")

			vim.lsp.config("gopls", {
				capabilities = capabilities,
				settings = {
					gopls = {
						gofumpt = true,
					},
				},
			})
			vim.lsp.enable("gopls")

			vim.lsp.config("pyright", {
				capabilities = capabilities,
			})
			vim.lsp.enable("pyright")

			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
			})
			vim.lsp.enable("tailwindcss")

			vim.lsp.config("phpactor", {
				capabilities = capabilities,
				init_options = {
					["language_server_phpstan.enabled"] = true,
					["language_server_psalm.enabled"] = true,
					["language_server_php_cs_fixer.enabled"] = true,
				},
			})
			vim.lsp.enable("phpactor")

			vim.lsp.config("hls", {
				capabilities = capabilities,
				filetypes = { "haskell", "lhaskell", "cabal" },
			})
			vim.lsp.enable("hls")

			vim.lsp.config("clangd", {
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=bundled",
					"--pch-storage=memory",
					"--cross-file-rename",
				},
			})
			vim.lsp.enable("clangd")

			local map = vim.keymap.set

			map("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })
			map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
			map("n", "gr", vim.lsp.buf.references, { desc = "References", nowait = true })
			map("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" })
			map("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto T[y]pe Definition" })
			map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
			map("n", "K", function()
				return vim.lsp.buf.hover()
			end, { desc = "Hover" })
			map("n", "gK", function()
				return vim.lsp.buf.signature_help()
			end, { desc = "Signature Help" })
			map("i", "<c-k>", function()
				return vim.lsp.buf.signature_help()
			end, { desc = "Signature Help" })
			map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
			map({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens" })
			map("n", "<leader>cC", vim.lsp.codelens.refresh, { desc = "Refresh & Display Codelens" })
			map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
		end,
	},
}

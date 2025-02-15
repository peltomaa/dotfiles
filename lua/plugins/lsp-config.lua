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
        ensure_installed = { "lua_ls", "ts_ls", "eslint", "html", "gopls", "pyright", "tailwindcss" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
        settings = {
          gopls = {
            gofumpt = true,
          },
        },
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })

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

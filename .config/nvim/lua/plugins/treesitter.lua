return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "jsdoc",
        "tsx",
        "html",
        "css",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "yaml",
        "markdown",
        "python",
        "php",
        "haskell",
        "rust",
        "ron",
        "graphql",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}

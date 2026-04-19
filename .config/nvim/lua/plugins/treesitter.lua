return {
  "romus204/tree-sitter-manager.nvim",
  dependencies = {}, -- tree-sitter CLI must be installed system-wide
  config = function()
    require("tree-sitter-manager").setup({
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
  end
}

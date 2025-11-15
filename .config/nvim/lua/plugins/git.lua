return {
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
    },
    config = function()
      vim.g.lazygit_floating_window_winblend = 0
      vim.g.lazygit_floating_window_scaling_factor = 0.8
      vim.g.lazygit_use_neovim_remote = true
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "<leader>ghb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame Line" },
      { "<leader>ghB", "<cmd>Gitsigns blame<cr>",      desc = "Blame Buffer" },
    },
    config = function()
      require("gitsigns").setup()
    end,
  },
}

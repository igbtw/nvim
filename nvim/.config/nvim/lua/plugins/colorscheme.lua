return {
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },

  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      vim.cmd.colorscheme("oxocarbon")
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "oxocarbon" },
  },
}

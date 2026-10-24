-- Renders markdown in the buffer (headings, code blocks, tables, callouts).
-- Don't pair with other in-buffer renderers such as markview.nvim.
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
    ft = { "markdown" },
    keys = {
      { "<leader>um", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle markdown rendering" },
    },
    opts = {},
  },
  { "echasnovski/mini.icons", lazy = true, opts = {} },
}

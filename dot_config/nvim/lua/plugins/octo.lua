return {
  {
    "pwntester/octo.nvim",
    config = function()
      require("octo").setup({ enable_builtin = true })
      vim.cmd([[hi OctoEditable guibg=none]])
    end,
    keys = {
      { "<leader>o", "<cmd>Octo<cr>", desc = "Octo" },
    },
  },
}

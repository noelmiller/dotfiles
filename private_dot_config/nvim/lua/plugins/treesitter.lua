-- Uses the `main` branch of nvim-treesitter (Neovim 0.11+). Parsers are
-- compiled locally, which needs the tree-sitter CLI (in the Brewfile).
local languages = {
  "bash", "c", "go", "hcl", "html", "javascript", "json", "lua", "markdown",
  "markdown_inline", "python", "rust", "terraform", "toml", "typescript",
  "vim", "vimdoc", "yaml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(languages)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          if pcall(vim.treesitter.start, ev.buf) then
            vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}

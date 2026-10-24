# dotfiles

Personal dotfiles, managed with [chezmoi](https://www.chezmoi.io/).

## What's managed

| Area | Files |
| --- | --- |
| Shell | `.zshrc`, `.zshenv`, `.zprofile`, `.aliases`, `.zsh/completion/_tuios` |
| Git | `.gitconfig` |
| Prompt | `.config/starship.toml` |
| Fish | `.config/fish/config.fish` |
| Neovim | `.config/nvim/` (lazy.nvim; see below) |
| Editors / tools | `.config/zed/settings.json`, `.config/opencode/opencode.jsonc` |

`.zshenv` and `.zprofile` are templates. They use the current home directory and pick the Homebrew prefix for the machine's OS and architecture.

Packages are listed in [`Brewfile`](Brewfile). On macOS, `run_onchange_after_install-packages.sh.tmpl` runs `brew bundle` (installing Homebrew first if needed) whenever the Brewfile changes. Neither `Brewfile` nor this README is copied to the home directory (see `.chezmoiignore`).

Credentials are deliberately not tracked (`.ssh`, `.config/gh`, `.config/1Password`, `.claude.json`, shell history, etc.).

## Set up a new machine

Requires SSH access to GitHub.

```sh
brew install chezmoi   # or: sh -c "$(curl -fsLS get.chezmoi.io)"
chezmoi init --apply git@github.com:noelmiller/dotfiles.git
```

## Day-to-day

```sh
chezmoi add ~/.some-file     # start tracking a file
chezmoi edit ~/.zshrc        # edit the source version
chezmoi diff                 # preview changes
chezmoi apply                # write source state to $HOME
chezmoi update               # pull from GitHub and apply
chezmoi cd                   # shell into the source directory to commit/push
```

If you edit a managed file in `$HOME` directly, run `chezmoi add <file>` to copy the change back into the repo.

## Using this repo as the source directory

On the main machine the repo lives at `~/Documents/GitHub/dotfiles`, so `~/.config/chezmoi/chezmoi.toml` contains:

```toml
sourceDir = "/Users/noel/Documents/GitHub/dotfiles"
```

Other machines use chezmoi's default (`~/.local/share/chezmoi`) and don't need this.

## Updating the Brewfile

```sh
brew bundle dump --file=Brewfile --force   # then prune what you don't want
```

`brew leaves --installed-on-request` helps separate direct installs from dependencies.

## Neovim

Config lives in `.config/nvim` and needs Neovim 0.11+ (tested on 0.12). Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim), which bootstraps itself on first launch. Open `nvim` once and wait for plugins, treesitter parsers and LSP servers to install.

| Area | Plugin |
| --- | --- |
| Theme | catppuccin (mocha) |
| Fuzzy finder | telescope (+ fzf-native) |
| File explorer | oil.nvim |
| Syntax | nvim-treesitter (`main` branch) |
| LSP | mason + mason-lspconfig + nvim-lspconfig (lua, python, go, rust, terraform, yaml, bash) |
| Completion | blink.cmp |
| Formatting | conform.nvim (format on save) |
| Git | gitsigns |
| UI / editing | lualine, which-key, mini.pairs, mini.surround, Comment.nvim |

Leader is `<space>`. Useful keys: `<leader>ff` files, `<leader>fg` grep, `-` file explorer, `gd` definition, `K` hover, `<leader>ca` code action, `<leader>rn` rename, `<leader>cf` format. Press `<leader>` and wait for which-key to list the rest.

Brewfile provides `neovim`, `ripgrep`, `fd`, `tree-sitter-cli` (parser builds), and the `stylua`, `shfmt`, `ruff` formatters. Add or remove servers and parsers in `lua/plugins/lsp.lua` and `lua/plugins/treesitter.lua`.

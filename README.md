# dotfiles

Personal dotfiles, managed with [chezmoi](https://www.chezmoi.io/).

## What's managed

| Area | Files |
| --- | --- |
| Shell | `.zshrc`, `.zshenv`, `.zprofile`, `.aliases`, `.zsh/completion/_tuios` |
| Git | `.gitconfig` |
| Prompt | `.config/starship.toml` |
| Fish | `.config/fish/config.fish` |
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

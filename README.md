# dotfiles

Personal configuration, managed with [GNU Stow](https://www.gnu.org/software/stow/).
The repo mirrors `$HOME`: editing a config in place edits the repo directly (it's
a symlink), so syncing to the remote is just a `git push`.

## What's tracked

| Path | What |
|------|------|
| `.zshrc` | Zsh shell config |
| `.gitconfig` | Git config |
| `.wezterm.lua` | WezTerm terminal |
| `.config/nvim` | Neovim (lazy.nvim) |
| `.config/aerospace` | AeroSpace window manager |
| `.config/atuin` | Atuin shell history |
| `.config/tmux` | tmux |

## Install on a new machine

```sh
brew install stow
git clone git@github.com:mustafaergul/dotfiles.git ~/Projects/dotfiles
cd ~/Projects/dotfiles
stow -t ~ .          # symlink everything into $HOME
```

If a real file already exists where a symlink should go, Stow refuses (conflict).
Back it up and remove it, then re-run `stow -t ~ .`. Non-dotfile repo files
(`README.md`, `*.sh`, `.git`, …) are skipped via `.stow-local-ignore`.

## Daily use

Configs are symlinks into this repo, so just edit them normally
(`~/.config/nvim/...`, `~/.zshrc`, …). To push changes to the remote:

```sh
dotpush
```

`dotpush` is an alias (in `.zshrc`):

```sh
alias dotpush='cd ~/Projects/dotfiles && git add -A && git commit -m "update dotfiles" && git push'
```

Or do it manually:

```sh
cd ~/Projects/dotfiles && git add -A && git commit -m "..." && git push
```

## Undo (back to plain files)

```sh
stow -D -t ~ .       # remove the symlinks
```

Then copy the files back from the repo (or a backup) if you want real files again.

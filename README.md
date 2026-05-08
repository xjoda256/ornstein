# dankjoda

Post-install bootstrap for my Arch Linux setup. Also doubles as an update tool on re-runs. Designed to be run after an archinstall deployment using [`docs/user_configuration.json`](docs/user_configuration.json).

## What it does

1. Clones/pulls [ornstein](https://codeberg.org/xjoda/ornstein) dotfiles (GitHub fallback) to `~/.cache/ornstein` and rsyncs them home
2. Copies system configs (`pacman.conf`, `makepkg.conf`, `mkinitcpio.conf`, `sudoers`, GRUB, Plymouth) from `docs/etc/`
3. Installs `yay-bin` if not present, then runs a full system update (`yay -Syua`)
4. Installs AUR packages
5. Sets up Plymouth theme, pywalfox, and systemd services
6. Installs Hypr dynamic-cursors plugin (skips if already present)
7. Rebuilds initramfs and updates GRUB
8. Prints elapsed time

## Requirements

- Arch Linux with Hyprland running
- `git`
- `lolcat` (optional — comment out if not needed)
- Internet connection

## Usage

```sh
curl -fsSL https://raw.githubusercontent.com/xjoda256/dankjoda/main/dankjoda.sh | bash
```

Or download and run locally:

```sh
./dankjoda.sh
```

## Notes

- Idempotent — safe to re-run if it fails partway through (skips completed steps)
- Re-running also works as a system/dotfiles updater
- Requires Hyprland to be running (needed for hyprpm)
- System files are copied with `sudo`, so you'll be prompted for credentials

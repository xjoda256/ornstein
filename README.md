# dankjoda

Post-install bootstrap for my Arch Linux setup. Also doubles as an update tool on re-runs. Designed to be run after an archinstall deployment using [`docs/user_configuration.json`](docs/user_configuration.json).

## What it does

1. Clones/pulls [ornstein](https://codeberg.org/xjoda/ornstein) dotfiles (GitHub fallback) to `~/.cache/ornstein` and rsyncs them home
2. Copies system configs from [`docs/etc/`](docs/etc/) to `/etc/`
3. Installs `yay-bin` if not present, then runs a full system update (`yay -Syua`)
4. Installs AUR packages (`papirus-folders`, `python-pywalfox`, `qt6ct-kde`, etc.)
5. Sets Papirus folder color
6. Installs Plymouth theme and GRUB theme
7. Links pywalfox colors
8. Enables systemd services
9. Installs Hyprland dynamic-cursors plugin (skips if already present)
10. Rebuilds initramfs and updates GRUB

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

- Safe to re-run if it fails partway through (skips completed steps)
- Requires Hyprland to be running (needed for hyprpm)
- System files are copied with `sudo`, so you'll be prompted for credentials

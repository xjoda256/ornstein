#!/usr/bin/env bash
set -euo pipefail

if ! pgrep -x Hyprland &>/dev/null; then
  echo "Hyprland must be running to run this script." >&2
  exit 1
fi

lolcat << "EOF"
##################################################
## ╭──────────────────────────────────────────╮ ##
## │another                                   │ ##
## │       _____              __              │ ##
## │      /\___ \            /\ \             │ ##
## │ __  _\/__/\ \    ___    \_\ \     __     │ ##
## │/\ \/'\  _\ \ \  / __`\  /'_` \  /'__`\   │ ##
## │\/>  </ /\ \_\ \/\ \L\ \/\ \L\ \/\ \L\.\_ │ ##
## │ /\_/\_\\ \____/\ \____/\ \___,_\ \__/.\_\│ ##
## │ \//\/_/ \/___/  \/___/  \/__,_ /\/__/\/_/│ ##
## │                               masterpiece│ ##
## ╰──────────────────────────────────────────╯ ##
## ×Joda™ w/Big Pickle ###########################
EOF

DOTFILES_REPO="https://codeberg.org/xjoda/ornstein"
DOTFILES_FALLBACK="git@github.com:xjoda256/ornstein.git"
DOTDIR="$HOME/.cache/ornstein"

AUR_PACKAGES=(
  fend-bin
  grub-hook
  mintstick
  newsraft
  papirus-folders
  python-pywalfox
  qt6ct-kde
)

# ---------------------------------------------------------------------------
# dotfiles (mirrors home dir structure)
# ---------------------------------------------------------------------------
if [[ ! -d "$DOTDIR" ]]; then
  echo "==> Cloning dotfiles to $DOTDIR..."
  git clone "$DOTFILES_REPO" "$DOTDIR" || git clone "$DOTFILES_FALLBACK" "$DOTDIR"
else
  echo "==> $DOTDIR already exists, skipping clone"
fi

echo "==> Copying dotfiles to home dir..."
rsync -a --exclude=.git "$DOTDIR"/ "$HOME"/

echo "==> Creating placeholder configs for hyprland..."
mkdir -p ~/.config/hypr/dms
touch ~/.config/hypr/dms/colors.conf
touch ~/.config/hypr/dms/cursor.conf

# ---------------------------------------------------------------------------
# system files (from cloned repo's docs/etc/)
# ---------------------------------------------------------------------------
echo "==> Copying system config files..."
DOCS_ETC="$DOTDIR/docs/etc"
SYSTEM_FILES=(
  pacman.conf
  makepkg.conf
  mkinitcpio.conf
  sudoers
  default/grub
  plymouth/plymouthd.conf
  systemd/system/plymouth-wait.service
)

for f in "${SYSTEM_FILES[@]}"; do
  src="$DOCS_ETC/$f"
  dest="/etc/$f"
  if [[ -f "$src" ]]; then
    echo "  Installing $dest"
    sudo cp "$src" "$dest"
  else
    echo "  WARNING: $src not found, skipping"
  fi
done

# ---------------------------------------------------------------------------
# yay_install - builds yay-bin from the AUR
# ---------------------------------------------------------------------------
yay_install() {
  echo "==============================="
  echo "   ArchBANG yay installer"
  echo "==============================="

  sudo pacman -Sy --needed --noconfirm base-devel git

  tmpdir=$(mktemp -d)
  cd "$tmpdir"
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm

  cd ~
  rm -rf "$tmpdir"

  echo "✔ yay installed successfully"
}

# ---------------------------------------------------------------------------
# ensure yay is available
# ---------------------------------------------------------------------------
if ! command -v yay &>/dev/null; then
  yay_install
fi

# ---------------------------------------------------------------------------
# AUR packages
# ---------------------------------------------------------------------------
echo "==> Installing AUR packages..."
yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"

echo "==> Installing plymouth theme..."
yay -S --needed --noconfirm plymouth-i_use_arch_btw-git
sudo plymouth-set-default-theme i_use_arch_btw

echo "==> Linking pywalfox colors..."
mkdir -p ~/.cache/wal
touch ~/.cache/wal/dank-pywalfox.json
ln -sf ~/.cache/wal/dank-pywalfox.json ~/.cache/wal/colors.json

echo "==> Enabling services..."
sudo systemctl enable --now sshd.service
sudo systemctl enable --now plymouth-wait.service
systemctl --user enable --now psd.service

echo "==> Updating Hypr plugins..."
hyprpm update
hyprpm add https://github.com/virtcode/hypr-dynamic-cursors
hyprpm enable dynamic-cursors

echo "==> Rebuilding initramfs..."
sudo mkinitcpio -P

echo "==> Updating GRUB config..."
sudo grub-mkconfig -o /boot/grub/grub.cfg



echo "✔ Done."

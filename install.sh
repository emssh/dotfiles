#!/bin/bash
set -e

echo "==> Installing stow..."
sudo pacman -S --needed stow

echo "==> Stowing packages..."
cd "$(dirname "$0")"

PACKAGES=(
    zsh
    hypr
    waybar
    kitty
    starship
    rofi
    nwg-look
    thunar
)

for pkg in "${PACKAGES[@]}"; do
    echo "  stowing $pkg..."
    stow "$pkg"
done

echo "==> Restoring packages..."
sudo pacman -S --needed - < pkglist.txt

echo "==> Installing AUR helper..."
if ! command -v yay &> /dev/null; then
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si
    cd "$(dirname "$0")"
fi

echo "==> Restoring AUR packages..."
yay -S --needed - < pkglist-aur.txt

echo "==> Done! Run: exec \$SHELL"
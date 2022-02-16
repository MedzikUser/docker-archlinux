#!/bin/bash
set -e -u

# Add Medzik AUR repo
pacman-key --init
pacman-key --recv-key 7A6646A6C14690C0
pacman-key --lsign-key 7A6646A6C14690C0
pacman -U --noconfirm 'https://arch-repo.magicuser.cf/medzikuser-mirrorlist.pkg.tar.xz'

# Install packages
PACKAGES=('base')
PACKAGES+=('wget')
PACKAGES+=('curl')

pacman -Syu --noconfirm ${PACKAGES}

# Clean pacman cache
yes | pacman -Scc

# Create `build` user
useradd --create-home build

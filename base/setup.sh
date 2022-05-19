#!/bin/bash
set -e -u

# Add Medzik AUR repo
pacman-key --init
pacman-key --recv-key 02213A0493457E96
pacman-key --lsign-key 02213A0493457E96
pacman -U --noconfirm 'https://built-aur.medzik.workers.dev/built-mirrorlist.pkg.tar.xz'

# Install packages
PACKAGES=('base')
PACKAGES+=('wget')
PACKAGES+=('curl')

pacman -Syu --noconfirm ${PACKAGES}

# Clean pacman cache
yes | pacman -Scc

# Create `build` user
useradd --create-home build

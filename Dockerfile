FROM archlinux:base-devel

RUN pacman -Syu --noconfirm \
      git \
      base

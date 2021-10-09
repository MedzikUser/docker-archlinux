FROM archlinux:base-devel

RUN useradd -m archie

RUN pacman -Syu --noconfirm \
      git \
      base

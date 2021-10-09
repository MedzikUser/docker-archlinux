FROM archlinux:base-devel

RUN pacman -Syu --noconfirm \
      git \
      base

RUN useradd -m archie

USER archie

RUN mkdir -p /home/archie

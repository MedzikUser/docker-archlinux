FROM archlinux:latest

RUN pacman -Syu --noconfirm \
      base \
      base-devel

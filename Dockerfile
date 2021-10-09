FROM archlinux:latest

RUN sudo pacman -Syu --noconfirm \
      base \
      base-devel

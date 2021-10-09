FROM archlinux:base-devel

RUN pacman -Syu --noconfirm \
      git \
      base

RUN useradd -l -G wheel,storage,power -m archie \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

USER archie

RUN mkdir -p /home/archie

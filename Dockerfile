FROM archlinux:base-devel

RUN pacman -Syu --noconfirm \
      git \
      base

RUN useradd -m -d /build -s /bin/bash archie

ADD sudoers /etc/sudoers

USER archie

RUN echo "archie" | sudo echo "Running 'sudo' for archie: success"

RUN mkdir -p /home/archie

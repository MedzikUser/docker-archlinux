FROM archlinux:base-devel

ADD pacman.conf /etc/pacman.conf

RUN pacman -Syu --noconfirm \
      git \
      git-lfs \
      base \
      wget \
      curl \
      python \
      python-pip \
      python-requests

RUN useradd -m -d /build -s /bin/bash archie

ADD sudoers /etc/sudoers

USER archie

RUN sudo echo "Running 'sudo' for archie: success"

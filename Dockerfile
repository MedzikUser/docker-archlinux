FROM archlinux:base-devel

RUN pacman -Syu --noconfirm \
      git \
      base \
      wget \
      curl

RUN useradd -m -d /build -s /bin/bash archie

ADD sudoers /etc/sudoers

USER archie

RUN sudo echo "Running 'sudo' for archie: success"

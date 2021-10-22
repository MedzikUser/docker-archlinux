FROM archlinux:base-devel

ADD pacman.conf /etc/pacman.conf
ADD mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Syu --noconfirm \
      git \
      git-lfs \
      base \
      wget \
      curl \
      python \
      python-pip \
      python-requests \
 && pacman -Scc

RUN useradd --create-home build

ADD sudoers /etc/sudoers

USER build

RUN sudo echo "Running 'sudo' for build: success"

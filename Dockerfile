FROM archlinux

COPY pacman.conf /etc/pacman.conf
COPY makepkg.conf /etc/makepkg.conf
COPY mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Sy --noconfirm \
      base \
      base-devel \
      yay \
      git \
      git-lfs \
      wget \
      curl \
      pacman-contrib \
      python \
      python-pip \
      python-requests \
      ccache \
      jq \
 && yes | pacman -Scc

RUN useradd --create-home build

COPY sudoers /etc/sudoers

USER build
RUN sudo echo "Running 'sudo' for build: success"

FROM archlinux

COPY pacman.conf /etc/pacman.conf
COPY makepkg.conf /etc/makepkg.conf
COPY mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Sy --noconfirm \
      base \
      base-devel \
      yay \
      git \
      wget \
      curl \
      pacman-contrib \
      ccache \
      clang \
      llvm \
      lld \
      python \
      jq \
 && pacman -Syu --noconfirm \
 && yes | pacman -Scc

RUN useradd --create-home build

COPY sudoers /etc/sudoers

USER build
RUN sudo echo "Running 'sudo' for build: success"

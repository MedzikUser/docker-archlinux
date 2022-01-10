FROM archlinux

RUN pacman-key --init \
 && pacman-key --recv-key 7A6646A6C14690C0 \
 && pacman-key --lsign-key 7A6646A6C14690C0 \
 && pacman -U 'https://arch-repo.magicuser.cf/packages/medzikuser-mirrorlist-2022.1.9-1-any.pkg.tar.xz'

COPY pacman.conf /etc/pacman.conf
COPY makepkg.conf /etc/makepkg.conf
COPY mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Sy --noconfirm \
      base \
      base-devel \
      multilib-devel \
      git \
      wget \
      curl \
      pacman-contrib \
      ccache \
      python \
      jq \
      unzip \
      github-cli \
 && pacman -Syu --noconfirm \
 && yes | pacman -Scc

RUN useradd --create-home build

COPY sudoers /etc/sudoers

USER build
RUN sudo echo "Running 'sudo' for build: success"

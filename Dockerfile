FROM archlinux

RUN pacman-key --init \
 && pacman-key --recv-key 7A6646A6C14690C0 \
 && pacman-key --lsign-key 7A6646A6C14690C0 \
 && pacman -U --noconfirm 'https://arch-repo.magicuser.cf/packages/medzikuser-mirrorlist-latest-any.pkg.tar.xz' \
 && yes | pacman -Scc

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
 && pacman -Syu --noconfirm \
 && yes | pacman -Scc

RUN useradd --create-home build

COPY sudoers /etc/sudoers

USER build
RUN sudo echo "Running 'sudo' for build: success"

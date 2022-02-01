FROM archlinux

COPY resolv.conf /etc/resolv.conf

RUN pacman-key --init \
 && pacman-key --recv-key 7A6646A6C14690C0 \
 && pacman-key --lsign-key 7A6646A6C14690C0 \
 && pacman -U --noconfirm 'https://github.com/archlinux-pkg/packages/releases/download/packages/medzikuser-mirrorlist-2022.1.30-2-any.pkg.tar.xz' \
 && yes | pacman -Scc

COPY pacman.conf /etc/pacman.conf
COPY mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Syu --noconfirm \
 && yes | pacman -Scc

RUN useradd --create-home build

COPY sudoers /etc/sudoers

FROM archlinux

COPY resolv.conf /etc/resolv.conf

RUN pacman -Sy --noconfirm wget \
 && pacman-key --init \
 && pacman-key --recv-key 7A6646A6C14690C0 \
 && pacman-key --lsign-key 7A6646A6C14690C0 \
 && wget https://sourceforge.net/projects/medzik-arch/files/queue/medzikuser-mirrorlist-2022.2.8-2-any.pkg.tar.xz \
 && pacman -U --noconfirm ./medzikuser-mirrorlist-* \
 && yes | pacman -Scc

COPY pacman.conf /etc/pacman.conf
COPY mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Syu --noconfirm \
 && yes | pacman -Scc

RUN useradd --create-home build

COPY sudoers /etc/sudoers

FROM archlinux AS bootstrap

COPY resolv.conf /etc/resolv.conf

RUN pacman -Sy --noconfirm wget \
 && pacman-key --init \
 && pacman-key --recv-key 7A6646A6C14690C0 \
 && pacman-key --lsign-key 7A6646A6C14690C0 \
 && pacman -U --noconfirm 'https://arch-repo.magicuser.cf/medzikuser-mirrorlist.pkg.tar.xz' \
 && yes | pacman -Scc

COPY pacman.conf /etc/pacman.conf
COPY mirrorlist /etc/pacman.d/mirrorlist

RUN pacman -Syu --noconfirm \
 && yes | pacman -Scc

RUN useradd --create-home build

COPY sudoers /etc/sudoers

# Create final image
FROM scratch

COPY --from=bootstrap / /

RUN ldconfig

ENV LANG=en_US.UTF-8
CMD ["/usr/bin/bash"]

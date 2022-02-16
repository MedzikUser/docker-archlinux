FROM medzik/archlinux:base

RUN pacman -Sy base-devel --noconfirm && \
    yes | pacman -Scc

CMD ["/usr/bin/bash"]

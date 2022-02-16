FROM medzik/archlinux:base

RUN pacman -Sy --noconfirm \
        git \
        base-devel \
        multilib-deve && \
    yes | pacman -Scc

CMD ["/usr/bin/bash"]

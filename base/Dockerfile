FROM archlinux AS bootstrap

COPY setup.sh /tmp/setup.sh
COPY resolv.conf /etc/resolv.conf
COPY mirrorlist /etc/pacman.d/mirrorlist

RUN bash /tmp/setup.sh && \
    rm -rf /tmp/*

COPY pacman.conf /etc/pacman.conf
COPY sudoers /etc/sudoers

# Create final image
FROM scratch

COPY --from=bootstrap / /

RUN ldconfig

ENV LANG=en_US.UTF-8

CMD ["/usr/bin/bash"]

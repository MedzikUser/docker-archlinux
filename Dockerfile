FROM archlinux:base-devel

RUN pacman -Syu --noconfirm \
      git \
      base

RUN useradd -l -G wheel,storage,power -m -s /bin/bash -p archie archie \
    && sed -i.bkp -e 's/%sudo\s\+ALL=(ALL\(:ALL\)\?)\s\+ALL/%sudo ALL=NOPASSWD:ALL/g' /etc/sudoers

USER archie

RUN echo "archie" | sudo echo "Running 'sudo' for archie: success"

RUN mkdir -p /home/archie

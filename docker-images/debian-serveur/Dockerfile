FROM debian:latest

RUN apt-get update
RUN apt-get install openssh-server python3 sudo systemd vim net-tools-y
RUN rm -fr /var/lib/apt/lists/* /var/tmp/*

RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN mkdir -p /run/sshd
RUN mkdir -p /var/run/sshd

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp*

RUN systemctl set-default multi-user.target

RUN useradd -m -s /bin/bash -G sudo ansible 
RUN echo 'ansible:ansible' | chpasswd
RUN echo "ansible ALL = (root) NOPASSWD:ALL" > /etc/sudoers.d/ansible

COPY start.sh /

ENTRYPOINT ["/lib/systemd/systemd", "--system", "--unit=multi-user.target"]

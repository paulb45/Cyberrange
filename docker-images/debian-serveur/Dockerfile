FROM debian:latest
#FROM jrei/systemd-debian:latest

RUN apt-get update
RUN apt-get install openssh-server python3 sudo systemd vim -y
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
#RUN /lib/systemd/systemd --system

RUN useradd -m -s /bin/bash ansible 
RUN echo 'ansible:ansible' | chpasswd
RUN echo "ansible ALL = (root) NOPASSWD:ALL" > /etc/sudoers.d/ansible
#WORKDIR /home/ansible/
#USER ansible

#!/bin/sh
#RUN ssh-keygen -A

# récupération de la clé publique du serveur ansible
#RUN until [ -f /tmp/ssh/id_ed25519.pub ]; do sleep 1; done

#RUN mkdir -p /home/ansible/.ssh && \
#    cp /tmp/ssh/id_ed25519.pub /home/ansible/.ssh/authorized_keys && \
#    chown -R ansible:ansible /home/ansible/.ssh && \
#    chmod -R 700 /home/ansible/.ssh

#RUN echo '[Unit]\nDescription=OpenSSH server daemon\nAfter=network.target\n\n[Service]\nExecStart=/usr/sbin/sshd -D\nExecReload=/bin/kill -HUP $MAINPID\nRestart=on-failure\n\n[Install]\nWantedBy=multi-user.target' > /etc/systemd/system/sshd.service
#RUN chmod 664 /etc/systemd/system/sshd.service
#RUN systemctl enable sshd.service

#EXPOSE 22
COPY start.sh /

#CMD ["/usr/sbin/sshd", "-D"]
#RUN sudo /usr/sbin/sshd -D
ENTRYPOINT ["/lib/systemd/systemd", "--system", "--unit=multi-user.target"]
#CMD ["&&", "/usr/sbin/sshd", "-D"]
#CMD systemctl start sshd.service
#exec sudo /usr/sbin/sshd -D -e "$@"

#ENTRYPOINT ["/entrypoint.sh"]
#COPY entrypoint.sh /

#ENTRYPOINT ["/usr/sbin/sshd", "-D"]
#CMD systemctl start sshd


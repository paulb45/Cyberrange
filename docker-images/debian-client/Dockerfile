FROM debian:latest
RUN apt-get update
RUN apt-get install openssh-server python3 sudo -y
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN mkdir -p /run/sshd
RUN useradd -m -s /bin/sh ansible
RUN echo 'ansible ALL = (root) NOPASSWD:ALL' > /etc/sudoers.d/ansible
RUN echo "ansible:ansible" | chpasswd
WORKDIR /home/ansible/
USER ansible
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /

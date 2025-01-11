FROM alpine:latest
RUN apk add --update --no-cache openssh python3 openrc sudo
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication no" >> /etc/ssh/sshd_config
RUN adduser -h /home/ansible -s /bin/sh -D ansible
RUN echo -n 'ansible:ansible' | chpasswd
RUN echo "ansible ALL = (root) NOPASSWD:ALL" > /etc/sudoers.d/ansible
WORKDIR /home/ansible/
USER ansible
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /

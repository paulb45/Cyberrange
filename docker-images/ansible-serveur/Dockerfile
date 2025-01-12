FROM alpine:latest
RUN apk add --update --no-cache openssh openrc su-exec ansible sudo py3-passlib
RUN adduser -h /home/ansible -s /bin/sh -D ansible
RUN echo -n 'ansible:ansible' | chpasswd
RUN echo "ansible ALL = (root) NOPASSWD:ALL" > /etc/sudoers.d/ansible
WORKDIR /home/ansible
USER ansible
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /
CMD ["/sbin/init"]

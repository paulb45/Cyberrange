FROM alpine:latest
RUN apk add --update --no-cache openssh su-exec ansible
RUN adduser -h /home/ansible -s /bin/sh -D ansible
RUN echo -n 'ansible:ansible' | chpasswd
WORKDIR /home/ansible
ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh /
